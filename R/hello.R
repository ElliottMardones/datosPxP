# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

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

# 2) cargar archivos
#scr <- "G:/Mi unidad/paisxpais"
#scr <- "G:/My Drive/paisxpais"
#setwd('C:/Users/Elliott/Documents/GitHub/datosPxP')
#
#temp <- list.files(pattern="*.csv")
##data <- lapply(temp, loadData)
#zz <- list_to_Array3D(data)
#dim(zz)
#datos <- zz
#datos[,,1]
#dim(datos)

#usethis::use_data(datos)

#write.csv2(x = datos, file = "paises_2016_2021.csv")


#gh <- load("~/GitHub/datosPxP/data/datos.rda")
#gh
#View(gh)

#re <- load("~/GitHub/datosPxP/data/datos.rda")
#re
#length(re)
