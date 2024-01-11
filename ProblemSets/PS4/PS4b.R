library(tidyverse)
library(sparklyr)

# install Spark and connect to R
spark_install(version = "3.0.0")
sc <- spark_connect(master = "local")

# load iris data frame into Spark
df1 <- as_tibble(iris)
df  <- copy_to(sc, df1)
print(class(df1))
print(class(df))

# select
df  %>% select(Sepal_Length,Species) %>% head %>% print
df1 %>% select(Sepal.Length,Species) %>% head %>% print

# filter
df  %>% filter(Sepal_Length>5.5) %>% head %>% print
df1 %>% filter(Sepal.Length>5.5) %>% head %>% print

# combine select and filter
df  %>% filter(Sepal_Length>5.5) %>% select(Sepal_Length,Species) %>% head %>% print

# group by
df2 <- df %>% group_by(Species) %>% summarize(mean  = mean(Sepal_Length),
                                              count = n()
                                             ) %>%
              head %>% print

# arrange
df2 %>% arrange(Species) %>% head %>% print


