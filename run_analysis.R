## Download and unzip the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "prob4") 
unzip("prob4")
library(dplyr)

## read in Test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

## read in test data activity labels
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

## read in train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

## read in train data activity labels
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

## read in features labels
features <- read.table("UCI HAR Dataset/features.txt")

## read in activity labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## read in the subjects for both the training and test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## rename the columns in test & training data to reflect the factors
names(x_test) <- features$V2
names(x_train) <- features$V2

## lookup the activity for each data point using the activity labels
y_test <- y_test %>% 
          inner_join(labels) %>%
          rename(activity_id = V1 , activity_name = V2)

y_train <- y_train %>% 
           inner_join(labels) %>% 
           rename(activity_id = V1 , activity_name = V2)

## stitch together the activity labels and the subject for each data point with the data itself
train <- cbind(x_train, y_train, subject_train)
test <- cbind(x_test, y_test, subject_test)

##combine training and test data
all_data <- rbind(test, train)

##remove duplicate column names 
all_data <- all_data[ , !duplicated(colnames(all_data))]

##rename the column containing Subject ID to be more clear 
all_data <- rename(all_data, subject_id = V1)

## select only those columns containing a mean or a standard deviation and clean up their names
tidy_fulldata <- select(all_data, matches("(mean\\(|std\\(|subject)"))
names(tidy_fulldata) <- sub("\\(","", names(tidy_fulldata))
names(tidy_fulldata) <- sub("\\)","", names(tidy_fulldata))

## export tidy full data to a csv
write.csv(tidy_fulldata, file = "tidy_fulldata.csv")

## create a new summary dataframe that contains the mean of each variable grouped by Subject
summary_data_set <- means_n_stds %>% 
  group_by(subject_id) %>%
  summarise_each(funs(mean(., na.rm = TRUE)))

##export the summary data to a csv
write.csv(summary_data_set, file = "summary_data.csv")
write.table(summary_data_set, file = "summary_data.txt", row.names = FALSE)
