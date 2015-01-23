## Getting and Cleaning Data Course Project
## CodeBook


### run_analysis.R

The script does the following:-
-   Test and train sets are merged along with the subject identifiers and activity labels.
-	Activity identifiers are transformed into readable names. 
-	Only the mean and standard deviation columns were mapped from the dataset. 
-	Resulting dataset is summarized using colMeans function per subject/activity pair.

### Variables

#### Data Tables
x_trainingSet, y_trainingLabels, x_testSet, y_testLabels, trainingSubject and testSubject contain the data from the downloaded files.

mergedData is the merged dataset 
mean_std_mergedData is the subset with std and mean columns.
clean_data is the final clean data with Subject identifier and Activities

cleanMeans is the final clean dataset with the column means

#### Output 
cleanMeans is written out into cleanMeans.txt 
