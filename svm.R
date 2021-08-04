#Gerekli kütüphaneleri projeye dahil eder.
library(ggplot2)
library(e1071)

#Veri setini çaðýrýr.
dataset = read.csv('social.csv')
head(dataset)

#Veri setinin 3,4 ve 5. sütunlarýný alýr.
dataset = dataset[3:5]
head(dataset)

#Tahmin için kullanacaðýmýz hedef kolonu belirler.
dataset$Purchased = factor(x = dataset$Purchased, levels = c(0, 1))

#Verileri grafiðe çizer.
ggplot(dataset, aes(x = EstimatedSalary, y = Age, colour = Purchased)) +
  geom_point() +
  labs(title = 'Estimated Salary vs Age')

#Algoritmayý çalýþtýrýr.
classifier = svm(formula = Purchased ~ .,
                 data = dataset,
                 type = 'C-classification',
                 kernel = 'linear')

#Sonuçlarý çizer.
plot(classifier,dataset)

