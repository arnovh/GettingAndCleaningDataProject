# Getting and cleaning data, course project

- Version: 1.0
- Author: Arno van Haastert

The purpose of this project is transforming a Human Activity Recognition Using Smartphones Dataset into a more aggregated data set.
The resulting aggregated data set contains the averages for each activity and each subject for each variable representing a standard deviation or mean in the original dataset.

## Content of this project

The project includes the following files:

- README.md : This markdown file describing the project
- run_analysis.R : R script that imports data from getdata_projectfiles_UCI HAR Dataset.zip and creates an aggregated data file HAR_Aggregation.txt.
- CODEBOOK.md : A markdown file describing the study design and the data dictionary for HAR_Aggregation.txt

## How to execute this project

The transformation is executed by running R script run_analysis.R in R.
R is a free software environment for statistical computing and graphics.
For details about R see: https://www.r-project.org/

The script run_analysis.R needs either:
- The raw input file "getdata_projectfiles_UCI HAR Dataset.zip" available in the R working directory, OR
- An internet connection allowing the script to download this file 
The script writes the resulting data set as file "HAR_Aggregation.txt" in the R working directory.


## Study design

This project is implemented as course project (excercise) for the coursera course: https://class.coursera.org/getdata-034
The source data for the project can be downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source data is the Human Activity Recognition Using Smartphones Dataset. This data set contains recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
More details about this data set can be found on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The procedure implemented by this project in the R script run_analysis.R executes the following transformation on the source data that must be provided in the R working directory in a file "getdata_projectfiles_UCI HAR Dataset.zip":

1. The list of features is imported from features.txt
2. A list of relevant features is created by reducing features to the ones containing -Mean() or -Std()
3. The list of activity labels is imported from activity_labels.txt
4. The training data is imported from "UCI HAR Dataset\train\X_train.txt", while adding the feature names as column names
5. The training data is reduced to only contain the relevant features
6. The activity codes from "UCI HAR Dataset\train\Y_train.txt" are replaced by their activity labels and added as Activity column in the training data
7. The subject identifiers from "UCI HAR Dataset\train\subject_train.txt" are added as Subject column in the training data
8. Steps 1-7 are repeated for the test data in "UCI HAR Dataset\test (where train in filenames is replaced by test).
9. The training data and test data are combined in a raw data set
10. The raw data measurements are grouped per subject - activity combination
11. The aggregated data set is created by adding in one line per group: (1) the subject id, (2) the activity label (3) for each measurement the average










