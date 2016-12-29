# README
### Peer-graded Assignment: Getting and Cleaning Data Course Project

This project pulls data from a remote server and cleans it using R. It requires RCurl library to download the data and dplyr library to manipulate it. 

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Workflow
- The script, # Code Book
### Peer-graded Assignment: Getting and Cleaning Data Course Project

Source files used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script, run_analysis.R, performs the following steps on the dataset. 

- Downloads the data from the remote server
- Unzips the data
- **Locates each of the expected files and loads them into separate dataframes**
-- x_test - Test set.
-- y_test - Test labels.
-- x_train - Training set.
-- y_train - Training labels.
-- features - List of all features.
-- labels - Activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
-- subject_test - Subject ID for each record in test data.
-- subject_train - Subject ID for each record in training data.

- **Manipulates the data in the following ways:**
-- Rename the columns in test & training data (x_test, x_train) to reflect the factors
-- Lookup and apply the activity label for each data point using the activity labels (y_test, y_train)
-- Stitch together the activity labels and the subject for each data point with the data itself (store these interim dataframes in test, train)
-- Combine training and test data in a dataframe called all_data
-- Remove duplicate column names in all_data (in place)
-- Rename the V1 column to reflect it's value, which is Subject_ID
-- Select only those columns containing a mean or a standard deviation (tidy_fulldata)
-- Export this dataframe to a csv (tidy_fulldata.csv)
-- Create a new summary dataframe that contains the mean of each variable grouped by Subject
-- Export the summary data to a csv (summary_data.csv), with the given dependencies, will download the remote file, unzip it and populate the workspace with a handful of intermediate dataframes. 

- The final "tidy" dataframe along with the summary dataframe are also included as csv files (tidy_fulldata.csv and summary_data.csv, respectively)