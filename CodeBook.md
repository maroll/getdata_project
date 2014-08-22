# Code Book


## Data Used

### Test set
UCI HAR Dataset//test/X_test.txt      -- actual test accelometer measurment, smartphone accelerometer X axis in standard gravity units 'g'

UCI HAR Dataset//test/y_test.txt      -- labels showing which activity was performed     

UCI HAR Dataset//test/subject_test.txt  -- labels showing which activity was performed

### Train set
UCI HAR Dataset//train/X_train.txt    -- actual test accelometer measurment, smartphone accelerometer X axis in standard gravity units 'g'

UCI HAR Dataset//train/y_train.txt    -- labels showing which activity was performed    

UCI HAR Dataset//train/subject_train.txt  -- labels showing which subject did the activity

### Extra sets
UCI HAR Dataset//activity_labels.txt  -- descriptive names for activities performed

## Variables
subject   -- number identifiying subject; factor values from 1 to 30

training_label  -- number identifiying type of activity; factor values from 1 to 6

activity_name   -- descriptive name identifiying type of activity; factor string values

measurment_mean -- mean of all accelometer measurments; smartphone accelerometer X axis in standard gravity units 'g'

measurment_sd   -- standard deviation of all accelometer measurments; smartphone accelerometer X axis in standard gravity units 'g'

## Transformations performed
1. Test data was combined into the _test_ data frame so that: the first column had the training label, the second column the subject names and the remaning columns all the accelometer measurments.

2. Training data was combined into the _train_ data frame so that: the first column had the training label, the second column the subject names and the remaning columns all the accelometer measurments.

3. Test and training data was combined inot the _all_ data frame so that: the first rows correspond to the test subjects and then the rows of the train subjects are added. The format of columns is the same as in 1. and 2.

4. Train and test data were combined into _small_ data frame so that:
  * the first column is the *training_label*
  * the second column is the *subject*
  * the third column is the average accelometer measurments for that subject and training_label. I.e. all the columns in _all_ except the first two columns.
  * the fourth column is the standard deviation of accelometer measurments for that subject and training_label. I.e. all the columns in _all_ except the first two columns.

5. Descriptive activity names were added to the data frame to make _desc_small_ dataset.

6. The data was aggregated to make a new tidy data set _agg_small_ with the average of each variable for each activity and each subject. 
7. _agg_small_ was printed to working directory into _tidy_data.txt_
