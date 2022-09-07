
list_to_Array3D <- function(data){
  dimData         <- dim(data[[1]])
  lengthData      <- length(data)
  temp            <- array(unlist(data), dim = c(dimData, lengthData))
  rownames(temp)  <- rownames(data[[1]])
  colnames(temp)  <- colnames(data[[1]])
  return(temp)
}
loadData <- function(scr){
  data <- read.csv2(file = scr, header= FALSE, sep=",", dec = ",", fill = TRUE,skip = 3)
  data <- data[-2,]
  data[,1] <- gsub(" \\s","", data[,1])
  new_rownames <- data[-1,1]
  data[1,] <- (gsub(" \\s","", data[1,]))
  new_colnames <- as.character(data[1,-1])

  data[data == ".."] <- 0
  data <- data.frame(apply(data, 2, function(x) round(as.numeric(as.character(x),2) )))
  data[is.na(data)] <- 0
  data <- data[-1,-1]
  rownames(data) <- new_rownames
  colnames(data) <- new_colnames

  borrar <- colnames(data)[!colnames(data) %in% rownames(data)]

  print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
  data <- data[which(colnames(data) %in% rownames(data))]
  data <- data[which(rownames(data) %in% colnames(data))]
  #browser()
  diag(data) <- 1
  return(data)
}

maxByYear <- function(Data){
  experts <- dim(Data)[3]
  for( expert in seq_len(experts)){
    maxValuebyYear <- (max(Data[,,expert]))
    print(maxValuebyYear)
    Data[,,expert] <- Data[,,expert]/maxValuebyYear
    diag(Data[,,expert]) <- 1
  }
  return(Data)
}

maxByYear_H <- function(Data){
  experts <- dim(Data)[3]
  temp <- c()
  for( expert in seq_len(experts)){
    maxValuebyYear <- (max(Data[,,expert]))
    temp <- c(temp, maxValuebyYear)
  }
  myMax <- max(temp)
  for( expert in seq_len(experts)){
    Data[,,expert] <- Data[,,expert]/myMax
    diag(Data[,,expert]) <- 1
  }
  return(Data)
}



max_ByCountry <- function(Data){
  experts <- dim(Data)[3]
  countrys <- dim(Data)[2]
  for( expert in seq_len(experts)){
    for(country in seq_len(countrys)){
      Data[country, ,expert] <- (Data[country, ,expert])/(sum(Data[country, ,expert]))
    }
    diag(Data[,,expert]) <- 1
  }
  return(Data)
}


max_ByCountryHistorical<- function(Data){
  experts <- dim(Data)[3]
  countrys <- dim(Data)[2]
  for( expert in seq_len(experts)){
    #temp <- c()
    tempMax <- c()
    tempMin <- c()
    for(country in seq_len(countrys)){
      tempMax <- c(tempMax, sum(Data[country, ,expert]))
    }
  }
  tempMax <- sum(tempMax)
  for( expert in seq_len(experts)){
    for(country in seq_len(countrys)){
      Data[country, ,expert] <- (Data[country, ,expert]) / (tempMax)
    }
    diag(Data[,,expert]) <- 1
  }
  return(Data)
}

