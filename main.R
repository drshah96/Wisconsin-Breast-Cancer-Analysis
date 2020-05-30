##### BREAST CANCER WISCONSIN DATASET #####

#Loading Source Files
source("Data Collecting.R")
source("Data Processing.R")
source("KNN Algorithm.R")
source("Model Optimization.R")


#Loading Libraries
if(!require(gmodels)) install.packages("gmodels")
library(gmodels)

#KNN Prediction of Normalized Data
CrossTable(x = TestLabels, 
           y = TestPredict,
           prop.chisq = FALSE)


# KNN Prediction of Data obtained from Z - score Transformation
CrossTable(x = TestLabels1, 
           y = TestPredict1,
           prop.chisq = FALSE)
