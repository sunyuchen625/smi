library(tidyverse)
data(mpg)
head(mpg)
str(mpg)

#1 ggplot
###we will start with a scatterplot of city miles per gallon(cty)
##against engine displacement(displ)
ggplot(mpg,aes(x = displ, y = cty))+
  geom_point()
##Describe the relationship between displ and cty.

#2 Colour my plot 
##qLet’s look at the relationship between cty and displ
##for the different types of drives (drv).
ggplot(mpg,aes(x = displ, y = cty, col = drv)) +
  geom_point()


#3legend
##2a move legend to bottom
ggplot(mpg,aes(x = displ, y = cty, col = drv)) +
  geom_point()+
  theme(legend.position = "bottom")
##2b remove the legend.
ggplot(mpg,aes(x = displ, y = cty, col = drv)) +
  geom_point(show.legend = FALSE)

###4change the shapesof the data points.
##4a shape by drv, col by class
ggplot(mpg,aes(x = displ, y = cty, shape = drv, col = class))+
   geom_point()

###5a split plots with  facet_wrap() and facet_grid().
ggplot(mpg,aes(x = displ, y = cty,shape = drv, col = class)) + geom_point() +
  facet_grid(class~drv)
##5b with color
ggplot(mpg,aes(x = displ, y = cty,shape = drv, col = class)) + geom_point() +
  facet_grid(class~drv)
###5c split one variable, then we use facet_wrap():
ggplot(mpg,aes(x = displ, y = cty)) + geom_point() +
  facet_wrap(~class)
### compare split one variable with facet_wrap() and facet_grid().
ggplot(mpg,aes(x = displ, y = cty)) + geom_point() +
  facet_grid(~class)

###6 add summary statistics to plots
##6a add linear model to x = displ, y = cty
ggplot(mpg,aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth(method = "lm")
##6b add a line of best fit for each type of drive 
ggplot(mpg,aes(x = displ, y = cty, col = drv)) +
  geom_point() +
  geom_smooth(method = "lm")

####7 boxplot
###7a boxplots of cty for each type of drive.
ggplot(mpg,aes(x = drv, y = cty)) + geom_boxplot()

####challenges

ggplot(mpg,aes(cty, hwy, col = drv)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~drv, scale = "free")+
  theme(legend.position = "top")+
  labs(col = "Drive", x = "City fuel efficiency", y = "Highway fuel efficiency")


