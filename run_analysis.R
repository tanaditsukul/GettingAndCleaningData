library(plyr)

setwd('C:/Users/Diarmuid/Documents/UCI HAR Dataset/');

# 1 Merge the training and test sets to create one data set

# Read each files into variables
features     = read.table('./features.txt',header=FALSE);
activitylabels = read.table('./activity_labels.txt',header=FALSE);

subjecttrain = read.table('./train/subject_train.txt',header=FALSE); 
xtrain       = read.table('./train/x_train.txt',header=FALSE); 
ytrain       = read.table('./train/y_train.txt',header=FALSE); 

subjecttest = read.table('./test/subject_test.txt',header=FALSE); 
xtest       = read.table('./test/x_test.txt',header=FALSE); 
ytest       = read.table('./test/y_test.txt',header=FALSE); 

# combind dataset for 'x' 'y' and 'subject'
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subjectdata <- rbind(subjecttrain, subjecttest)

# 2 Extract only the measurements on the mean and standard deviation for each measurement

# get only columns with pattern mean() or std()
meanstd <- grep("-(mean()|std())", features[, 2])

xdata <- xdata[, meanstd]
names(xdata) <- features[meanstd, 2]

# 3 Use descriptive activity names to name the activities in the data set

ydata[, 1] <- activitylabels[ydata[, 1], 2]
names(ydata) <- "activity"

# 4 Appropriately label the data set with descriptive variable names
names(subjectdata) <- "subject"

# combind all the data into one dataset
alldata <- cbind(xdata, ydata, subjectdata)

# 5 Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

# Find mean excluding column of activity & Subject
Ncol<-ncol(alldata)-2
tidydata <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:Ncol]))

write.table(tidydata, "tidydata.txt", row.names=FALSE)

