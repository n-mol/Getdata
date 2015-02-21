# Read data to R
test <- read.table(".\\test\\X_test.txt",sep = "",header=FALSE)
test_l <- read.table(".\\test\\Y_test.txt", sep = "", header = FALSE)
train <- read.table(".\\train\\X_train.txt", sep = "", header = FALSE, quote = "")
train_l <- read.table(".\\train\\Y_train.txt", sep = "", header = FALSE)
feat <- read.table(".\\features.txt", sep = "", header = FALSE, quote = "")
subj_test <- read.table(".\\test\\subject_test.txt", sep = "", header = FALSE)
subj_train <- read.table(".\\train\\subject_train.txt", sep = "", header = FALSE)
activ <- read.table(".\\activity_labels.txt", sep = "", header = FALSE, quote = "")

# Combine test and train data
dat <- rbind(test, train)
colnames(dat) <- as.character(feat$V2)
subj <- rbind(subj_test, subj_train)
colnames(subj) <- c("subject")
label <- rbind(test_l, train_l)
colnames(label) <- c("act")

# Select columns with mean and standart deviation in column names
dat_s <- dat[,grepl("-mean|-std",colnames(dat))]

# Exclud columns containing meanFreq
dat_s1 <- dat_s[, -grep("meanFreq", colnames(dat_s))] 

# Combine subject, acivity label and set of measurements
dat2 <- cbind(subj, label, dat_s1)

colnames(activ) <- c("act", "activity")

# Merge and clean
m_dat <- merge(activ, dat2)
library(dplyr)
d <- select(m_dat, -act)

# Give column names the proper syntax
colnames(d) <- make.names(colnames(d))

# Make the data tidy. It is a long form of tidy data.
library(tidyr)
d1 <- gather(d, activity, subject, tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..)

colnames(d1) <- c("activity", "subject", "measure", "mean")

d2 <- group_by(d1, activity,subject,measure)
tidy_dat <-summarise_each(d2, funs(mean))

# Process tidy data to the file "tidy_data.txt" in working directory
write.table(tidy_dat, file = ".\\tidy_data.txt", row.name=FALSE )
