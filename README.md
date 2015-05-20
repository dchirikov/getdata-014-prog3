# getdata-014-prog3
Programming assignment for Coursera's course "Getting and Cleaning Data" (getdata-014)

Includes

1. Script [run_analysis.R](run_analysis.R) which downloads, processes and cleans data from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. The output of [run_analysis.R](run_analysis.R) is two csv files [meanDataSet.csv](meanDataSet.csv) and [filteredDataSet.csv](filteredDataSet.csv):
    - [filteredDataSet.csv](filteredDataSet.csv) - contains columns with standart deviation and mean for every measurement.
    - [meanDataSet.csv](meanDataSet.csv) - contains columns with averages of each variable for each activity and each subject.
3. [CodeBook.md](CodeBook.md) - a code book that describes the variables, the data, and any transformations or work that performed to clean up the data.
4. This [README.md](README.md).

## Description of the data.

From this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

