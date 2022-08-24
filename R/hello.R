
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
  }
  return(Data)
}

D
maxValueByCountry <- function(Data){
  experts <- dim(Data)[3]
  countrys <- dim(Data)[2]
  for( expert in seq_len(experts)){
    for(country in seq_len(countrys)){
      # Ej: maximo valor entre fila 1:n y todas las columnas.
      maxValueByC <- (max(Data[country, ,expert]))
      # Actualizacion de los datos
      Data[country, ,expert] <- Data[country, ,expert]/maxValueByC
    }
  }
  return(Data)
}
#pepe <- maxByYear(D)
#dim(pepe2)
##pepe2[,,1]
#summary(D)
#summary(pepe)
#summary(pepe2)

#View(pepe[,,1])
