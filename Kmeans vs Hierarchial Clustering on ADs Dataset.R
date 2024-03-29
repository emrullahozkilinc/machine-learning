library(ggplot2)
library(caTools)
library(hrbrthemes)

data <- read.csv('https://raw.githubusercontent.com/emrullahozkilinc/machine-learning/master/dataset/Social_Network_Ads.csv')

#Descriptive Stats
hist(data$Age, breaks = 20, 
     main = 'Ya� Da��l�m Grafi�i', 
     xlab = 'Ya�', ylab = 'Frekans')
hist(data$EstimatedSalary, breaks = 20, 
     main = 'Reklam B�t�esi', xlab = 'Dolar($)', ylab = 'Freakans')
summary(data)
sapply(data, nmiss)
sum(is.na(data$Age))
sum(is.na(data$EstimatedSalary))
sum(is.na(data$Purchased))

#Preprocessing
scaled_data = scale(data[,1:2])


#Graphs
ggplot(data, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("�r�n� Alanlar vs Almayanlar") + 
  xlab("Ya�") + 
  ylab("Reklam B�t�esi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)

not_buy <- sum(data$Purchased==0)
buy <- sum(data$Purchased==1)
pie(c(not_buy, buy),
    labels = c(paste('Almad� (', not_buy, ')'), paste('Ald� (', buy, ')')), 
    col = c("cornsilk", "violetred1"),
    main = 'Alanlar vs Almayanlar')

#kmeans
km <- kmeans(scaled_data, 2)
clustered_data.km <- data
clustered_data.km['Purchased'] <- km$cluster
ggplot(clustered_data.km, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("�r�n� Alanlar vs Almayanlar") + 
  xlab("Ya�") + 
  ylab("Reklam B�t�esi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)
success_rate.km <- (table(km$cluster, data$Purchased)[1,1]+
                    table(km$cluster, data$Purchased)[2,2])/400
table(km$cluster, data$Purchased)

#Hierarchical Clustering
hier <- hclust(dist(scaled_data[,0:1]), method = 'average')
plot(hier)
clusterc <- cutree(hier,2)
table(clusterc, data$Purchased)
clustered_data.hc <- data
clustered_data.hc['Purchased'] <- clusterc
ggplot(clustered_data.hc, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("�r�n� Alanlar vs Almayanlar") + 
  xlab("Ya�") + 
  ylab("Reklam B�t�esi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)
success_rate.hc <- (table(clusterc, data$Purchased)[1,1]+
                    table(clusterc, data$Purchased)[2,2])/400

submit <- paste('Kmeans Ba�ar� Oran�: %', success_rate.km*100,
                ' Hiyerarchical Clustering Ba�ar� Oran�: %', success_rate.hc*100)
