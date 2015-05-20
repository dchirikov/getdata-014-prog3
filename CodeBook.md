# Code Book
## processing data with run_analysis.R

Script does following

1. Download Human Activity Recognition data from [http://archive.ics.uci.edu/](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) site
2. Unzip it
3. Merges two sets test and train data into single dataset using *features.txt* for naming column.
4. Uses *y_test*, *y_train*, *subject_train*, *subject_test* to tie every row in dataset to subject and activity type, by creating two additional columns 'subjectId' and 'activity'.
5. Using *activity_labels.txt* encodes activity to factors with human readable names.
