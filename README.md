## Course Project for Getting and Cleaning Data

### Contents
This repo contains the submission for the Course Project for Getting and Cleaning Data on Coursera.org.

It contains the following files:
* README.md - a file containing a description of the submission and its contents
* CodeBook.md - a file describing the variables, data, and transformations used in this project
* run_analysis.R - the R script that loads and manipulates the data
* tidy.txt - a text file containing the dataset - must be loaded with read.table()

### Running The Script

Source Data - [Found Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Once the data is unzipped, run_analysis.R can be run in the same directory that the data was unzipped. i.e. the script should be in the same directory as the folder 'UCI HAR Dataset'.

Running the script with the data will produce the tidy.txt file. As mentioned above, using this file in later computation requires it to be imported with the read.table() function for best results.

The script performs the following steps:
1. Imports and merges the training and test data from the original dataset
2. Extracts only the measurements related to mean and standard deviation
3. Uses the activity labels provided in the original dataset to provide better descriptions for the activity which the measurements are taken from.
4. Tidies up the names of the columns.
5. Create a final tidy data set with the average of each measurement for each activity and each subject