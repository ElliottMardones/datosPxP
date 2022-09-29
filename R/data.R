#' max_ByCountry usando foRgotten
#'
#' Los datos fueron calculados usando la funcion FE de foRgotten.
#' Los parametros son: thr = 0.5, reps = 1000
#' @usage Ver ejemplo
#' @examples
#' library(datosPxP)
#' library(foRgotten)
#' dd <- datosPxP::datos
#' max_By_Year <- maxByYear(dd)
#' summary(max_By_Year)
#' max_By_Year_FE <- foRgotten::FE(CE = max_By_Year, thr = 0.5, maxOrder = 2, reps = 1000)
#' head(max_By_Year_FE$boot$Order_2)

"max_By_Year_FE"




#' max_By_Country_FE usando foRgotten
#'
#' Los datos fueron calculados usando la funcion FE de foRgotten.
#' Los parametros son: thr = 0.05, reps = 1000
#' @usage Ver ejemplo
#' @examples
#' library(datosPxP)
#' library(foRgotten)
#' dd <- datosPxP::datos
#' max_By_Country <- max_ByCountry(dd)
#' summary(max_By_Country)
#' max_By_Country_FE <- foRgotten::FE(CE = max_By_Country, thr = 0.05, maxOrder = 2, reps = 1000)
#' max_By_Country_FE$boot$Order_2
"max_By_Country_FE"

#' byYear
#' @description foRgotten::FE(CE = data_byYear, maxOrder = 2, thr = k[i], reps = 100)
"byYear"


#' byCountry_
#' @description foRgotten::FE(CE = data_byCountry, maxOrder = 2, thr = drr[i], reps = 1000)
"byCountry_"
