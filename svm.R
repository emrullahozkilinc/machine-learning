#Gerekli k�t�phaneleri projeye dahil eder.
library(ggplot2)
library(e1071)

#Veri setini �a��r�r.
dataset = read.csv('social.csv')
head(dataset)

#Veri setinin 3,4 ve 5. s�tunlar�n� al�r.
dataset = dataset[3:5]
head(dataset)

#Tahmin i�in kullanaca��m�z hedef kolonu belirler.
dataset$Purchased = factor(x = dataset$Purchased, levels = c(0, 1))

#Verileri grafi�e �izer.
ggplot(dataset, aes(x = EstimatedSalary, y = Age, colour = Purchased)) +
  geom_point() +
  labs(title = 'Estimated Salary vs Age')

#Algoritmay� �al��t�r�r.
classifier = svm(formula = Purchased ~ .,
                 data = dataset,
                 type = 'C-classification',
                 kernel = 'linear')

#Sonu�lar� �izer.
plot(classifier,dataset)

