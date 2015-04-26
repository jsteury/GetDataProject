---
title: "CodeBook"
author: "Julie Steury"
date: "Saturday, April 25, 2015"
output: html_document
---

TidyData.txt - Codebook for Coursera Getting and Cleaning Data project
April 24, 2015, J. Steury

This code book explains the data in the TidyData table produced as output in the course project.  For more detailed understanding of the variables, it is necessary to refer to the original code book, features_info.txt.
Approach

*** Insert approach text currently in readme.MD ***

The resulting output is a summary table of mean ("mean") and standard deviation ("sd") variables, calculated over all observations for each subject and each activity.  This results in a table of 180 observations for 132 variables with 2 identifiers (subject and activity).

*bold*Identifiers*bold*
Subject    Subject  identifier	Integer, 1-30
Activities	Activity Name	Character

*bold*Time  & Body Accelerometer Variables*bold*
The Time Body Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  The body measurements are acceleration signals calculated by the accelerometer .  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.
All values are of class numeric, with values between -1 and 1.

TimeBodyAccMEAN_X_mean
TimeBodyAccJerkMEAN_X_mean
TimeBodyAccJerkMEAN_Y_mean
TimeBodyAccJerkMEAN_Z_mean
TimeBodyAccJerkSDEV_X_mean
TimeBodyAccJerkSDEV_Y_mean
TimeBodyAccJerkSDEV_Z_mean
TimeBodyAccMagMEAN_mean
TimeBodyAccMagSDEV_mean
TimeBodyAccJerkMagMEAN_mean
TimeBodyAccJerkMagSDEV_mean
TimeBodyAccJerkMEAN_X_sd
TimeBodyAccJerkMEAN_Y_sd
TimeBodyAccJerkMEAN_Z_sd
TimeBodyAccJerkSDEV_X_sd
TimeBodyAccJerkSDEV_Y_sd
TimeBodyAccJerkSDEV_Z_sd
TimeBodyAccMagMEAN_sd
TimeBodyAccMagSDEV_sd
TimeBodyAccJerkMagMEAN_sd
TimeBodyAccJerkMagSDEV_sd

Time & Gravity Accelerometer Variables

The Time Gravity Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The gravity measurements are acceleration signals calculated by the accelerometer .   "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

TimeGravityAccMEAN_X_mean
TimeGravityAccMEAN_Y_mean
TimeGravityAccMEAN_Z_mean
TimeGravityAccSDEV_X_mean
TimeGravityAccSDEV_Y_mean
TimeGravityAccSDEV_Z_mean
TimeGravityAccMagMEAN_mean
TimeGravityAccMagSDEV_mean
TimeGravityAccMEAN_X_sd
TimeGravityAccMEAN_Y_sd
TimeGravityAccMEAN_Z_sd
TimeGravityAccSDEV_X_sd
TimeGravityAccSDEV_Y_sd
TimeGravityAccSDEV_Z_sd
TimeGravityAccMagMEAN_sd
TimeGravityAccMagSDEV_sd

Frequency Body Acclerometer Variables

The Frequency Body Accelerometer measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The body measurements are acceleration signals calculated by the accelerometer .  In the original data Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

FreqBodyAccMEAN_X_mean
FreqBodyAccMEAN_Y_mean
FreqBodyAccMEAN_Z_mean
FreqBodyAccSDEV_X_mean
FreqBodyAccSDEV_Y_mean
FreqBodyAccSDEV_Z_mean
FreqBodyAccJerkMEAN_X_mean
FreqBodyAccJerkMEAN_Y_mean
FreqBodyAccJerkMEAN_Z_mean
FreqBodyAccJerkSDEV_X_mean
FreqBodyAccJerkSDEV_Y_mean
FreqBodyAccJerkSDEV_Z_mean
FreqBodyAccMagMEAN_mean
FreqBodyAccMagSDEV_mean
FreqBodyAccMEAN_X_sd
FreqBodyAccMEAN_Y_sd
FreqBodyAccMEAN_Z_sd
FreqBodyAccSDEV_X_sd
FreqBodyAccSDEV_Y_sd
FreqBodyAccSDEV_Z_sd
FreqBodyAccJerkMEAN_X_sd
FreqBodyAccJerkMEAN_Y_sd
FreqBodyAccJerkMEAN_Z_sd
FreqBodyAccJerkSDEV_X_sd
FreqBodyAccJerkSDEV_Y_sd
FreqBodyAccJerkSDEV_Z_sd
FreqBodyAccMagMEAN_sd
FreqBodyAccMagSDEV_sd
FreqBodyBodyAccJerkMagMEAN_sd
FreqBodyBodyAccJerkMagSDEV_sd

Frequency Body Gyroscope Variables

The Frequency Body Gyroscope measured variables are listed below.  the Tidy data set includes a mean and standard deviation calculated for each subject and activity combination.  
The body measurements are signals calculated by the gyroscope.  In the original data Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.  Jerk signals are derived from body linear acceleration and angular velocity.  "Mag" corresponds to magnitude calculated from the XYZ coordinate measurements.

All values are of class numeric, with values between -1 and 1.  

FreqBodyGyroMEAN_X_mean
FreqBodyGyroMEAN_Y_mean
FreqBodyGyroMEAN_Z_mean
FreqBodyGyroSDEV_X_mean
FreqBodyGyroSDEV_Y_mean
FreqBodyGyroSDEV_Z_mean
FreqBodyBodyAccJerkMagMEAN_mean
FreqBodyBodyAccJerkMagSDEV_mean
FreqBodyBodyGyroMagMEAN_mean
FreqBodyBodyGyroMagSDEV_mean
FreqBodyBodyGyroJerkMagMEAN_mean
FreqBodyBodyGyroJerkMagSDEV_mean
FreqBodyGyroMEAN_X_sd
FreqBodyGyroMEAN_Y_sd
FreqBodyGyroMEAN_Z_sd
FreqBodyGyroSDEV_X_sd
FreqBodyGyroSDEV_Y_sd
FreqBodyGyroSDEV_Z_sd
FreqBodyBodyGyroMagMEAN_sd
FreqBodyBodyGyroMagSDEV_sd
FreqBodyBodyGyroJerkMagMEAN_sd
FreqBodyBodyGyroJerkMagSDEV_sd
