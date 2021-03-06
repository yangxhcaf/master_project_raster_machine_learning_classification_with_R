library(mlbench)
library(caret)
library(rasterVis)

#Training data for classification
trainingData <- shapefile("C:/Users/Gift/Desktop/Data/Training/2019/2019_Classification.shp")
responseColumn <- "class"

#Raster Data for the Study site 1 of 2019
r_data_2019_1 <- brick("C:/Users/Gift/Desktop/Data/Try_Th/Tiffs/2019_Tiff/2019_1.tif")

#Rename bands for the Study site 1 of 2019
names(r_data_2019_1) <- c("blue", "green", "red", "NIR")

#Plot raster data
plotRGB(r_data_2019_1 * (r_data_2019_1 >= 0), r = 4, g = 2, b = 1)

#Extract the pixels values of the training samples in data frame format
df_training_2019_1 = data.frame(matrix(vector(), nrow = 0, ncol = length(names(r_data_2019_1)) + 1))   
for (i in 1:length(unique(trainingData[[responseColumn]]))){
  categories <- unique(trainingData[[responseColumn]])[i]
  categoriesMap <- trainingData[trainingData[[responseColumn]] == categories,]
  dataVal <- extract(r_data_2019_1, categoriesMap)
  if(is(trainingData, "SpatialPointsDataFrame")){
    dataVal <- cbind(dataVal, class = as.numeric(rep(categories, nrow(dataVal))))
    df_training_2019_1 <- rbind(df_training_2019_1, dataVal[complete.cases(dataVal),])
  }
  if(is(trainingData, "SpatialPolygonsDataFrame")){
    dataVal <- dataVal[!unlist(lapply(dataVal, is.null))]
    dataVal <- lapply(dataVal, function(x){cbind(x, class = as.numeric(rep(categories, nrow(x))))})
    df_data <- do.call("rbind", dataVal)
    df_training_2019_1 <- rbind(df_training_2019_1, df_data)
  }
}


#Raster Data for the Study site 2 of 2019
r_data_2019_2 <- brick("C:/Users/Gift/Desktop/Data/Try_Th/Tiffs/2019_Tiff/2019_2.tif")

#Rename bands for the Study site 2 of 2019
names(r_data_2019_2) <- c("blue", "green", "red", "NIR")

#Plot raster data
plotRGB(r_data_2019_2 * (r_data_2019_2 >= 0), r = 4, g = 2, b = 1)

#Extract the pixels values of the training samples in data frame format
df_training_2019_2 = data.frame(matrix(vector(), nrow = 0, ncol = length(names(r_data_2019_2)) + 1))   
for (i in 1:length(unique(trainingData[[responseColumn]]))){
  categories <- unique(trainingData[[responseColumn]])[i]
  categoriesMap <- trainingData[trainingData[[responseColumn]] == categories,]
  dataVal <- extract(r_data_2019_2, categoriesMap)
  if(is(trainingData, "SpatialPointsDataFrame")){
    dataVal <- cbind(dataVal, class = as.numeric(rep(categories, nrow(dataVal))))
    df_training_2019_2 <- rbind(df_training_2019_2, dataVal[complete.cases(dataVal),])
  }
  if(is(trainingData, "SpatialPolygonsDataFrame")){
    dataVal <- dataVal[!unlist(lapply(dataVal, is.null))]
    dataVal <- lapply(dataVal, function(x){cbind(x, class = as.numeric(rep(categories, nrow(x))))})
    df_data <- do.call("rbind", dataVal)
    df_training_2019_2 <- rbind(df_training_2019_2, df_data)
  }
}

#Raster Data for the Study site 3 of 2019
r_data_2019_3 <- brick("C:/Users/Gift/Desktop/Data/Try_Th/Tiffs/2019_Tiff/2019_3.tif")

#Rename bands for the Study site 3 of 2019
names(r_data_2019_3) <- c("blue", "green", "red", "NIR")

#Plot raster data
plotRGB(r_data_2019_3 * (r_data_2019_3 >= 0), r = 4, g = 2, b = 1)

#Extract the pixels values of the training samples in data frame format
df_training_2019_3 = data.frame(matrix(vector(), nrow = 0, ncol = length(names(r_data_2019_3)) + 1))   
for (i in 1:length(unique(trainingData[[responseColumn]]))){
  categories <- unique(trainingData[[responseColumn]])[i]
  categoriesMap <- trainingData[trainingData[[responseColumn]] == categories,]
  dataVal <- extract(r_data_2019_3, categoriesMap)
  if(is(trainingData, "SpatialPointsDataFrame")){
    dataVal <- cbind(dataVal, class = as.numeric(rep(categories, nrow(dataVal))))
    df_training_2019_3 <- rbind(df_training_2019_3, dataVal[complete.cases(dataVal),])
  }
  if(is(trainingData, "SpatialPolygonsDataFrame")){
    dataVal <- dataVal[!unlist(lapply(dataVal, is.null))]
    dataVal <- lapply(dataVal, function(x){cbind(x, class = as.numeric(rep(categories, nrow(x))))})
    df_data <- do.call("rbind", dataVal)
    df_training_2019_3 <- rbind(df_training_2019_3, df_data)
  }
}

#Raster Data for the Study site 4 of 2019
r_data_2019_4 <- brick("C:/Users/Gift/Desktop/Data/Try_Th/Tiffs/2019_Tiff/2019_4.tif")

#Rename bands for the Study site 3 of 2019
names(r_data_2019_4) <- c("blue", "green", "red", "NIR")

#Plot raster data
plotRGB(r_data_2019_4 * (r_data_2019_4 >= 0), r = 4, g = 2, b = 1)

#Extract the pixels values of the training samples in data frame format
df_training_2019_4 = data.frame(matrix(vector(), nrow = 0, ncol = length(names(r_data_2019_4)) + 1))   
for (i in 1:length(unique(trainingData[[responseColumn]]))){
  categories <- unique(trainingData[[responseColumn]])[i]
  categoriesMap <- trainingData[trainingData[[responseColumn]] == categories,]
  dataVal <- extract(r_data_2019_4, categoriesMap)
  if(is(trainingData, "SpatialPointsDataFrame")){
    dataVal <- cbind(dataVal, class = as.numeric(rep(categories, nrow(dataVal))))
    df_training_2019_4 <- rbind(df_training_2019_4, dataVal[complete.cases(dataVal),])
  }
  if(is(trainingData, "SpatialPolygonsDataFrame")){
    dataVal <- dataVal[!unlist(lapply(dataVal, is.null))]
    dataVal <- lapply(dataVal, function(x){cbind(x, class = as.numeric(rep(categories, nrow(x))))})
    df_data <- do.call("rbind", dataVal)
    df_training_2019_4 <- rbind(df_training_2019_4, df_data)
  }
}


#Raster Data for the Study site 3 of 2019
r_data_2019_5 <- brick("C:/Users/Gift/Desktop/Data/Try_Th/Tiffs/2019_Tiff/2019_5.tif")

#Rename bands for the Study site 1 of 2019
names(r_data_2019_5) <- c("blue", "green", "red", "NIR")

#Plot raster data
plotRGB(r_data_2019_5 * (r_data_2019_5 >= 0), r = 4, g = 2, b = 1)

#Extract the pixels values of the training samples in data frame format
df_training_2019_5 = data.frame(matrix(vector(), nrow = 0, ncol = length(names(r_data_2019_5)) + 1))   
for (i in 1:length(unique(trainingData[[responseColumn]]))){
  categories <- unique(trainingData[[responseColumn]])[i]
  categoriesMap <- trainingData[trainingData[[responseColumn]] == categories,]
  dataVal <- extract(r_data_2019_5, categoriesMap)
  if(is(trainingData, "SpatialPointsDataFrame")){
    dataVal <- cbind(dataVal, class = as.numeric(rep(categories, nrow(dataVal))))
    df_training_2019_5 <- rbind(df_training_2019_5, dataVal[complete.cases(dataVal),])
  }
  if(is(trainingData, "SpatialPolygonsDataFrame")){
    dataVal <- dataVal[!unlist(lapply(dataVal, is.null))]
    dataVal <- lapply(dataVal, function(x){cbind(x, class = as.numeric(rep(categories, nrow(x))))})
    df_data <- do.call("rbind", dataVal)
    df_training_2019_5 <- rbind(df_training_2019_5, df_data)
  }
}

saveRDS(df_training_2019_1, file = "df_training_2019_1.rds")
saveRDS(df_training_2019_2, file = "df_training_2019_2.rds")
saveRDS(df_training_2019_3, file = "df_training_2019_3.rds")
saveRDS(df_training_2019_4, file = "df_training_2019_4.rds")
saveRDS(df_training_2019_5, file = "df_training_2019_5.rds")
