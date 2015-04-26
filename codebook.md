---
title: "CodeBook"
author: "Julie Steury"
date: "Saturday, April 25, 2015"
output: html_document
---

Codebook for Coursera Getting and Cleaning Data project


This code book explains the data in the TidyData table produced as output in the course project.  For more detailed understanding of the variables, it is necessary to refer to the original code book, features_info.txt, which is part of the github repository.  

##Introduction & Background
The assignment was to combine two datasets from a UC Irvine study Samsung motion study.  The training and test datasets were to be combined into a single dataset.  Clean the data as needed and then filter down to just the set of variables representing the mean and standard deviation calculations.  Then finally, to create a new tidy data set with that summarized the mean and standard deviation of those mean and sdev variable, where mean and std dev were calculated for each subject and activity.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Approach
I then reviewed the list of filenames in the zip file, and identified the indexes for just the relevant files.  I identified these indexes as relevant:  c(1,2,16,17,18,30,31,32).  

Using these indexes, I looped through each file and read the relevant ones into a raw data frame, rawdata.  In each iteration, I added the raw data frame to a temporary list of data frames "dfList".  This resulted in my having the subject, activity, and observation data for each of the test and training data sets.  

Using the cbind command, I combined the subject, activity, and observation data frames to build a complete training data frame and a complete test data frame. My approach was as follows.

By the relative dimensions of these data frames, I could see that the dataframes would align when combined.  For example, the Activity dimensions were 6 obs of 2 variables, naming the activities.  The features dataframe, was 561 observations of 2 variables, linking the iD to a more descriptive feature name. The subject dataframe was 2947 observations of 1 variable, the subject ID.  And then the training data was 2947 of the 561 variables, with corresponding activity and subject data frames with 2947 observations of 1 and 2 variables, activity and subject, repectively. 

I similarly combined the testing data observations with subjects and activities with the only material difference being that the testing data had 7352 observations.

With complete training and test data frames formed, 2947 and 7352 observations,(training and testing data frames respectively) of 563 variables each (subject, activities, and 561 features), I then used the rbind command to combine into a single CombinedData dataframe, with a total of 10299 observations.

Next step was to extract just the relevant columns, those that corresponded to mean and standard deviation of other measurements.  I decided to include only those with a mean() or sd() designation at the end of the variable name, dropping 6 variables that included "MeanFreq" in their name.  I believe that Mean Freq designated a particular type of measurement and not a mean of other measurements.  But honestly, this was a relatively arbitrary assessment on my part to select appropriate variables per assignment instructions.

The result: 66 variables (features) in addition to the Subject and Activity columns.
I then cleaned up the column names, excluding "()", and "-" as special characters and replacing t and f with Time and Freq.
So I went with a naming convention that was complete and readable but not too long.  e.g.  "TimeBodyAccMEAN-X" for example or "FreqBodyAccMagMEAN".

To create the tidy summary dataset, I used the dplyr package and group by function, to group my final data set by subject and activity.  I then calculated the summary data mean and standard deviation using the Summarise function.

Last step in my project was to write the tidy data to a file and then read it back in to check its validity.  
  
Additional information about the study and the measurements is included in the original codebook:   "features_info.txt" 

##Data Dictionary for Tidy Table Results

The resulting output is a summary table of mean ("mean") and standard deviation ("sd") variables, calculated over all observations for each subject and each activity.  This results in a table of 180 observations for 132 variables with 2 identifiers (subject and activity).

###Identifiers
Subject    Subject  identifier	Integer, 1-30
Activities	Activity Name	Character

*bold*Time  & Body Accelerometer Variables*bold*
The Time Body Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  The body measurements are acceleration signals calculated by the accelerometer .  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.
All values are of class numeric, with values between -1 and 1.

* TimeBodyAccMEAN_X_mean
* TimeBodyAccJerkMEAN_X_mean
* TimeBodyAccJerkMEAN_Y_mean
* TimeBodyAccJerkMEAN_Z_mean
* TimeBodyAccJerkSDEV_X_mean
* TimeBodyAccJerkSDEV_Y_mean
* TimeBodyAccJerkSDEV_Z_mean
* TimeBodyAccMagMEAN_mean
* TimeBodyAccMagSDEV_mean
* TimeBodyAccJerkMagMEAN_mean
* TimeBodyAccJerkMagSDEV_mean
* TimeBodyAccJerkMEAN_X_sd
* TimeBodyAccJerkMEAN_Y_sd
* TimeBodyAccJerkMEAN_Z_sd
* TimeBodyAccJerkSDEV_X_sd
* TimeBodyAccJerkSDEV_Y_sd
* TimeBodyAccJerkSDEV_Z_sd
* TimeBodyAccMagMEAN_sd
* TimeBodyAccMagSDEV_sd
* TimeBodyAccJerkMagMEAN_sd
* TimeBodyAccJerkMagSDEV_sd

###Time & Gravity Accelerometer Variables

The Time Gravity Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The gravity measurements are acceleration signals calculated by the accelerometer .   "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

* TimeGravityAccMEAN_X_mean
* TimeGravityAccMEAN_Y_mean
* TimeGravityAccMEAN_Z_mean
* TimeGravityAccSDEV_X_mean
* TimeGravityAccSDEV_Y_mean
* TimeGravityAccSDEV_Z_mean
* TimeGravityAccMagMEAN_mean
* TimeGravityAccMagSDEV_mean
* TimeGravityAccMEAN_X_sd
* TimeGravityAccMEAN_Y_sd
* TimeGravityAccMEAN_Z_sd
* TimeGravityAccSDEV_X_sd
* TimeGravityAccSDEV_Y_sd
* TimeGravityAccSDEV_Z_sd
* TimeGravityAccMagMEAN_sd
* TimeGravityAccMagSDEV_sd

###Frequency Body Acclerometer Variables

The Frequency Body Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The body measurements are acceleration signals calculated by the accelerometer .  In the original data Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

* FreqBodyAccMEAN_X_mean
* FreqBodyAccMEAN_Y_mean
* FreqBodyAccMEAN_Z_mean
* FreqBodyAccSDEV_X_mean
* FreqBodyAccSDEV_Y_mean
* FreqBodyAccSDEV_Z_mean
* FreqBodyAccJerkMEAN_X_mean
* FreqBodyAccJerkMEAN_Y_mean
* FreqBodyAccJerkMEAN_Z_mean
* FreqBodyAccJerkSDEV_X_mean
* FreqBodyAccJerkSDEV_Y_mean
* FreqBodyAccJerkSDEV_Z_mean
* FreqBodyAccMagMEAN_mean
* FreqBodyAccMagSDEV_mean
* FreqBodyAccMEAN_X_sd
* FreqBodyAccMEAN_Y_sd
* FreqBodyAccMEAN_Z_sd
* FreqBodyAccSDEV_X_sd
* FreqBodyAccSDEV_Y_sd
* FreqBodyAccSDEV_Z_sd
* FreqBodyAccJerkMEAN_X_sd
* FreqBodyAccJerkMEAN_Y_sd
* FreqBodyAccJerkMEAN_Z_sd
* FreqBodyAccJerkSDEV_X_sd
* FreqBodyAccJerkSDEV_Y_sd
* FreqBodyAccJerkSDEV_Z_sd
* FreqBodyAccMagMEAN_sd
* FreqBodyAccMagSDEV_sd
* FreqBodyBodyAccJerkMagMEAN_sd
* FreqBodyBodyAccJerkMagSDEV_sd

###Frequency Body Gyroscope Variables

The Frequency Body Gyroscope measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The body measurements are signals calculated by the gyroscope.  In the original data Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

* FreqBodyGyroMEAN_X_mean
* FreqBodyGyroMEAN_Y_mean
* FreqBodyGyroMEAN_Z_mean
* FreqBodyGyroSDEV_X_mean
* FreqBodyGyroSDEV_Y_mean
* FreqBodyGyroSDEV_Z_mean
* FreqBodyBodyAccJerkMagMEAN_mean
* FreqBodyBodyAccJerkMagSDEV_mean
* FreqBodyBodyGyroMagMEAN_mean
* FreqBodyBodyGyroMagSDEV_mean
* FreqBodyBodyGyroJerkMagMEAN_mean
* FreqBodyBodyGyroJerkMagSDEV_mean
* FreqBodyGyroMEAN_X_sd
* FreqBodyGyroMEAN_Y_sd
* FreqBodyGyroMEAN_Z_sd
* FreqBodyGyroSDEV_X_sd
* FreqBodyGyroSDEV_Y_sd
* FreqBodyGyroSDEV_Z_sd
* FreqBodyBodyGyroMagMEAN_sd
* FreqBodyBodyGyroMagSDEV_sd
* FreqBodyBodyGyroJerkMagMEAN_sd
* FreqBodyBodyGyroJerkMagSDEV_sd

###Additional information
%he "features_info.txt" file, which was part of the original data set (see readme.MD), contains more detailed information about the original measurements in the UCI experiment.  This file is part of the github repository, https://github.com/jsteury/GetDataProject, prov
