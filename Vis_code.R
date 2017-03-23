# Exploratory vs Explanatory
library(MASS)
mammals
?mammals
head(mammals,5)
library(ggplot2)
ggplot(mammals, aes(x=body,y=brain)) + geom_point()
ggplot(mammals, aes(x=body,y=brain))
?ggplot
?geom_point()

str(mtcars)
# Execute the following command
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()
?mtcars

# data from Nam: http://hubwaydatachallenge.org/