#Read in the data
x_test <- read.table("UCI HAR Dataset//test/X_test.txt")
y_test <- read.table("UCI HAR Dataset//test/y_test.txt", colClasses=c("factor"))
subject_test <- read.table("UCI HAR Dataset//test/subject_test.txt", colClasses=c("factor"))
x_train <- read.table("UCI HAR Dataset//train/X_train.txt")
y_train <- read.table("UCI HAR Dataset//train/y_train.txt", colClasses=c("factor"))
subject_train <- read.table("UCI HAR Dataset//train/subject_train.txt", colClasses=c("factor"))
features <- read.table("UCI HAR Dataset//features.txt", header=F, colClasses=c("numeric","character"))

#add column names to the data
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2

colnames(y_test) <- c("training_label","subject")
colnames(y_train) <- c("training_label","subject")
#Extracts only the measurements on the mean and standard deviation
#and merges test with lables and subjects
test <- cbind(y_test,subject_test,x_test[,grep("mean", colnames(x_test))],x_test[,grep("std", colnames(x_test))])
train <- cbind(y_train,subject_train,x_train[,grep("mean", colnames(x_train))],x_train[,grep("std", colnames(x_train))])

all <- rbind(test,train)
colnames(all)[1:2] <- c("training_label","subject")

##Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset//activity_labels.txt", colClasses=c("factor"))

desc_small <- merge(all, activity, by.x='training_label', by.y='V1')
colnames(desc_small)[82] <- "activity_name"

##Appropriately labels the data set with descriptive variable names.
#Done as I went along.

##Creates a second, independent tidy data set with the average of each variable
##for each activity and each subject
agg_small<-aggregate(desc_small, by=list(desc_small$subject, desc_small$activity_name),
  FUN=mean, na.rm=T)

#clean up extra columns
agg_small$activity_name <- NULL
agg_small$subject <- NULL
colnames(agg_small)[1:2] <- c("training_label", "activity_name")

#write final dataset
write.table(agg_small, file="tidy_data.txt", row.names=FALSE)