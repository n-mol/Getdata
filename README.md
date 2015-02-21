================================================================

Script "run_analysis.R"

================================================================

"Getting and Cleaning Data" course project

================================================================

The script provides the tidy data set of experimental data collected from the accelerometers from the Samsung Galaxy S
smartphone with a group of 30 volunteers for 6 activity types and 561 features. 

======================================

To run the script in R one can use the following code:

	source(".\\run_analysis.R")

======================================

The script takes as input 8 text files of Samsung data: 

"train/X_train.txt": Training set.

"train/y_train.txt": Training labels.

"train\\subject_train.txt": Training subject identifier.

"test/X_test.txt": Test set.

"test/y_test.txt": Test labels.

test\\subject_test.txt": Test subject identifier.

"features.txt": List of all features.

"activity_labels.txt": Links the activity labels with activity names.


The script works as long as the incoming data is in the working directory.


======================================

The script performs several steps:

1. Read data to R.

2. Combine test and train data.

3. Select columns with mean and standart deviation in column names.

4. Exclud columns containing meanFreq in their names.

5. Combine subject, acivity label and set of measurements.

6. Merge and clean data.

7. Give column names the proper syntax.

8. Make the data tidy in the long form. The "tidy_dat" data set is the output.

9. Process tidy data to the file "tidy_data.txt" in working directory.




