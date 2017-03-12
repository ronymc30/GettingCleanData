#activities and features
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt") #6 obs of 2 vars
features <- read.table("./data/UCI HAR Dataset/features.txt") #561 obs of 2 vars

#Train - subjects, X (predictors) & y (responses)
train_Sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") # 7352 obs of 1 vars
train_X <- read.table("./data/UCI HAR Dataset/train/X_train.txt") #7352 obs of 561 vars
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt") #7352 obs of 1 vars

#Test - subjects, X (predictors) & y (responses)
test_Sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt") #2947 obs of 1 vars
test_X <- read.table("./data/UCI HAR Dataset/test/X_test.txt") #2947 obs of 561 vars
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt") #2947 obs of 1 vars

#Fuse subject, X & y for train and test data
train_set <- cbind(train_Sub, train_X, train_y) #7352 obs of 563 vars
test_set <- cbind(test_Sub, test_X, test_y) #2947 obs of 563 vars

#Stack train on top of test to form full set
merged_set <- rbind(train_set, test_set) #10299 obs of 563 vars

#assign colnames to full_set
colnames(merged_set) <- c("subject", as.character(features$V2), "activity")

#keep only mean, std, activity and subject columns
merged_set <- merged_set[,grep("*mean*|*std*|activity|subject", colnames(merged_set))] #10299 obs of 81 vars

#convert subject and activity columns into factors
merged_set$subject <- as.factor(merged_set$subject)
merged_set$activity <- factor(merged_set$activity, levels = activities[,1], labels = activities[,2])

#create tidy_set with the average of each variable for each c(activity,subject)
tidy_set <- aggregate(merged_set, by = list(Subject = merged_set$subject, Activity = merged_set$activity), mean)
tidy_set$subject <- NULL #redundant - replaced with "Subject"
tidy_set$activity <- NULL #redundant - replaced with "Activity"

#output tidy_set into tidy.csv
write.table(tidy_set, "tidy.csv", row.names = FALSE, quote = FALSE, sep=",")
