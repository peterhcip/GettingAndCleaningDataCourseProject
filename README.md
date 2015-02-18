This README file describes how the run_analysis.R script can be used to produce the TidyData.txt file

The following 6 data files must first be copied into the R working directory:

X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt

The run_analysis.R script can then be run to carry out the following tasks in sequence:

1. Read the Subject, Activity and features data of the training sets

2. Combine the Subject, Activity and selected features data of the training sets into a single data set named AllTrain
   (The course project question asks for extraction of all mean and standard deviation measurements
   but here only 9 selected mean and 9 selected standard deviation measurements are included.
   44 other mean and 24 other standard deviation measurements in the features data are not included here.
   Their inclusion if desired would be straight-forward by selecting the corresponding column indices 
   and assigning the corresponding column names respectively in the two lines of code highlighted in comments within the script file)

3. Read and combine the Subject, Activity and selected features data of the test sets into a single data set named AllTest
   in the same way as for the training sets

4. Merge the training and the test sets to create one data set named AllData
   (The sequence is slightly different from what is asked for in the course project question
   in that extraction of selected features data is here done before merging of the training and test sets.
   Working in this sequence however has the advantage of maintaining a separate data set for training data in AllTrain
   and a separate data set for test data in AllTest)

5. Create a tidy data set as required in step 5

6. Export the tidy data set to a txt file for submission

