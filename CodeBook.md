## Getting and Cleaning Data Codebook

### Data

[Source Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

[Data Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The source dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## Data Manipulation

For this project, the following steps were taken to manipulate the original source data and yield the data found in tidy.txt:

1. Imports and merges the training and test data from the original dataset
2. Extracts only the measurements related to mean and standard deviation
3. Uses the activity labels provided in the original dataset to provide better descriptions for the activity which the measurements are taken from.
4. Tidies up the names of the columns.
5. Create a final tidy data set with the average of each measurement for each activity and each subject

## Tidy Data Characteristics

The tidy data set that is created as a result of the above steps has the following characteristics:
- Column 1 contains the activity that was being performed at the time of measurement
- Column 2 contains the subject that was performing the action at the time of the measurement
- Columns 3-81 contain the average of the means and standard deviations of the measurements for that activity and that subject
- When counting for all subjects performing all types of actions, there are 180 total observations in this table. This was condensed down from the original dataset in Step 5 above.
