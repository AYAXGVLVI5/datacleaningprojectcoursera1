#Coursera Assignment for Getting and Cleaning Data Course

## Introduction

This analysis uses the data gotten from : 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To use the code here in just download the Dataset along the run_analysis.R file to your working directory and unzip the file there. The dataset will create some folders and the run_analysis.r will look for those folders. 

## Purpose

The purpose of this analysis is to demostrate the ability to collect and handle data to clean the data set tho show some results. 

Results can be seen in the tidysetofmeans.txt file created automatically by the run_analysis script

## Analysis of the data
The data comprises information from sensors of 30 subjects as explained in:
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The analysis includes the steps to get usable results from the raw data, such as the mean by activity and subject, per measured feature that has mean value for analysis. 

I'm taking the average of the measurements by activity and subject, as a first step in the goal of understanding human behaviour and to be able to cluster any patterns that can be not visible at first sight. 


##Codebook for variables in tidysetofmeans.txt

Each variable of the result tidy dataset (tidysetofmeans.txt)tidysetofmeans is self explanatory. I have taken each variable related to mean and std variation from the original dataset and took the average for each  variable per subject AND activity.

There are six activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING put in the first column of the result dataset. 

The second column is the number of the subject who participated in the experiment. (There are 30 subjects )

Except for this first two columns , the name of each feature (column) is comprised of a mesh of shortcuts to indicate the origin of the signal by the sensor. The meaning of these shorcuts follow, whose mean have been taking according to subject and activity. 

* bodyacc : means body acceleration 
* gravityacc : stands for the gravitational acceleration 
* gravitymean: stands for mean of the gravity sensor for the subject
* bodygyro: means the measurement from the body gyroscopic sensor 
: means the measurement from the body gyroscopic sensor 
* std : means the feature is a standar deviation
mean : means the feature is a mean
* x,y,z : The last letter of the name represent the axis of the measurement, so we can understand better the movement of the person/subject. 
* t,m : the name can begin in t or m if the measurement is either in the time domain or in the frequency domain 
* jerk : represent the measurement of the derivative of the acceleration
* mag: magnitude of the measurement
* angle: angle between vectors of the measurement

Names are very similar to the raw data, taking out parenthesis and hypens, and converting uppercase to lower case for convenience and tidyness. For more information regarding names please refer to the file features_info made by the creator of the raw data. 
