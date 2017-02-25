---
title: "Getting and Cleaning Data Final - Codebook"
author: "Richard Noordam"
date: "February 24, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Data Cleaning Codebook

## Data Flow
###0. About the Data
Data Detail: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

+ this provides the details about the data being processed.

###1. Data Acquisition - Acquire data and place it in local working directory
Base Data: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  

+ The first step is to acquire the data, and data detail from the following above location

+ For processing, the base data is assumed to be unzipped and in the current working directory, with the original directory structure and files.

###2. Dependencies
+ this script uses the dplyr library

###3. Data Load - load all data into data a frame.
+ Load Activity and Feature Names 
+ Load Training Data into dataframes 
+ Load Testing Data into dataframes
+ Load data into full joined set 

###4. Bind loaded data together.
+ Bind Training Data together, with Subject at end.
+ Bind Testing Data together, with Subject at end. 
+ Binding subject to the end allows easy connection of the feature names, keeping them in sequence.

###5. feature names housecleaning.
+ using of gsub to rename -std -> STD, -mean -> MEAN and getting rid of -(), making these names clear and simple to search on. (more tidy data work)

###6. subset features
+ get the columns that have MEAN or STD in them.
+ set final features
+ add subject and activity columns.
+ subset data based on this column set

###7. set the column names
+ set column names based on featureNames
+ lower case columns for preferred tidy data layout.

###8. Loop through Activities
+ and replace numeric representation of activity with activity name

###9. change the Activity and Subject columns to factors
+ this allows the means table to be based on these fields

###10. Create means table
+ create table, broken by activity, and subject, with removed activity and subject means (not needed or useful)

###11. Write out output
+ write tidyData.txt file with mean data.
