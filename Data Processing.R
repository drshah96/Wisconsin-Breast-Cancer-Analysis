##### BREAST CANCER WISCONSIN DATASET #####

##### Dataset Description #####
#Dimension of Dataset
if(!require(base)) install.packages("base")
library(base)
dim(data_raw)

#Structure of Dataset
str(data_raw)

#Names of columns
names(data_raw)

#Viewing Dataset
head(data_raw, n = 10)

#Summary of Dataset
summary(data_raw)


##### Data PreProcessing #####
data <- data_raw

#Checking for missing values
any(is.na(data))

#Number of Missing Values
sum(is.na(data))

#Missing values in each column
sapply(data, FUN = function(x) (sum(is.na(x))))

#Percentage of Missing Values in each column
sapply(data, FUN = function(x) 
        if(any(is.na(x)) == TRUE){ mean(is.na(x))*100 }
)

#Dropping columns with more than 80% Null Values
data <- data[, which(colMeans(!is.na(data)) > 0.8)]

#Dimension of Clean data
dim(data)

#Removing ID Column
data <- data[-1]

#Exploring Diagnosis Column
levels(data$diagnosis)

#Renaming levels of Diagnosis Column
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

data$diagnosis <- recode(data$diagnosis,
                         B = "Benign",
                         M = "Malignant")

levels(data$diagnosis)

#Total Number of Benign and Malignant
summary(data$diagnosis)

#Percentage of Benign and Malignant
round(prop.table(table(data$diagnosis))*100, 2)

#Summary of Data
summary(data)

#Normalizing Function
normalize <- function(x) {
        return( (x - min(x))/ (max(x) - min(x)))
}

NormalizeData <- as.data.frame(lapply(data[2:31], normalize))

#Summary of Normalized Data
summary(NormalizeData)

#Clean Data
CleanData <- cbind(data[, 1], NormalizeData)
names(CleanData)[names(CleanData) == "data[, 1]"] <- "diagnosis"
CleanData$diagnosis <- as.character(CleanData$diagnosis)
