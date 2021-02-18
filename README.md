Lab 5 Assignment
================
Kristofer Sando
2/18/2021

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.3     v purrr   0.3.4
    ## v tibble  3.0.4     v dplyr   1.0.2
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.0

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
iris <- as_tibble(iris)
iris
```

    ## # A tibble: 150 x 5
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # ... with 140 more rows

Question \#1

``` r
flower <- rename(iris, sepal_length = Sepal.Length, 
               sepal_width = Sepal.Width, 
               petal_length = Petal.Length, 
               petal_width = Petal.Width, 
               species = Species)
flower
```

    ## # A tibble: 150 x 5
    ##    sepal_length sepal_width petal_length petal_width species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # ... with 140 more rows


    Question #2

    ```r
    mm <- mutate(flower, sepalcm_length = sepal_length * 10, 
           sepalcm_width = sepal_width * 10, 
           petalcm_length = petal_length * 10, 
           petalcm_width = petal_width * 10)
           
    mm

    ## # A tibble: 150 x 9
    ##    sepal_length sepal_width petal_length petal_width species sepalcm_length
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>            <dbl>
    ##  1          5.1         3.5          1.4         0.2 setosa              51
    ##  2          4.9         3            1.4         0.2 setosa              49
    ##  3          4.7         3.2          1.3         0.2 setosa              47
    ##  4          4.6         3.1          1.5         0.2 setosa              46
    ##  5          5           3.6          1.4         0.2 setosa              50
    ##  6          5.4         3.9          1.7         0.4 setosa              54
    ##  7          4.6         3.4          1.4         0.3 setosa              46
    ##  8          5           3.4          1.5         0.2 setosa              50
    ##  9          4.4         2.9          1.4         0.2 setosa              44
    ## 10          4.9         3.1          1.5         0.1 setosa              49
    ## # ... with 140 more rows, and 3 more variables: sepalcm_width <dbl>,
    ## #   petalcm_length <dbl>, petalcm_width <dbl>

Question \#3

``` r
area <- mutate(flower, sepal_area = sepal_length * sepal_width,
       petal_area = petal_length * petal_width)
area
```

    ## # A tibble: 150 x 7
    ##    sepal_length sepal_width petal_length petal_width species sepal_area
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>        <dbl>
    ##  1          5.1         3.5          1.4         0.2 setosa        17.8
    ##  2          4.9         3            1.4         0.2 setosa        14.7
    ##  3          4.7         3.2          1.3         0.2 setosa        15.0
    ##  4          4.6         3.1          1.5         0.2 setosa        14.3
    ##  5          5           3.6          1.4         0.2 setosa        18  
    ##  6          5.4         3.9          1.7         0.4 setosa        21.1
    ##  7          4.6         3.4          1.4         0.3 setosa        15.6
    ##  8          5           3.4          1.5         0.2 setosa        17  
    ##  9          4.4         2.9          1.4         0.2 setosa        12.8
    ## 10          4.9         3.1          1.5         0.1 setosa        15.2
    ## # ... with 140 more rows, and 1 more variable: petal_area <dbl>

``` r
flowerArea <- select(area, sepal_area, petal_area, species)
flowerArea
```

    ## # A tibble: 150 x 3
    ##    sepal_area petal_area species
    ##         <dbl>      <dbl> <fct>  
    ##  1       17.8      0.280 setosa 
    ##  2       14.7      0.280 setosa 
    ##  3       15.0      0.26  setosa 
    ##  4       14.3      0.3   setosa 
    ##  5       18        0.280 setosa 
    ##  6       21.1      0.68  setosa 
    ##  7       15.6      0.42  setosa 
    ##  8       17        0.3   setosa 
    ##  9       12.8      0.280 setosa 
    ## 10       15.2      0.15  setosa 
    ## # ... with 140 more rows

Question \#4

``` r
iris_sepal_summary <- summarise(mm, sample_size = n(), 
                                max = max(sepal_length), 
                                min = min(sepal_length), 
                                range = (max - min), 
                                median = median(sepal_length),
                                quantile1 = quantile(sepal_length, .25),
                                quantile3 = quantile(sepal_length, .75),
                                interquartile = (quantile3 - quantile1))
                                
iris_sepal_summary
```

    ## # A tibble: 1 x 8
    ##   sample_size   max   min range median quantile1 quantile3 interquartile
    ##         <int> <dbl> <dbl> <dbl>  <dbl>     <dbl>     <dbl>         <dbl>
    ## 1         150   7.9   4.3   3.6    5.8       5.1       6.4           1.3

Question \#5

``` r
flowers_grouped <- group_by(flower,species)
iris_petal_summary <-  
  summarize(
flowers_grouped,
sample_size = n(),
mean = mean(petal_length),
standarddeviation = sd(petal_length),
varience = var(petal_length),
se = (standarddeviation / sqrt(sample_size)),
Uconfidenceinterval = mean + (2 * se),
Lconfidenceinterval = mean - (2 * se))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
iris_petal_summary
```

    ## # A tibble: 3 x 8
    ##   species sample_size  mean standarddeviati~ varience     se Uconfidenceinte~
    ##   <fct>         <int> <dbl>            <dbl>    <dbl>  <dbl>            <dbl>
    ## 1 setosa           50  1.46            0.174   0.0302 0.0246             1.51
    ## 2 versic~          50  4.26            0.470   0.221  0.0665             4.39
    ## 3 virgin~          50  5.55            0.552   0.305  0.0780             5.71
    ## # ... with 1 more variable: Lconfidenceinterval <dbl>

Question \#6

``` r
ggplot(data = flower) +
  geom_jitter(mapping = aes(x = species, y = petal_length))
```

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

Question \#7

``` r
ggplot(data = flower) +
  geom_jitter(
    mapping = aes(x = species, y = petal_length)) +
    geom_crossbar(
      data = iris_petal_summary,
      mapping = aes(
        x = species,
        y = mean,
        ymax = Uconfidenceinterval,
        ymin = Lconfidenceinterval
      ),
      color = "red"
    )
```

![](README_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

Question \#8

``` r
ggplot(data = flower) + 
  geom_jitter(mapping =aes(x = petal_length, y= petal_width, color = species))
```

![](README_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->
