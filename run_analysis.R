# Function getRelevantData retrieves a dataset from a Human Activity Recognition Using Smartphones Data Set zipfile
# as it can be obtained from URL http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Argument zipfile is the name of the zip file which much appear in the working directory
# Argument folder is one of "test", "train". 
# The result is a data frame containing variables
# - For all std() and mean() features in the data set, e.g. "tBodyAcc-mean-X", "tBodyAcc-mean-Y", ...
# - Subject containing the number identifying the subject. Values: 1-30. Source: subject_{test/train}.txt
# - Activity containing the label of the activity. Values: "LAYING", "SITTING", ... Sources: activity_labels.txt, subject_{test,train}.txt
getRelevantData <- function( zipfile, folder ) {
  
  connection <- unz( zipfile, "UCI HAR Dataset/features.txt" )
  features <- as.character( read.table( connection, strip.white = TRUE, dec = ".", fill = TRUE, quote="\"" )$V2 )
  relevantFeatures <- grep( "-std\\(\\)|-mean\\(\\)", features )
  
  connection <- unz( zipfile, "UCI HAR Dataset/activity_labels.txt" )
  activities <- as.character( read.table( connection, strip.white = TRUE, dec = ".", fill = TRUE, quote="\"" )$V2 )
  
  connection <- unz( zipfile, paste( "UCI HAR Dataset/", folder, "/X_", folder, ".txt", sep = "" ) )
  data <- read.table( connection, col.names = features, strip.white = TRUE, dec = ".", fill = TRUE, quote="\"" )
  data <- data[,relevantFeatures]
  names(data) <- gsub( "\\(\\)", "", features[relevantFeatures] )
  
  connection <- unz( zipfile, paste( "UCI HAR Dataset/", folder, "/y_", folder, ".txt", sep = "" ) )
  activityData <- read.table( connection, col.names = "ActivityCode", strip.white = TRUE, dec = ".", fill = TRUE, quote="\"" )
  activityData$Activity <- activities[activityData$ActivityCode]
  stopifnot (nrow(activityData) == nrow(data))
  data$Activity <- factor( activityData$Activity )
  remove(activityData)
  
  connection <- unz( zipfile, paste( "UCI HAR Dataset/", folder, "/subject_", folder, ".txt", sep = "" ) )
  subject <- read.table( connection, col.names = "Subject", strip.white = TRUE, dec = ".", fill = TRUE, quote="\"" )
  stopifnot (nrow(subject) == nrow(data))
  data$Subject <- factor( subject$Subject )
  remove(subject)
  
  data
}

# Set working directory
# setwd( "C:/Users/arno/Documents/RHome/GettingAndCleaning/Project" )

# Define URL where input zip file can be downloaded from
inputFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Define  local name of the input zip file 
inputFileLocal <- "getdata_projectfiles_UCI HAR Dataset.zip"
outputFile <- "HAR_Aggregation.txt" 

# If the zipfile does not appear in the working directory, try to download it
if (!file.exists(inputFileLocal)){
  download.file( inputFileURL, inputFileLocal )
}

# Retrieve the testdata and traindata and append them as rawData with rbind.
testData <- getRelevantData ( inputFileLocal, "test" )
trainData <- getRelevantData ( inputFileLocal, "train" )
rawData <- rbind( testData, trainData )
names(rawData) <- names(testData) # rbind messes up column names

# Group the rawData on combi of Activity and subject
groupedData <- split( rawData, list( rawData$Activity, rawData$Subject ), drop = TRUE )
# Aggregate the mean/std variables (1-66) by taking the means
aggregatedData <- data.frame( t( sapply( groupedData, function(x){ colMeans(x[,1:66]) } ) ) )
# add columns for the groups: Activity and Subject
aggregatedData$Activity <- sapply( groupedData, function(x){ c( Activity = as.character(x$Activity)[1] ) } ) 
aggregatedData$Subject <- sapply( groupedData, function(x){ c( Subject = as.integer(as.character(x$Subject)[1] ) ) } ) 
# Reset the names from rawData since somehow they are messed up again
names(aggregatedData) <- names(rawData)
# Re-order the columns to have Subject and Activity as first columns
aggregatedData <- aggregatedData[, append( c(68,67), 1:66 )]

# Write the tidy data to file
write.table( aggregatedData, file=outputFile, row.name = FALSE )

# Return the aggregated data
# aggregatedData


