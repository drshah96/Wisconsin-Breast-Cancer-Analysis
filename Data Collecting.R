##### ARTIFICIAL CHARACTER DATASET #####

##### Session Information #####
sessionInfo()

##### Downloading File #####
#WDBC Data
if(!file.exists("Data/auto-mpg.data")) {
        download.file(url = "http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data",
                      destfile = "Data/auto-mpg.data")
}

if(!file.exists("Data/auto-mpg-original.data")) {
        download.file(url = "http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg-original.data",
                      destfile = "Data/auto-mpg-original.data")
}

##### Unzipping the File #####
unzip("Data/character.tar.Z")

data_raw <- read.csv("Data/auto-mpg.data", header = FALSE, sep = ".")

##### Reading Data File ####
data_raw <- read.csv("Data/wdbc.data", 
                     header = F, 
                     col.names = c("id",
                                   "diagnosis",
                                   "radius_mean",
                                   "texture_mean",
                                   "perimeter_mean",
                                   "area_mean",
                                   "smoothness_mean",
                                   "compactness_mean",
                                   "concavity_mean",
                                   "concavity_points_mean",
                                   "symmetry_mean",
                                   "fractal_dimension_mean",
                                   "radius_SE",
                                   "texture_SE",
                                   "perimeter_SE",
                                   "area_SE",
                                   "smoothness_SE",
                                   "compactness_SE",
                                   "concavity_SE",
                                   "concavity_points_SE",
                                   "symmetry_SE",
                                   "fractal_dimension_SE",
                                   "radius_worst",
                                   "texture_worst",
                                   "perimeter_worst",
                                   "area_worst",
                                   "smoothness_worst",
                                   "compactness_worst",
                                   "concavity_worst",
                                   "concavity_points_worst",
                                   "symmetry_worst",
                                   "fractal_dimension_worst"))
