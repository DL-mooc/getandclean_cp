# getandclean_cp
Course Project for Getting and Cleaning Data

The cleaning process for the *Human Activity Recognition Using Smartphones Dataset* is done by [run_analysis.R](run_analysis.R) file.

The [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is assumed to be unpacked in the working directory of `run_analysis.R`. When unpacked the archive produces the directory `UCI HAR Dataset` with subdirectories `test` and `train`. This directory structure is assumed for the script to run.

The dataset have a list of variables in a separate file `UCI HAR Dataset/features.txt`. As one of the analysis goals was to provide only some select variables and the variables in the original dataset follow naming conventions, the analysis script automatically obtains the list of variables by subsetting and cleaning variables list from `UCI HAR Dataset/features.txt`.

The values of observed variables are separated from data on subjects and observed activities, and furthemore the original study design called for separation of data into training and test subsets. In order to have one set of data the script combines all of that, first subjects and activites to their respective value sets, than training and test data.

In the original dataset the activities are encoded as numbers, for the ease of understanding the information from `UCI HAR Dataset/activity_labels.txt` file is used to provide more intuitive values for the `activity` column added to combined dataset.

As the last step the average values for each subject and activity are calculated. The resulting dataset is then written to file ready to use in any further analysis.

If that analysis is to be done in R, the file should be read by:

```{r}
ds <- read.table("tidy_data.txt", header=TRUE)
```
