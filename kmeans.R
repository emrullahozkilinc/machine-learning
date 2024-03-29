#Gerekli k�t�phaneleri projeye dahil eder.
library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

#Verisetini g�sterir.
View(iris)

#Sepal Lenght ve Sepal Width kolonlar�n� al�r.
iris_data = iris[1:2]

#Algoritmay� �al��t�r�r.
cluster = kmeans(x = iris_data,centers = 3)

#Sonu�lar� grafi�e �izer.
autoplot(cluster, iris_data, frame=TRUE)


#Verilerin grafi�ini �izer.
scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")
