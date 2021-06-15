library(ggplot2)
library(caTools)
library(hrbrthemes)

data <- read.csv('https://raw.githubusercontent.com/emrullahozkilinc/machine-learning/master/dataset/Social_Network_Ads.csv')

#Descriptive Stats
hist(data$Age, breaks = 20)
hist(data$EstimatedSalary, breaks = 20)
summary(data)
sapply(data, nmiss)
sum(is.na(data$Age))
sum(is.na(data$EstimatedSalary))
sum(is.na(data$Purchased))

#Preprocessing
scaled_data = scale(data[,1:2])


#Graphs
ggplot(data, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("Ürünü Alanlar vs Almayanlar") + 
  xlab("Yaþ") + 
  ylab("Reklam Bütçesi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)

not_buy <- sum(data$Purchased==0)
buy <- sum(data$Purchased==1)
pie(c(not_buy, buy),
    labels = c(paste('Almadý (', not_buy, ')'), paste('Aldý (', buy, ')')), 
    col = c("cornsilk", "violetred1"),
    main = 'Alanlar vs Almayanlar')

#kmeans
km <- kmeans(scaled_data, 2)
clustered_data.km <- data
clustered_data.km['Purchased'] <- km$cluster
ggplot(clustered_data.km, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("Ürünü Alanlar vs Almayanlar") + 
  xlab("Yaþ") + 
  ylab("Reklam Bütçesi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)
success_rate.km <- (table(km$cluster, data$Purchased)[1,1]+
                    table(km$cluster, data$Purchased)[2,2])/400

#Hierarchical Clustering
hier <- hclust(dist(scaled_data[,0:1]), method = 'average')
plot(hier)
clusterc <- cutree(hier,2)
table(clusterc, data$Purchased)
clustered_data.hc['Purchased'] <- clusterc
ggplot(clustered_data.hc, aes(x=Age, y=EstimatedSalary, color=Purchased)) + 
  ggtitle("Ürünü Alanlar vs Almayanlar") + 
  xlab("Yaþ") + 
  ylab("Reklam Bütçesi") + 
  geom_point(size=3) +
  theme_ipsum(base_family = "Comic Sans MS", base_size = 16)
success_rate.hc <- (table(clusterc, data$Purchased)[1,1]+
                    table(clusterc, data$Purchased)[2,2])/400

submit <- paste('Kmeans Baþarý Oraný: %', success_rate.km*100,
                ' Hiyerarchical Clustering Baþarý Oraný: %', success_rate.hc*100)
