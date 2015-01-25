# assuming we are running on EN_US locale
# if not, uncomment the next line
Sys.setlocale(category="LC_ALL", locale="English")

# preparing the layout for reading only the variables
# we will use in analysis

featureList <- read.table(
                        "./UCI HAR Dataset/features.txt", 
                        col.names=c("NULL", "Variable"), 
                        colClasses=c("NULL", "character"))
nameList <- featureList$Variable

# we only care about "mean" and "std" variables
# we will not even read all others, mark them as "NULL"
nameList[!grepl("mean|std|Mean", nameList)] <- "NULL"

# format remaining names
# for -mean()-XYZ and -mean()
nameList <- gsub("\\(\\)-", "_", nameList)
nameList <- gsub("\\(?\\)$", "", nameList)
nameList <- gsub("-|\\(|\\)|,", "_", nameList)
# there are typos in the feature.txt of source data, fixing them
nameList <- sub("BodyBody", "Body", nameList)
nameList <- gsub("_+", "_", nameList)

# where there is a name, we'll be reading numeric data
typeList <- nameList
typeList[typeList!="NULL"] <- "numeric"

# read test data
# numeric data
testData <- read.table(
                    "./UCI HAR Dataset/test/X_test.txt", 
                    col.names=nameList, 
                    colClasses=typeList)
# activities
testActivitiesId <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names = c("id"))
# subjects
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                               col.names = c("subject"))
testDataAll <- cbind(testSubjects, testActivitiesId, testData)

# read training data
trainData <- read.table(
                    "./UCI HAR Dataset/train/X_train.txt", 
                    col.names=nameList, 
                    colClasses=typeList)
# activities
trainActivitiesId <- read.table("./UCI HAR Dataset/train/y_train.txt",
                               col.names = c("id"))
# subjects
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                           col.names = c("subject"))
trainDataAll <- cbind(trainSubjects, trainActivitiesId, trainData)

# assembling the full dataset
ds <- rbind(trainDataAll, testDataAll)

# adding activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                             col.names = c("id", "activity"))
ds <- merge(activityLabels, ds)
# drop the first column (activity id)
ds <- ds[, 2:ncol(ds)]

tidyDs <- aggregate(.~subject+activity, data = ds, mean)

write.table(tidyDs[order(tidyDs$subject, tidyDs$activity), ], "tidy_data.txt", row.name=FALSE)

