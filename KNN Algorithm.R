##### BREAST CANCER WISCONSIN DATASET #####

##### Splitting the Data into Train and Test Datasets #####
set.seed(1234)
samp <- sample(nrow(CleanData),0.825*nrow(CleanData))
TrainData <- CleanData[samp,]
TestData <- CleanData[-samp,]

TrainLabels <- TrainData[, 1]
TestLabels <- TestData[, 1]

if(!require(class)) install.packages("class")
library(class)

TestPredict <- knn(train = TrainData[, 2:31], 
    test = TestData[, 2:31],
    cl = TrainLabels, k = 12)

if(!require(gmodels)) install.packages("gmodels")
library(gmodels)

CrossTable(x = TestLabels, 
           y = TestPredict,
           prop.chisq = FALSE)

