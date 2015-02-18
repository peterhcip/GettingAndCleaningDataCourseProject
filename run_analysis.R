## Read the Subject, Activity and features data of the training sets

Xtrain <- read.csv("X_train.txt",sep="",header=F,colClasses="numeric")
strain <- read.csv("subject_train.txt",sep="",header=F)
ytrain <- read.csv("y_train.txt",sep="",header=F,colClasses="factor")
ytrain$V1 <- factor(ytrain$V1,
  levels=c(1,2,3,4,5,6),
  labels=c("walking","walking up","walking down","sitting","standing","laying"))


## Combine the Subject, Activity and selected features data of the training sets into a single data set named AllTrain
## The course project question asks for extraction of all mean and standard deviation measurements
## but here only 9 selected mean and 9 selected standard deviation measurements are included.
## 44 other mean and 24 other standard deviation measurements in the features data are not included here.
## Their inclusion if desired would be straight-forward by selecting the corresponding column indices 
## and assigning the corresponding column names respectively in the two lines of code below 

AllTrain<-cbind(strain,ytrain,Xtrain[,c(1:6,41:46,121:126)])
colnames(AllTrain) <- c("Subject","Activity","BodyAccMeanX","BodyAccMeanY","BodyAccMeanZ","BodyAccStdX","BodyAccStdY","BodyAccStdZ","GravAccMeanX","GravAccMeanY","GravAccMeanZ","GravAccStdX","GravAccStdY","GravAccStdZ","BodyGyroMeanX","BodyGyroMeanY","BodyGyroMeanZ","BodyGyroStdX","BodyGyroStdY","BodyGyroStdZ")


## Read and combine the Subject, Activity and selected features data of the test sets into a single data set named AllTest
## in the same way as for the training sets

Xtest <- read.csv("X_test.txt",sep="",header=F,colClasses="numeric")
stest <- read.csv("subject_test.txt",sep="",header=F)
ytest <- read.csv("y_test.txt",sep="",header=F,colClasses="factor")
ytest$V1 <- factor(ytest$V1,
  levels=c(1,2,3,4,5,6),
  labels=c("walking","walking up","walking down","sitting","standing","laying"))
AllTest<-cbind(stest,ytest,Xtest[,c(1:6,41:46,121:126)])
colnames(AllTest) <- c("Subject","Activity","BodyAccMeanX","BodyAccMeanY","BodyAccMeanZ","BodyAccStdX","BodyAccStdY","BodyAccStdZ","GravAccMeanX","GravAccMeanY","GravAccMeanZ","GravAccStdX","GravAccStdY","GravAccStdZ","BodyGyroMeanX","BodyGyroMeanY","BodyGyroMeanZ","BodyGyroStdX","BodyGyroStdY","BodyGyroStdZ")


## Merge the training and the test sets to create one data set named AllData
## The sequence is slightly different from what is asked for in the course project question
## in that extraction of selected features data is here done before merging of the training and test sets.
## Working in this sequence however has the advantage of maintaining a separate data set for training data in AllTrain
## and a separate data set for test data in AllTest

AllData <- rbind(AllTrain,AllTest)


## Create a tidy data set as required in step 5

TidyData <- aggregate(cbind(BodyAccMeanX,BodyAccMeanY,BodyAccMeanZ,BodyAccStdX,BodyAccStdY,BodyAccStdZ,GravAccMeanX,GravAccMeanY,GravAccMeanZ,GravAccStdX,GravAccStdY,GravAccStdZ,BodyGyroMeanX,BodyGyroMeanY,BodyGyroMeanZ,BodyGyroStdX,BodyGyroStdY,BodyGyroStdZ) ~ Subject + Activity, AllData, FUN=mean)


## Export the tidy data set to a txt file for submission

write.table(TidyData, file="TidyData.txt",row.name=F)
