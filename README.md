
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datosPxP

<!-- badges: start -->
<!-- badges: end -->

The goal of datosPxP is to …

## Installation

You can install the development version of datosPxP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ElliottMardones/datosPxP")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datosPxP)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(datosPxP::datos)
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#>         0         0        19    387147      5712 577125500
```

Procesando los datos:

``` r
max_By_Year <- maxByYear(datosPxP::datos)
#> [1] 385677759
#> [1] 430328147
#> [1] 479701581
#> [1] 419322649
#> [1] 452576715
#> [1] 577125500
summary(max_By_Year)
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#> 0.0000000 0.0000000 0.0000001 0.0054373 0.0000138 1.0000000
```

Parte 2:

``` r
max_By_Country <- max_ByCountry(datosPxP::datos)
summary(max_By_Country)
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#> 0.0000000 0.0000000 0.0000038 0.0091737 0.0003833 1.0000000
```

Resultados obtenidos del paquete foRgotten (FE), usando los parametros
maxOrder = 2, thr = 0.5 y reps = 1000

``` r
datosPxP::max_By_Year_FE
#> $boot
#> $boot$Order_2
#>                   From                Through_1                       To Count
#> 1               Mexico United States of America                   Canada     6
#> 2 China, Hong Kong SAR                    China United States of America     6
#> 3                China United States of America                   Canada     4
#> 4               Canada United States of America                   Mexico     4
#> 5                China United States of America                   Mexico     2
#>        Mean    LCI   UCI          SE
#> 1 0.6000000 0.5400 0.635 0.023173539
#> 2 0.6016667 0.5800 0.620 0.009997558
#> 3 0.5900000 0.5575 0.610 0.013202307
#> 4 0.5675000 0.5450 0.590 0.011315858
#> 5 0.5050000 0.5000 0.510 0.003641821
#> 
#> 
#> $byExperts
#> $byExperts$Order_2
#>                   From                Through_1                       To Count
#> 1               Mexico United States of America                   Canada     6
#> 2 China, Hong Kong SAR                    China United States of America     6
#> 3                China United States of America                   Canada     4
#> 4               Canada United States of America                   Mexico     4
#> 5                China United States of America                   Mexico     2
#>    Expert_1  Expert_2  Expert_3  Expert_4  Expert_5  Expert_6
#> 1 0.6645668 0.6300113 0.5955996 0.6631697 0.5388762 0.5094758
#> 2 0.6312781 0.5934833 0.5595592 0.6127715 0.5850159 0.6267989
#> 3 0.6206987 0.5834498 0.5507837 0.6090930 0.0000000 0.0000000
#> 4 0.5820140 0.5517977 0.5401089 0.5982322 0.0000000 0.0000000
#> 5 0.5130505 0.0000000 0.0000000 0.5007813 0.0000000 0.0000000
```

Resultados obtenidos del paquete foRgotten (FE), usando los parametros
maxOrder = 2, thr = 0.05 y reps = 1000

``` r
head(datosPxP::max_By_Country_FE$boot$Order_2)
#>             From              Through_1         To Count       Mean        LCI
#> 1     Montenegro Bosnia and Herzegovina    Austria     6 0.07666667 0.06666667
#> 2        Armenia                Georgia Azerbaijan     6 0.07500000 0.06666667
#> 3           Togo                  Benin Bangladesh     6 0.09166667 0.06500000
#> 4        Andorra                 France    Belgium     6 0.06666667 0.06166667
#> 5       Cameroon            Netherlands    Belgium     6 0.07833333 0.06500000
#> 6 Cayman Islands            Netherlands    Belgium     6 0.11833333 0.11166667
#>          UCI          SE
#> 1 0.08166667 0.003829505
#> 2 0.08166667 0.003930352
#> 3 0.11166667 0.011931092
#> 4 0.06833333 0.001865008
#> 5 0.08754470 0.005855848
#> 6 0.11939577 0.001508051
nrow(datosPxP::max_By_Country_FE$boot$Order_2)
#> [1] 2977
head(order(max_By_Country_FE$boot$Order_2$Mean, decreasing = T))
#> [1]  518 2621  104 1326 1822  554
max_By_Country_FE$boot$Order_2[order(max_By_Country_FE$boot$Order_2$Mean, decreasing = T),][1:10,]
#>                           From            Through_1                       To
#> 518  Saint Pierre and Miquelon               Canada United States of America
#> 2621                      Guam China, Hong Kong SAR                    China
#> 104           China, Macao SAR China, Hong Kong SAR                    China
#> 1326  Northern Mariana Islands China, Hong Kong SAR                    China
#> 1822                Cabo Verde            Australia                    China
#> 554             American Samoa            Australia                    China
#> 2138                 Gibraltar           Mauritania                    China
#> 522         State of Palestine               Israel United States of America
#> 1521                     Samoa       American Samoa                Indonesia
#> 2017  Turks and Caicos Islands             Zimbabwe             South Africa
#>      Count      Mean       LCI       UCI          SE
#> 518      6 0.5666667 0.3275716 0.7066667 0.090110330
#> 2621     1 0.5500000        NA        NA          NA
#> 104      6 0.4316667 0.3600000 0.4800000 0.029566543
#> 1326     2 0.3750000 0.2000000 0.3750000 0.124575264
#> 1822     1 0.3300000        NA        NA          NA
#> 554      5 0.2980000 0.2320000 0.3653192 0.035285767
#> 2138     1 0.2900000        NA        NA          NA
#> 522      6 0.2866667 0.2816667 0.2933333 0.003015437
#> 1521     2 0.2850000 0.1300000 0.2850000 0.109831703
#> 2017     1 0.2800000        NA        NA          NA
```
