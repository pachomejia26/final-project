#Don't forget install dplyr

#Data for the project:

if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile ="./data/project.zip",method="curl")

#After decompressing

dtra<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
stra<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
atra<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
dt<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
st<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
at<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
testData1<-data.frame(st,at,dt)
trainData1<-data.frame(stra,atra,dtra)

#dtra = train data
#stra = train subject numbers
#atra = train activity numbers

#dt = test data
#st = test subject numbers
#at = test activity numbers

Data1<-rbind(testData1,trainData1)

#Data1 = complete data set


Data2<-select(Data1,V1,V1.1,V1.2:V6,V41:V46,V81:V86,V121:V126,V161:V166,V201:V202,V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,V345:V350,V424:V429,V503:V504,V516:V517,V529:V530,V542:V543)

#Data2 = this data set has only mean and standard deviation variables

Data3<-group_by(Data2,V1.1)
Data3b<-summarise_each(Data3,mean)

# Data3b has  the variable means for each activity

