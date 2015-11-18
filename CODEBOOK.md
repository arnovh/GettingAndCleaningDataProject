## Data dictionary - HAR_Aggregation.txt

This file contains the data dictionary for this project.
The study design can be found in the README.md file.

Below descriptions are included for the variables/columns in HAR_Aggregation file.

### Subject

Number between 1 and 30 identifying the 30 subjects for which recordings were included in the experiment.

### Activity

Different activities that the subjects performed during meaurements.
This variable can take the follownig self explaining values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### {Domain}{Meaurement}-{Aggregation}[-{XYZ}]

The variables of which the name follow the pattern {Domain}{Meaurement}-{Aggregation}[-{XYZ}] contain the aggregated measurements.

{Domain} is one of the following:
- t : Indicates that the values are time units
- f : Indicates that the values are frequency units

{Meaurement} is one of the following:
- BodyAcc
- GravityAcc
- BodyAccJerk
- BodyGyro
- BodyGyroJerk
- BodyAccMag
- GravityAccMag
- BodyAccJerkMag
- BodyGyroMag
- BodyGyroJerkMag
- BodyAcc
- BodyAccJerk
- fBodyGyro
- BodyAccMag
- BodyAccJerkMag
- BodyGyroMag
- BodyGyroJerkMag
The meaning of these variables is rather techinical and is copied from the source and included below.

{Aggregation} is one of the following:
- Mean : The value is the mean (average) of all source measurements of the source variable for the subject and activity of this measurement.
- Std : The value is the standard deviation of all source measurements of the source variable for the subject and activity of this measurement.

[-{XYZ}] is one of the following
- X : X coordinate
- Y : Y coordinate 
- Z : Z coordinate
This only applies to measurements having X,Y,Z components.


#### Description of the source variables copied from the source

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

