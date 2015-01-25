# Codebook

The data is the summary of *Human Activity Recognition Using Smartphones Dataset* in the form of averages of observations for each subject and each observed activity.

It is arranged in plain text file, where each line corresponds to an observed activity of one subject. The fields are separated by spaces, strings are inside double quotes. The first line has names for the fields.

The fields are as follows:

* subject — observed subject (numbers 1-30)
* activity - observed activity. One of six possible values:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
* averages of the values of original dataset.

## The values coming from the original dataset

The data contains averages of means (denoted by `_mean_` in the column names) and standart deviations (`_std_`) of the original dataset values:

* Gyroscope signals (tBodyGyro)

* Body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)

* Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

* The magnitude of these three-dimensional signals (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

* Fast Fourier Transform (FFT) of some of these signals (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag). For these there are also present the averages for original freqMeans values.

Original dataset had additional vectors obtained by averaging the signals in a signal window sample. The averages for those are also present in tidy dataset (denoted by `angle_` at the beginning of their names):

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean