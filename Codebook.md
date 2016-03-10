# Introduction
The run_analysis.R will performs the process as describe in the project's assignment in the Coursera's Getting and Cleaning Data course.

##Variables
  * features - a data that read from the downloaded files, features.txt
  * activitylabels - a data that read from the downloaded files, activity_labels.txt
  * subjecttrain - a data that read from the downloaded files, subject_train.txt
  * xtrain - a data that read from the downloaded files, x_train.txt
  * ytrain - a data that read from the downloaded files, y_train.txt
  * subjecttest - a data that read from the downloaded files, subject_test.txt
  * xtest - a data that read from the downloaded files, x_test.txt
  * ytest - a data that read from the downloaded files, y_test.txt
  * xdata - a data that combine all data with 'x' labeled
  * ydata - a data that combine all data with 'y' labeled
  * subjectdata -  a data that combine all data with 'subject' labeled
  * meadstd - numeric vector that contain the correct name of the column for xdata
  * alldata - all data xdata,ydata, and subjectdata combined
  * tidydata - tidied data from alldata with average values of each variable

##Process
  1.The library of needed packages will be downloaded and set the working directories into the folder that contain the data.
  2.The data will be read and combine same  type of data by using rbind() function
  3.Only the mean and standard deviation measurement will be extracted and given the name from features.txt files
  4.The activity data set will be named with correct activity name and ID from the given activity_labels.txt files
  5.All data set will be combined into one big data and average the value of each variables for each activity and each subject
  6. tidydata files will be created in the working directories as a result

