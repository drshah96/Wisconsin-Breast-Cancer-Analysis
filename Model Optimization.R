##### BREAST CANCER WISCONSIN DATASET #####

# Z - score Transformation
ZScoreData <- as.data.frame(scale(data[-1]))
summary(ZScoreData$area_mean)

#Updated Data
UpdateData <- cbind(data[, 1], ZScoreData)
names(UpdateData)[names(UpdateData) == "data[, 1]"] <- "diagnosis"
UpdateData$diagnosis <- as.character(UpdateData$diagnosis)
class(UpdateData$diagnosis)

set.seed(12345)
samp1 <- sample(nrow(UpdateData),0.825*nrow(UpdateData))
TrainData1 <- UpdateData[samp1,]
TestData1 <- UpdateData[-samp1,]

TrainLabels1 <- TrainData[, 1]
TestLabels1 <- TestData[, 1]

if(!require(class)) install.packages("class")
library(class)

TestPredict1 <- knn(train = TrainData1[, 2:31], 
                   test = TestData1[, 2:31],
                   cl = TrainLabels1, k = 19)

if(!require(gmodels)) install.packages("gmodels")
library(gmodels)

CrossTable(x = TestLabels1, 
           y = TestPredict1,
           prop.chisq = FALSE)
