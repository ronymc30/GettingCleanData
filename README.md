# README
## The Dataset
The dataset was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzipped to "./data/UCI HAR Dataset/" folder of the working directory

The extracted dataset files are:  
1. activity_labels.txt - 6 obs of 2 vars - contain the Activity labels associated with the wearable device
features.txt - 561 obs of 2 vars - contain the label names of the features (predictors) that constitute the X_train.txt and X_test.txt datasets  
2. subject_train.txt - 7352 obs of 1 var - subjects associated with the predictor observations in the training set  
3. X_train.txt - 7352 obs of 561 vars - predictor observations in the training set  
4. y_train.txt - 7352 obs of 1 var - response observations in the training set  
5. subject_test.txt - 2947 obs of 1 var - subjects associated with the predictor observations in the testing set  
6. X_test.txt - 2947 obs of 561 vars - predictor observations in the testing set  
7. y_test.txt - 2947 obs of 1 var - response observations in the testing set  

## run_analysis.R
R code file that processes the files above, merges and cleans the dataset according to the spcified requirements

## tidy_set.csv
Final output file representing the cleaned and reduced dataset
