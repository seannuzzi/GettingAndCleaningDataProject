require(RCurl)
require(plyr)

##
## The purpose of this script is to download and merge distinct datasets for wearables
## for further analysis.  Data is put into a "tidy" format in the tidy subdirectory.
##
## Author: S. Eannuzzi
## Created: July 22, 2017
##

# Does the zip directory already exist?
if (!file.info('UCI HAR Dataset')$isdir) {
  # No, go get the data and unzip it
  # Probably should have a check to see if we have disk space before downloading
  dataFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  dir.create('UCI HAR Dataset')
  download.file(dataFile, 'UCI-HAR-dataset.zip', method='curl')
  unzip('./UCI-HAR-dataset.zip')
}


# "1. Merge the training and the test sets"
# Keep variable names similar to source data
# Note it is a fixed table, not CSV
x.train    <- read.table('./UCI HAR Dataset/train/X_train.txt')
x.test     <- read.table('./UCI HAR Dataset/test/X_test.txt')
# Blindly bind the data. Personally I prefer key joins.
# Corrupt data will be hard to find
x          <- rbind(x.train, x.test)

subj.train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subj.test  <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subj       <- rbind(subj.train, subj.test)

y.train    <- read.table('./UCI HAR Dataset/train/y_train.txt')
y.test     <- read.table('./UCI HAR Dataset/test/y_test.txt')
y          <- rbind(y.train, y.test)

# "2. Extracts only the measurements on the mean and standard deviation for each measurement."
# RegEx match on -mean() and -std() from the features list
features <- read.table('./UCI HAR Dataset/features.txt')
# Fuzzy requirement on "mean".  Technically meanFreq is a mean of a measurement.
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
# Uncomment to eyeball things 
# features[grep("-mean()|-std\\()", features[, 2]),2]
x.mean.sd <- x[, mean.sd]
# We did not actually calculated this... should be compared to raw data?

# "3. Use descriptive activity names to name the activities in the data set"
# Clean up activities.  Simple verb/adjective.  Remove underscore as word separator
# and make lowercase.  Personally, I like the underscore.
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
activities[,2] <- tolower(as.character(activities[, 2]))
activities[,2] <- gsub("_", "", activities[, 2])

# Now fix y data set column names
y[, 1] = activities[y[, 1], 2]
colnames(y) <- 'activity'
colnames(subj) <- 'subject'

# "4. Appropriately labels the data set with descriptive activity names"
# Basically, steal the names from features, remove parenthesis 
# and try to map to what the features_info.txt stated for x data set
names(x.mean.sd) <- features[mean.sd, 2]
names(x.mean.sd) <- gsub("\\(|\\)|\\-", "", names(x.mean.sd))

# Make clearer names - Adding word separators since these are compound names
names(x.mean.sd) <- gsub('[A,a]cc',"Acceleration",names(x.mean.sd))
names(x.mean.sd) <- gsub('[M,m]ag',"Magnitude",names(x.mean.sd))
names(x.mean.sd) <- gsub('^[T,t]',"TimeDomain.",names(x.mean.sd))
names(x.mean.sd) <- gsub('^[F,f]',"FrequencyDomain.",names(x.mean.sd))
names(x.mean.sd) <- gsub('[M,m]ean',".Mean",names(x.mean.sd))
names(x.mean.sd) <- gsub('[S,s]td',".StandardDeviation",names(x.mean.sd))
names(x.mean.sd) <- gsub('[F,f]req\\.',".Frequency",names(x.mean.sd))
names(x.mean.sd) <- gsub('[F,f]req$',"Frequency",names(x.mean.sd))
# No idea what to do with the "jerks" :)

# Bring it all together now
blended <- cbind(subj, x.mean.sd, y)

#View(blended)

# Data should have been zipped IMHO
# ToDo:  Add error checking on write
# Again, poor requirements.  Gleamed that this had to be written
# Uncomment following to update codebook
#str(blended)
write.table(blended, './tidy/blended.txt', row.names = F)

# "5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
# Feels like the averaging loses information
blended.average <- ddply(blended, c("subject","activity"), numcolwise(mean))
#View(blended.average )
# Uncomment following to update codebook
#str(blended.average)
write.table(blended.average, './tidy/blendedaverage.txt', row.names = F)



