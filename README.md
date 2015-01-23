## Getting and Cleaning Data Course Project
## README


## Purpose
The purpose of this project is to generate a tidy data set that can be used for later analysis.

### Dataset
The dataset is generated from experiments that has been carried out with a group of 30. Each person performed six activities by wearing smartphones with embedded accelerometer and gyroscope to capture 3-axial linear acceleration and e-axial angular velocity. 
A complete description of the dataset and the features collected can be found in the project's README.txt and features.txt

### Approach
-    Test and train sets are merged along with the subject identifiers and activity labels.
-	Activity identifiers are transformed into readable names. 
-	Only the mean and standard deviation columns were mapped from the dataset. 
-	Resulting dataset is summarized using colMeans function per subject/activity pair.
