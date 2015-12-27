setwd('C:/Users/Becario/Dropbox/Cursos/Coursera/Getting and cleaning Data/Project/UCI HAR Dataset/')

#Reading Data from working directory
X_train <- read.table("train/X_train.txt", quote="\"", comment.char="", na.strings="N/A")
X_test  <- read.table("test/X_test.txt", quote="\"", comment.char="", na.strings="N/A")

labels_train <- read.table("train/y_train.txt", quote="\"", comment.char="", na.strings="N/A")
labels_test  <- read.table("test/y_test.txt", quote="\"", comment.char="", na.strings="N/A")

subject_train <- read.table("train/subject_train.txt", quote="\"", comment.char="", na.strings="N/A")
subject_test  <- read.table("test/subject_test.txt", quote="\"", comment.char="", na.strings="N/A")

features        <- read.table("features.txt", quote="\"", comment.char="", na.strings="N/A")


## Merging Training and Testing data

# Concatenating all separated data by rows 
Subject <- rbind(subject_train, subject_test)
colnames(Subject) <- "Subject.Num"

Labels  <- rbind(labels_train, labels_test)
colnames(Labels) <- "Activity.Num"  

Data    <- rbind(X_train, X_test)
colnames(Data) <- features[,2]

# Merging Subjet number and Activity number
Subject.Activity<- cbind(Subject, Labels)
All.Data <- cbind(Subject.Activity, Data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Features_MeanStd <- grep("mean\\(\\)|std\\(\\)",features$V2,value=TRUE) #var name
All.Data <- All.Data[,Features_MeanStd]
All.Data <- cbind(Subject.Activity, All.Data)

# 3. Uses descriptive activity names to name the activities in the data set 
activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="", na.strings="N/A")
names(activity_labels) <- c("Activity.Num","Activity.Desc")
All.Data <-  merge(activity_labels, All.Data, by="Activity.Num", all.x=TRUE)
All.Data$Activity.Desc <- as.character(All.Data$Activity.Desc)

## Sorting the Dataset by subject and Activity
All.Data$Activity.Desc <- as.character(All.Data$Activity.Desc)
All.Data <- All.Data[with(All.Data,order(Subject.Num, Activity.Num)), ]
# exchange column position starting by Subject and rename all them 
All.Data[,1:3] <- All.Data[ , c(3,1,2)] 
colnames(All.Data)[1:3] <- c("Subject.Num", "Activity.Num", "Activity.Desc")

# 4. Appropriately labels the data set with descriptive variable names.


names(All.Data)<-gsub("std()", "SD", names(All.Data))
names(All.Data)<-gsub("mean()", "Mean", names(All.Data))
names(All.Data)<-gsub("^t", "TimeDomain.", names(All.Data))
names(All.Data)<-gsub("^f", "FrequencyDomain.", names(All.Data))
names(All.Data)<-gsub("Acc", "Accelerometer.", names(All.Data))
names(All.Data)<-gsub("Gyro", "Gyroscope.", names(All.Data))
names(All.Data)<-gsub("Mag", "Magnitude", names(All.Data))
names(All.Data)<-gsub("BodyBody", "Body.", names(All.Data))


# 5. Creates a second,independent tidy data set and ouput it
All.Data2 <- aggregate(. ~Subject.Num - Activity.Desc, All.Data, mean)
All.Data2<-All.Data2[order(All.Data2$Subject.Num,All.Data2$Activity.Num),]
write.table(All.Data2, file = "TidyData.txt",row.name=FALSE)
