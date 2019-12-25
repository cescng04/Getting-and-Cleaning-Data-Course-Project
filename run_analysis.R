# Read the test and training sets and merge into one dataset
test = read.fwf("C:/Users/WeiJie/Desktop/UCI HAR Dataset/test/X_test.txt", width = rep(16, times = 561), header = F, sep = "\t")
test_lab = read.table("C:/Users/WeiJie/Desktop/UCI HAR Dataset/test/y_test.txt", header = F)
test_sub = read.table("C:/Users/WeiJie/Desktop/UCI HAR Dataset/test/subject_test.txt", header = F)
test = cbind(test_sub, test_lab, test)
train = read.fwf("C:/Users/WeiJie/Desktop/UCI HAR Dataset/train/X_train.txt", width = rep(16, times = 561), header = F, sep = "\t")
train_lab = read.table("C:/Users/WeiJie/Desktop/UCI HAR Dataset/train/y_train.txt", header = F)
train_sub = read.table("C:/Users/WeiJie/Desktop/UCI HAR Dataset/train/subject_train.txt", header = F)
train = cbind(train_sub, train_lab, train)
rm(test_lab, test_sub, train_lab, train_sub)
colnames(test)[1:2] = c("Subject", "Activity")
colnames(train)[1:2] = c("Subject", "Activity")
df = rbind(test, train)

# Extract mean and standard deviation columns
df = df[, c(3:ncol(df),1:2)]
df = df[, c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543,562:563)]

# Replace the activity labels with their corresponding description
df$Activity = ifelse(df$Activity == 1, "WALKING", df$Activity)
df$Activity = ifelse(df$Activity == 2, "WALKING_UPSTAIRS", df$Activity)
df$Activity = ifelse(df$Activity == 3, "WALKING_DOWNSTAIRS", df$Activity)
df$Activity = ifelse(df$Activity == 4, "SITTING", df$Activity)
df$Activity = ifelse(df$Activity == 5, "STANDING", df$Activity)
df$Activity = ifelse(df$Activity == 6, "LAYING", df$Activity)

# Rename the column names of the dataset
labels = read.table("C:/Users/WeiJie/Desktop/UCI HAR Dataset/features.txt", header = F, colClasses = "character")
labels = labels[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543),]
colnames(df) = c(labels$V2, "Subject", "Activity")
df = df[, c(67:68,1:66)]
rm(test, train, labels)

# Create the second dataset
df1 = aggregate(df[-c(1,2)], list(Subject = df$Subject, Activity = df$Activity), mean)
write.table(df1, "C:/Users/WeiJie/Desktop/new_data.txt", row.names = F)