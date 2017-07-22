---
title: "Readme.md"
author: "Steven Eannuzzi"
date: "July 22, 2017"
output: html_document
---

# Getting and Cleaning Data Course Project
> This section, Motivation and Course Project activity is directly quoted from the Course Project site - Getting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1. a tidy data set as described below,
1. a link to a Github repository with your script for performing the analysis, and 
1. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called ```CodeBook.md```. You should also include a ```README.md``` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Motiviation
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Course Project Activity
You should create one R script called ```run_analysis.R``` that does the following.

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in (prior) step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Prerequisites
1. R 3.4.1 or later,
1. R Studio recommended,
1. RCurl package,
1. Plyr package
1. Write access to directory to create extract subdirectory

## What does this script do?
1. Download the wearable dataset **UCI HAR Dataset** and unzips it if needed.
1. Blends **train** and **test** data sets.
1. Extracts relevant attributes.  Requirements where *mean* and *standard deviation* attributes from the **features** data set.  These are matched by column name.
1. Column names are normalized to friendly-names based up notes in the extract.
1. Blended data set is written to the ```tidy\blended.txt``` directory.  This includes x,y data with subjects.
1. *mean* of activities and subjects is a second (smaller) dataset created as ```tidy\blended_averages.txt```.

## Key lessons learned
1. Fuzzy requirement on mean for a measurement.  Technically ```meanFreq``` is a mean of a measurement.  Requirements should have specified what feature in
```feature_info.txt``` to use.
1. A more generic *attribute* to *friendly name* classifier would be great.
1. R/Data Science conventions tend to be terse or whatever is easiest to type.  This requires a bit of relearning when exposed to Hungarian, Java... software
engineering naming standards.
1. Numbered steps in code to match Readme.  Caught missing steps.
1. Average measurement by subject does not feel right.  For example, time of day or food intake... may influence the activity level.  Averaging this hides possible
interesting outliers.
1. R is really quick on tidying when their are no data exceptions.  It would be interesting to work with dirty data and compare against an ETL tool like Talend.

## Tests
No tests or self-checks incorporated.

## Built With
* [RStudio](https://www.rstudio.com/products/RStudio/)
* [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* Template README markdown from [PurpleBooth](https://gist.github.com/PurpleBooth)

