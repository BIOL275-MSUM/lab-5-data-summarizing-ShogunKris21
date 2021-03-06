library(tidyverse)

iris <- as_tibble(iris)
iris

#Question #1
flower <- rename(iris, sepal_length = Sepal.Length, 
               sepal_width = Sepal.Width, 
               petal_length = Petal.Length, 
               petal_width = Petal.Width, 
               species = Species)
flower

#Question #2
mm <- mutate(flower, sepalcm_length = sepal_length * 10, 
       sepalcm_width = sepal_width * 10, 
       petalcm_length = petal_length * 10, 
       petalcm_width = petal_width * 10)

mm

#Question #3
area <- mutate(flower, sepal_area = sepal_length * sepal_width,
       petal_area = petal_length * petal_width)
area
flowerArea <- select(area, sepal_area, petal_area, species)
flowerArea

#Question #4
iris_sepal_summary <- summarise(mm, sample_size = n(), 
                                max = max(sepal_length), 
                                min = min(sepal_length), 
                                range = (max - min), 
                                median = median(sepal_length),
                                quantile1 = quantile(sepal_length, .25),
                                quantile3 = quantile(sepal_length, .75),
                                interquartile = (quantile3 - quantile1))

iris_sepal_summary

#Question #5
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

iris_petal_summary

#Question #6
ggplot(data = flower) +
  geom_jitter(mapping = aes(x = species, y = petal_length))

#Question #7
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

#Question #8
ggplot(data = flower) + 
  geom_jitter(mapping =aes(x = petal_length, y= petal_width, color = species))
