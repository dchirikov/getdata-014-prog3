# Load library

library(plyr)

# Small wrapper to read data
# passing setName ('train' and 'test') features vector to function to assign column names

load.data <- function(setName,features) {
    X_data      <-  read.table(paste('./UCI HAR Dataset/',setName,'/X_'      ,setName,'.txt', sep=''), col.names=features$name)
    y_data      <-  read.table(paste('./UCI HAR Dataset/',setName,'/y_'      ,setName,'.txt', sep=''), col.names='activity')
    subject_data <- read.table(paste('./UCI HAR Dataset/',setName,'/subject_',setName,'.txt', sep=''), col.names='subjectId')
    cbind(y_data,subject_data,X_data)
}

# Downlod and unzip dataset
if (!file.exists('UCI HAR Dataset.zip')) {
    datasetLink <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(datasetLink, destfile='UCI HAR Dataset.zip', method='curl')
}
unzip('UCI HAR Dataset.zip')

# Read fatures.txt data with the names of the columns
features <- read.table('./UCI HAR Dataset/features.txt',col.names=c('id','name'))

# For reading dataset will use 2 anonymous functions. We are taking care about memory footprint.
# (Otherwise we will need to remove temporary variables after reading 'test' and 'train' datasets.)
# Here #1 and #4 are performed
dataSet <- rbind(
    {load.data('test' ,features)},
    {load.data('train',features)}
)
# remove 'features' variable from workspace
rm(features)

# sort dataSet 
dataSet <- arrange(dataSet, subjectId)

# assign activity labels to our dataSet
# point #3
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names=c('id','label'))
dataSet$activity <- factor(dataSet$activity, levels=activityLabels$id, labels=activityLabels$label)
rm(activityLabels)

# fileter 'std' and 'mean' column
# point #2
filteredDataSet <- dataSet[,
    c(
        'activity',
        'subjectId',
        grep('std|mean' ,colnames(dataSet),value=TRUE)
     )
]

rm(dataSet)

# time to calculate average for each measurements for each activity and subject
# #5
meanDataSet <- ddply(
    .data=filteredDataSet,
    .variables=c('activity','subjectId'),
    .fun=function(ds) {
        colMeans(ds[,-c(1,2)])
    }
)

# We can stop here, but let's change column names to represent that we have means values there.
# Add mean prefix for each
colnames(meanDataSet)[-c(1:2)] <- paste('mean.',
                                        colnames(meanDataSet)[-c(1,2)],
                                        sep=''
                                    )

# save mean dataset to file
# #5
write.csv(filteredDataSet, 'filteredDataSet.csv', row.names=FALSE)
write.csv(meanDataSet, 'meanDataSet.csv', row.names=FALSE)
