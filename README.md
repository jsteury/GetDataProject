---
title: "README.md"
author: "Julie Steury"
date: "Saturday, April 25, 2015"
output: html_document
---

The assignment was to combine two datasets from a UC Irvine study Samsung motion study.  The training and test datasets were to be combined into a single dataset.  Clean the data as needed and then filter down to just the set of variables representing the mean and standard deviation calculations.  Then finally, to create a new tidy data set with that summarized the mean and standard deviation of those mean and sdev variable, where mean and std dev were calculated for each subject and activity.

###Project Background

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Project Files


Data for the project is located at:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This zip files contains all of the data needed to analyze for the project, and a codebook for the data measurements.

The R code for loading the data, cleaning, extracting and summarizing is in the file call "run_Analysis.R"

I created a code book that describes the output results is in "codebook.md". 

I have summarized my tidy data set in the codebook:  codebook.MD.

Both of these files can be found in my github repository:  "https://github.com/jsteury/GetDataProject".

In addition, I included in this github repository  the original measurement codebook: "features_info.txt" and the output of my R script:  "summary_tidy_data.txt".

In my R code, I chose to download the source zip file to a temporary directory and file.  I chose to use this temporary directory approach since the original data file is quite large and it makes sense to discard it once I'm finished analyzing.

I then reviewed the list of filenames in the zip file, and identified the indexes for just the relevant files.  I identified these indexes as relevant:  c(1,2,16,17,18,30,31,32).  

The data files (from the zip file) used in the analysis were:
=========================================
"activity_labels.txt - list of activity labels
"features.txt" - list of feature names
"subject_test.txt"  - identifiers for test data set subjects
"X_test.txt"  - observations of the 561 feature variables for test subjects
"y_test.txt" - identifiers of the activities corresponding to the test observations
"subject_train.txt" - identifiers for training dataset subjects 
"X_train.txt" - observations of the 561 feature variables for training subjects 
"y_train.txt" - identifiers for training dataset subjects 

### My Approach

I used the following approach in attacking this assignment.  More detail is also available in the codebook.MD file.

1.  I unzipped the files and read the relevant files into a list of dataframes.  I did not read in the raw data that had already been processed into the training and test data summarizations.
2.  I combined the subject, activity, and observation data frames to build a complete training data frame and a complete test data frame, paying close attention to the dimensions of the dataframes to ensure I was combining appropriately.
3.  My next step was to extract just the relevant columns, those that corresponded to mean and standard deviation of other measurements, as instructed in the assignment.
4.  I then worked on the column names, cleaning them up to make them understandable and readable, and removing special characters like () and -.
5.  To create the tidy summary dataset, I used the dplyr package and group by function, to group my final data set by subject and activity.  I then calculated the summary data mean and standard deviation using the Summarise function.
6.  Finally, I wrote the tidy data to a file.

