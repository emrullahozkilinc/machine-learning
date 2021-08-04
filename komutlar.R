help("ls") #Herhangi bir fonksiyon ile ilgili bilgi verir.
ls() #Þu anki deðiþkenleri listeler.
rm(x) #x deðiþkenini çalýþma ortamýndan siler.
mode(x) #Deðiþkenin tipini söyler.
getwd() #Dizini gösterir.
setwd("~/dataset") #Dizini deðiþtirir.
data() #R'da kurulu veri setlerini listeler.
install.packages("ggplot2") #Ýstediðimiz bir paketi kurar.
read.csv(file.choose()) #Veri setini okur.


#Matematiksel ve istatistiksel
sqrt(256) #Sayýnýn karekökünü alýr.

vektor1 = c(56,32,15,25,1)
mean(vektor1) #Vektör elemanlarýnýn ortalamasýný verir.
sd(vektor1) #Vektör elemanlarýnýn standart sapmasýný verir.
median(vektor1) #Vektör elemanlarýnýn medyanýný verir.
var(vektor1) #Varyansý verir.
rnorm(10,mean = 30, sd = 3) #Ortalamasý 30 ve standart sapmasý 3 olan 10 eleman verir.

vektor2 = c(24,36,18,24,5)
cor(vektor1,vektor2) #2 vektör arasýndaki korelasyon katsayýsýný verir.
cov(vektor1,vektor2) #Kovaryansý verir.
