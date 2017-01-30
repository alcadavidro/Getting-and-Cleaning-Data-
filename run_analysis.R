## Step 1: creating the files for downloading the data
Getting_Cleaning_Data <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if(!file.exists('./data')){
    project_files <- './data/Getting_Cleaning_data.zip'
    dir.create('./data')
    download.file(url = Getting_Cleaning_Data, destfile = project_files, method = 'curl')
}
if(!file.exists('UCI HAR Dataset')){
    unzip(project_files)
}

### Setp 2: Loading the feature, activity training and test sets
library(reshape2)
# Features and Activities
features <- read.table('UCI HAR Dataset/features.txt', col.names = c('id', 'Feature'))
activity <- read.table('UCI HAR Dataset/activity_labels.txt',col.names = c('id', 'Activity'))
#Train sets
Data_train <- read.table('UCI HAR Dataset/train/X_train.txt')
labels_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
#Test sets
Data_test <- read.table('UCI HAR Dataset/test/X_test.txt')
labels_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

### Step 3: Transform the features dataframe to subset the Data_train and Data_tests, using only the mean and std columns
grep('*mean*|*std*', features$Feature, value = TRUE) # looking the variables which includes the mean or std of a measurement
project_features <- grep('*mean*|*std*', features$Feature) # subsetting them
features_labels <- features[project_features,] #getting the names for using them latter
features_labels$Feature<- gsub('*-mean*', '_Mean_', features_labels$Feature) #changing the mean label for better understanding
features_labels$Feature <- gsub('*-std*', '_Std_', features_labels$Feature) #changing the std label for better understanding
Data_train <- Data_train[,project_features]
Data_test <- Data_test[,project_features]

### Step 4: Merging the data and name each appropriartely
Complete_Data_train <- cbind(subject_train, labels_train, Data_train)
Complete_Data_test <- cbind(subject_test, labels_test, Data_test)
Big_Data <- rbind(Complete_Data_train, Complete_Data_test)
Data_names <- c("subject", "activity", features_labels$Feature)
colnames(Big_Data) <- Data_names

### Step 5: labaling activities as factors and subject too to get the final Tidy Data called as Big_data
activity$Activity <- as.character(activity$Activity)
Big_Data$activity <- factor(Big_Data$activity, levels = activity$id, labels = activity$Activity)
Big_Data$subject <- as.factor(Big_Data$subject)

### Step 6: Creating the new Tidy Data that has the average of each variable for each activity and each subject

Variables_means <- reshape2::melt(Big_Data, id = c("subject", "activity"), measure.vars = features_labels$Feature)
Variables_means <- reshape2::dcast(Variables_means, subject + activity ~ variable,mean)
### Step 7: Saving the Tidy datasets
if(!file.exists('./Tidy_datasets')){
    dir.create('./Tidy_datasets')
    write.table(Big_Data, file = './Tidy_datasets/Smartphone_dataset.txt')
    write.table(Variables_means, file = './Tidy_datasets/Smartphone_dataset_means.txt')
}

