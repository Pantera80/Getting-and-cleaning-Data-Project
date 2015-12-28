# Getting-and-cleaning-Data-Project

Human Activity Recognition Using Smartphones Dataset
Version 2.0
==================================================================
Daniel Romero Perez
==================================================================

Original Version
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The current dataset is a tidy version of the RAW dataset which can be download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Initially, the sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'FeaturesNames.txt' for more details. 

For each subject it is provided:
======================================
- A number identifying each the subject who carried out the experiment.
- Its activity label and the associated number.
- A 66-feature vector with time and frequency domain averaged variables.

The dataset includes the following files:
=========================================

- 'README.md'

- 'TidyData.txt': Contain all the averaged 66 features for each subject and activity.

- 'CodeBook.Rmd': Description of all variables.


The current tidy version was obtain as follows:
=========================================

1.  The original training and testing sets were merged to create one data set.
2.  Only the measurements on the mean and standard deviation for each measurement were extracted . 
3.  Descriptive activity names were set for each activity carried out for each of the 30 subjects.
4.  Descriptive variable names. 
5.  A final data set was created with the average of each variable for each activity and each subject.

For a more completed information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
