=============================================================

Codebook for the script "run_analysis.R"

=============================================================

The tidy data set is built in the long form and contains 11880 observations of 4 variables.

This variables are:

1. activity : Factor with 6 levels:

	LAYING
	SITTING
	STANDING	
	WALKING
	WALKING_DOWNSTAIRS
	WALKING_UPSTAIRS

	The descriptive activity names are used.

2. subject : integer from 1 to 30. The identifier of the volunteer.

3. measure : Factor with 66 levels.  Measurements on the mean and standard deviation for each measurement.
	
	Were given the proper syntax for the column names.
 
4.  mean : numeric. Calculated average of each feature for each activity and each subject.


	
Variables are in columns, observations are in rows.	
Each different observation of each variable is in a different row.


=========================================

The incoming data was processed in the following way:

1. All the 8 incoming files were read into R.
2. Test and train data were combined for activity labels, subjects and measurements.
3. Columns containing measurements on the mean and standard deviation were selected.
4. Columns with subject, acivity label and set of measurements were conbined.
5. Activities were merged with the rest data. None-relevant column was excluded.
6. The proper syntax was given to the column names.
7. The measurement columns were gathered to get thr tidy data in the long form.
8. The meaningful column names were attached to the data set.
9. The mean for each observation was calculated.
10.The output data set - "tidy_dat" - was formed.
11. This final data set was processed to the file "tidy_data.txt" in the working directory.

