# Code Book
## processing data with [run_analysis.R](run_analysis.R)

Script does following in the current folder.

1. Download Human Activity Recognition data from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip it.
3. Merges two sets *X_test.txt* and *X_train.txt* data into single dataset using *features.txt* for naming column.
4. Uses *y_test.txt*, *y_train.txt*, *subject_train.txt*, *subject_test.txt* to tie every row in dataset to subject and activity type, by creating two additional columns 'subjectId' and 'activity'.
5. Using *activity_labels.txt* encodes activity to factors with human readable names.
6. Filters big dataset to smaler dataset with columns contain only mean and standart deviation measurements.
7. Add 'mean.' preffix to each mesurement column.
8. Creates tidy data set with the average of each variable for each activity and each subject.
9. Writes two last datasets to csv files. To [filteredDataSet.csv](filteredDataSet.csv) and [meanDataSet.csv](meanDataSet.csv) respectively.

## Columns description for [filteredDataSet.csv](filteredDataSet.csv)

[filteredDataSet.csv](filteredDataSet.csv) contains following columns:

- activity
- subjectId
- tBodyAcc.mean...X
- tBodyAcc.mean...Y
- tBodyAcc.mean...Z
- tBodyAcc.std...X
- tBodyAcc.std...Y
- tBodyAcc.std...Z
- tGravityAcc.mean...X
- tGravityAcc.mean...Y
- tGravityAcc.mean...Z
- tGravityAcc.std...X
- tGravityAcc.std...Y
- tGravityAcc.std...Z
- tBodyAccJerk.mean...X
- tBodyAccJerk.mean...Y
- tBodyAccJerk.mean...Z
- tBodyAccJerk.std...X
- tBodyAccJerk.std...Y
- tBodyAccJerk.std...Z
- tBodyGyro.mean...X
- tBodyGyro.mean...Y
- tBodyGyro.mean...Z
- tBodyGyro.std...X
- tBodyGyro.std...Y
- tBodyGyro.std...Z
- tBodyGyroJerk.mean...X
- tBodyGyroJerk.mean...Y
- tBodyGyroJerk.mean...Z
- tBodyGyroJerk.std...X
- tBodyGyroJerk.std...Y
- tBodyGyroJerk.std...Z
- tBodyAccMag.mean..
- tBodyAccMag.std..
- tGravityAccMag.mean..
- tGravityAccMag.std..
- tBodyAccJerkMag.mean..
- tBodyAccJerkMag.std..
- tBodyGyroMag.mean..
- tBodyGyroMag.std..
- tBodyGyroJerkMag.mean..
- tBodyGyroJerkMag.std..
- fBodyAcc.mean...X
- fBodyAcc.mean...Y
- fBodyAcc.mean...Z
- fBodyAcc.std...X
- fBodyAcc.std...Y
- fBodyAcc.std...Z
- fBodyAcc.meanFreq...X
- fBodyAcc.meanFreq...Y
- fBodyAcc.meanFreq...Z
- fBodyAccJerk.mean...X
- fBodyAccJerk.mean...Y
- fBodyAccJerk.mean...Z
- fBodyAccJerk.std...X
- fBodyAccJerk.std...Y
- fBodyAccJerk.std...Z
- fBodyAccJerk.meanFreq...X
- fBodyAccJerk.meanFreq...Y
- fBodyAccJerk.meanFreq...Z
- fBodyGyro.mean...X
- fBodyGyro.mean...Y
- fBodyGyro.mean...Z
- fBodyGyro.std...X
- fBodyGyro.std...Y
- fBodyGyro.std...Z
- fBodyGyro.meanFreq...X
- fBodyGyro.meanFreq...Y
- fBodyGyro.meanFreq...Z
- fBodyAccMag.mean..
- fBodyAccMag.std..
- fBodyAccMag.meanFreq..
- fBodyBodyAccJerkMag.mean..
- fBodyBodyAccJerkMag.std..
- fBodyBodyAccJerkMag.meanFreq..
- fBodyBodyGyroMag.mean..
- fBodyBodyGyroMag.std..
- fBodyBodyGyroMag.meanFreq..
- fBodyBodyGyroJerkMag.mean..
- fBodyBodyGyroJerkMag.std..
- fBodyBodyGyroJerkMag.meanFreq..

Description of the column goes from *features_info.txt* file:

```
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
```

The first two columns in *filteredDataSet.csv* represent activity type (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and id of the subject who performed this activity (from 1 to 30).

## Columns description for [meanDataSet.csv](meanDataSet.csv)

[meanDataSet.csv](meanDataSet.csv) contains following columns:

- activity
- subjectId
- mean.tBodyAcc.mean...X
- mean.tBodyAcc.mean...Y
- mean.tBodyAcc.mean...Z
- mean.tBodyAcc.std...X
- mean.tBodyAcc.std...Y
- mean.tBodyAcc.std...Z
- mean.tGravityAcc.mean...X
- mean.tGravityAcc.mean...Y
- mean.tGravityAcc.mean...Z
- mean.tGravityAcc.std...X
- mean.tGravityAcc.std...Y
- mean.tGravityAcc.std...Z
- mean.tBodyAccJerk.mean...X
- mean.tBodyAccJerk.mean...Y
- mean.tBodyAccJerk.mean...Z
- mean.tBodyAccJerk.std...X
- mean.tBodyAccJerk.std...Y
- mean.tBodyAccJerk.std...Z
- mean.tBodyGyro.mean...X
- mean.tBodyGyro.mean...Y
- mean.tBodyGyro.mean...Z
- mean.tBodyGyro.std...X
- mean.tBodyGyro.std...Y
- mean.tBodyGyro.std...Z
- mean.tBodyGyroJerk.mean...X
- mean.tBodyGyroJerk.mean...Y
- mean.tBodyGyroJerk.mean...Z
- mean.tBodyGyroJerk.std...X
- mean.tBodyGyroJerk.std...Y
- mean.tBodyGyroJerk.std...Z
- mean.tBodyAccMag.mean..
- mean.tBodyAccMag.std..
- mean.tGravityAccMag.mean..
- mean.tGravityAccMag.std..
- mean.tBodyAccJerkMag.mean..
- mean.tBodyAccJerkMag.std..
- mean.tBodyGyroMag.mean..
- mean.tBodyGyroMag.std..
- mean.tBodyGyroJerkMag.mean..
- mean.tBodyGyroJerkMag.std..
- mean.fBodyAcc.mean...X
- mean.fBodyAcc.mean...Y
- mean.fBodyAcc.mean...Z
- mean.fBodyAcc.std...X
- mean.fBodyAcc.std...Y
- mean.fBodyAcc.std...Z
- mean.fBodyAcc.meanFreq...X
- mean.fBodyAcc.meanFreq...Y
- mean.fBodyAcc.meanFreq...Z
- mean.fBodyAccJerk.mean...X
- mean.fBodyAccJerk.mean...Y
- mean.fBodyAccJerk.mean...Z
- mean.fBodyAccJerk.std...X
- mean.fBodyAccJerk.std...Y
- mean.fBodyAccJerk.std...Z
- mean.fBodyAccJerk.meanFreq...X
- mean.fBodyAccJerk.meanFreq...Y
- mean.fBodyAccJerk.meanFreq...Z
- mean.fBodyGyro.mean...X
- mean.fBodyGyro.mean...Y
- mean.fBodyGyro.mean...Z
- mean.fBodyGyro.std...X
- mean.fBodyGyro.std...Y
- mean.fBodyGyro.std...Z
- mean.fBodyGyro.meanFreq...X
- mean.fBodyGyro.meanFreq...Y
- mean.fBodyGyro.meanFreq...Z
- mean.fBodyAccMag.mean..
- mean.fBodyAccMag.std..
- mean.fBodyAccMag.meanFreq..
- mean.fBodyBodyAccJerkMag.mean..
- mean.fBodyBodyAccJerkMag.std..
- mean.fBodyBodyAccJerkMag.meanFreq..
- mean.fBodyBodyGyroMag.mean..
- mean.fBodyBodyGyroMag.std..
- mean.fBodyBodyGyroMag.meanFreq..
- mean.fBodyBodyGyroJerkMag.mean..
- mean.fBodyBodyGyroJerkMag.std..
- mean.fBodyBodyGyroJerkMag.meanFreq..

Measurement description is similar to [filteredDataSet.csv section](CodeBook.md#columns-description-for-filtereddatasetcsv), but 'mean.' preffix was added to show that the data represents the average of each variable for each activity and each subject.
