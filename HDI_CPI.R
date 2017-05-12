dat = read.csv(file="/Users/user/GitHub/data-vis/dataSets/EconomistData.csv",header=TRUE)
library(ggplot2)
library(ggrepel)
library(dplyr)

# Correlation between HDI and CPI
ggplot(dat, aes(x = CPI, y = HDI)) + 
  geom_point(aes(col=Region,size=HDI,alpha=.8)) +
  geom_smooth(data=dat,method="lm",se=FALSE) +
  labs(x="Corruption Perceptions Index",y="Human Development Index") +
  theme_classic() +
  geom_text_repel(data=subset(dat, HDI.Rank <=10),aes(CPI, HDI, label = Country),size=2)

# HDI on the map
dfworldmap = map_data("world")
map_data = merge(dat, dfworldmap, by.x="Country",by.y="region")
map_data = transform(map_data, HDI = cut_number(HDI, 10))
map_data = map_data[order(map_data$order),]
map_data %>%
  ggplot(aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill = HDI)) +
  scale_fill_grey(start=1, end =.3) + 
  geom_path(colour='black') +
  coord_map() +
  ggtitle("Human Development Index Ranking of the world")

# CPI on the map
map_data = merge(dat, dfworldmap, by.x="Country",by.y="region")
map_data = transform(map_data, CPI = cut_number(CPI, 5))
map_data = map_data[order(map_data$order),]
map_data %>%
  ggplot(aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill = CPI)) +
  scale_fill_grey(start=1, end =.3) + 
  geom_path(colour='black') +
  coord_map() +
  ggtitle("Corruption Perceptions Index Ranking of the world")