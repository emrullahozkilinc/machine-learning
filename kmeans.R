#Gerekli kütüphaneleri projeye dahil eder.
library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

#Verisetini gösterir.
View(iris)

#Sepal Lenght ve Sepal Width kolonlarýný alýr.
iris_data = iris[1:2]

#Algoritmayý çalýþtýrýr.
cluster = kmeans(x = iris_data,centers = 3)

#Sonuçlarý grafiðe çizer.
autoplot(cluster, iris_data, frame=TRUE)


#Verilerin grafiðini çizer.
scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")
