library(reshape2)
#Here I read the x training and test sets
trainx <- read.table("UCI HAR Dataset/train/x_train.txt", comment.char = "", colClasses="numeric")
testx <- read.table("UCI HAR Dataset/test/x_test.txt", comment.char = "", colClasses="numeric")
trainy <- read.table("UCI HAR Dataset/train/y_train.txt", comment.char = "", colClasses="numeric")
testy <- read.table("UCI HAR Dataset/test/y_test.txt", comment.char = "", colClasses="numeric")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = "", colClasses="numeric")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt", comment.char = "", colClasses="numeric")


#Here I merge both training and test sets independently (allx for x matrix and ally for result vectors)
allx<- rbind(trainx,testx)
ally<- rbind(trainy,testy)
suball<- rbind(subtrain,subtest)

#Here I read the table features and rename the labels for the merged training set  
features <- read.table("UCI HAR Dataset/features.txt")
featnames <- features[,2]
names(allx)<-featnames

#Here I extract the columns including mean and std within the name
df1<-allx[grepl("std|mean", names(allx), ignore.case=TRUE)]

#Here I replace the column of the y_train to their corresponding label activities
activitynames <- read.table("UCI HAR Dataset/activity_labels.txt")
activityn<-merge (ally,activitynames, by="V1")
activityn<-activityn$V2

#Here I change all labels to comply with tydy data, meaning, no symbols and every column name as lowercase
names(allx)<-gsub("(\\W)","",names(allx),perl=TRUE)
names(allx)<-tolower(names(allx))
#Here I extract again the columns including mean and std within the name but with better labels (underscore and without parenthesis and hypens) 
df2<-allx[grepl("std|mean", names(allx), ignore.case=TRUE)]
#Follow goes the code to get the mean from each feature by subject and activity 
#extracting names to use in melt  
namestidy1<-names(df2)
#adding new columns with activity and subject
df2$activity<-activityn
df2$subject<-suball[[1]]
#reshaping to have columns activity and subject, names as variable and value as their value 
meltactsub<-melt(df2,id=c("activity","subject"),measure.vars=c(namestidy1))
#getting those means
tidyofmeans<-dcast(meltactsub,activity + subject ~ variable,mean )
write.table(tidyofmeans,"tidysetofmeans.txt",)

