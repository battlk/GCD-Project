library(dplyr)

#################### Step 1 ####################
#Read in the testing and training dataset and merge them

#read in the features and activity_labels files for later use with merging
col_labels<-read.table("UCI HAR DATASET/features.txt",header=FALSE)
activities = read.table('UCI HAR DATASET/activity_labels.txt',header=FALSE)

#read in the test datasets and merge them together via cbind()
#column names are changed to allow for more appropriate variable descriptions
x_test<-read.table("UCI HAR DATASET/test/X_test.txt",header=FALSE)
colnames(x_test)<-col_labels[,2]

y_test<-read.table("UCI HAR DATASET/test/Y_test.txt",header=FALSE)
colnames(y_test)<-"activity"

subject_test<-read.table("UCI HAR DATASET/test/subject_test.txt",header=FALSE)
colnames(subject_test)<-"subject"

merged_test<-cbind(y_test, subject_test, x_test)


#read in the training datasets and merge them together via cbind()
#column names are changed to allow for more appropriate variable descriptions
x_train<-read.table("UCI HAR DATASET/train/X_train.txt",header=FALSE)
colnames(x_train)<-col_labels[,2]

y_train<-read.table("UCI HAR DATASET/train/Y_train.txt",header=FALSE)
colnames(y_train)<-"activity"

subject_train<-read.table("UCI HAR DATASET/train/subject_train.txt",header=FALSE)
colnames(subject_train)<-"subject"

merged_train<-cbind(y_train, subject_train, x_train)

#merge the training and test data together via rbind()
merged_total<-rbind(merged_train, merged_test)


#################### Step 2 ####################
#Extract only the measurements pertaining to mean and standard devation calculations

#creates logical vector that holds true for every column with a mean/std and the last two
find_measurements = (grepl("activity",colnames(merged_total)) | grepl("subject",colnames(merged_total)) | grepl("mean",colnames(merged_total)) | grepl("std",colnames(merged_total)));

#subsets merged_total to only include mean/std and the first two columns
merged_total<-merged_total[find_measurements]


#################### Step 3 ####################
#Change activity descriptors from numbers to corresponding activity names
#which are much more descriptive

#apply column names to table of activities for later merges
colnames(activities)<-c('activity','activitytype')

#merge the total data with the activities
finaltotal<-merge(merged_total,activities,by='activity',all.x=TRUE)

#move activity label column to beginning of list and remove the old copy at the end
finaltotal<-mutate(finaltotal, activity=activitytype)
find_measurements = !grepl("activitytype",colnames(finaltotal))
finaltotal<-finaltotal[find_measurements]

#################### Step 4 ####################
#Tidy up variable names/column headers

#iterate through the column names of the table to clean up their descriptors
for (i in 1:length(colnames(finaltotal)))
{
  colnames(finaltotal)[i] = gsub("mean","Mean",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("std","StdDev",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("\\()","",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("^(f)","Freq",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("Mag","Magnitude",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("^(t)","Time",colnames(finaltotal)[i])
  colnames(finaltotal)[i] = gsub("\\()","",colnames(finaltotal)[i])
}

#################### Step 5 ####################
#Compute tidy data set containing averages of each measurement by subject and activity
#Exports dataset to a csv file. Must be read back in with read.table()

tidy = aggregate(finaltotal[,names(finaltotal) != c('activity','subject')],by=list(activity=finaltotal$activity,subject = finaltotal$subject),mean);
write.table(tidy, "tidy.txt", row.name=FALSE)