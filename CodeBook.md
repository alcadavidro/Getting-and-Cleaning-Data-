# Code Book
#### Original data sets
The original data sets contained the data of the experiment detailed in the `README_RAW_DATA.md`; the used ones for creating the two tidy dataset were:
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `X_train.txt`: Training set.
* `y_train.txt`: Training labels.
* `X_test.txt`: Test set.
* `y_test.txt`: Test labels.
* `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* `subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### Analysis script and transformation
The scripts takes the data from the source provided in the link at the README.md file, and perform 7 steps:
* Step 1: Check if there is any directory with the name 'data' to download and store the data, if not, it creates it and downloads the data, then it unzip the data into a directory called 'UCI HAR Dataset'
* Step 2: Loads the features, activities, and data sets (training set and test set) described below. 
    *   Loads the library "reshape2" for further transformations
    *   The features and activities datasets are loaded with column names (id, feature, and id, Activity) respectively
    *   Then the train sets and test set are loaded. 
* Step 3: Transform the features dataframe to subset the Data_train and Data_tests, using only the mean and std columns
    * Using regular expressions, feature set is subsetted to get only the the columns with mean and standar deviation data. 
    * Then, using the new feature set, with the index of the columns that are needed, the Data_train and Data_test are subsetted. 
* Step 4: Merging the data and name each appropriartely
    * Using cbind, and rbind, a complete data set with the train and test data is created, and then with the new feature set, the column names are assigned 
* Step 5: labeling activities as factors and subject too to get the final Tidy Data called as Big_data
    * Using the factor function into the new complete data set, the activity column and subject column are changed into a factor variable with descriptive name.
    * Finally, the first tidy data is complete
* Step 6: Creating the new Tidy Data that has the average of each variable for each activity and each subject
    * Using the 'reshape2' package, the complete data is reshaped into a new tidy data, getting as variables the mean of each variable of the Complete data set for each subject and each activity
* Step 7: Step 7: Saving the Tidy datasets
    * The first and the second tidy data are saved in the local computer as .txt files. 

#### Variables

The new variables in the first tidy data are: 
* `subject`: Volunteer within the age of 19-48 years that performed an activity. Factor Variable
* `activity`: Action performed by the subject, it is labeled as: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. Factor variable with the six levels mentioned above.
For each of the following variables, there is the `Mean` and `Standar deviation` and the XYZ is used to denote 3-axial signals in the X, Y and Z direction
* `tBodyAcc-XYZ`: data captured by the Body accelerometer, captured at a rate of 50 Hz in time measurement. numeric variable
* `tGravityAcc-XYZ`: data captured by the Gravity accelerometer, captured at a rate of 50 Hz in time measurement. numeric variable
* `tBodyAccJerk-XYZ`: body linear acceleration and angular velocity derived in time, to obtain the Jerk signals. numeric variable
* `tBodyGyro-XYZ`:data captured by the Body gyroscope, captured at a rate of 50 Hz in time measurement. numeric variable
* `tBodyGyroJerk-XYZ`:body linear acceleration and angular velocity obtained from the giroscope, derived in time, to obtain the Jerk signals. numeric variable
* `tBodyAccMag`: magnitude that was calculated using the Euclidean norm. numeric variable
* `tGravityAccMag`:magnitude that was calculated using the Euclidean norm. numeric variable
* `tBodyAccJerkMag`:magnitude that was calculated using the Euclidean norm. numeric variable
* `tBodyGyroMag`:magnitude that was calculated using the Euclidean norm. numeric variable
* `tBodyGyroJerkMag`:magnitude that was calculated using the Euclidean norm. numeric variable
* `fBodyAcc-XYZ`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyAccJerk-XYZ`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyGyro-XYZ`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyAccMag`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyAccJerkMag`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyGyroMag`Fast Fourier Transform (FFT)  applied to the reference signal. numeric value
* `fBodyGyroJerkMag`:Fast Fourier Transform (FFT)  applied to the reference signal. numeric value