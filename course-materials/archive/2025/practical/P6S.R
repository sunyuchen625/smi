library(tidyverse)
data(mpg)
######Task 1: Primary examination of the data
###use a scatter-plot to describe the relationship between Displacement and City Miles per Gallon
ggplot(mpg,aes(displ, cty)) +
  geom_point()
###Produce a side-by-side box plot of cty for each level of drv. 
ggplot(mpg,aes(x = drv, y = cty)) +
  geom_boxplot()
###Produce a scatter-plot of Displacement vs City miles per gallon with different colours and lines for each Drive (type).
ggplot(mpg,aes(displ, cty, col = drv)) +
  geom_point() +
  geom_smooth(method = "lm")

######Task 2: ANOVA
###model cty ~ drv, perform an ANOVA to test the hypothesis 
mpg_anova_lm <- lm(cty ~ drv, data = mpg)
anova(mpg_anova_lm)

#####Task 3: Identical regression lines
mpg1=select(mpg,drv, displ,cty)  
mpg1=group_by(mpg1,drv) 
mpg1=slice(mpg1,1) 
####write down the design matrix for the identical regression
library(modelr)
model_matrix(mpg1,cty ~ displ)
####Fit a linear model for cty vs displ with identical regression lines for drv
lm_identical <- lm(cty ~ displ, data = mpg)
summary(lm_identical)

#####Task 4: Parallel regression lines
##write down the design matrix for the identical regression
model_matrix(mpg1,cty ~ displ+drv)
##Fit a linear model for the parallel regression of City Miles per Gallon on Displacement and Drive (type),
lm_parallel <- lm(cty ~ displ + drv, data = mpg)
summary(lm_parallel)

#####Task 5:Separate regression lines
##write down the design matrix for the identical regression
model_matrix(mpg1,cty ~ displ*drv)
##Fit a linear model for the separate regression of City Miles per Gallon on Displacement and Drive,
lm_parallel <- lm(cty ~ displ * drv, data = mpg)
summary(lm_parallel)


#####Task 6: Model Selection
####Use AIC or BIC to decide on the most appropriate model. 
AIC(lm_identical, lm_parallel, lm_separate)
BIC(lm_identical, lm_parallel, lm_separate)

##Use your final model to predict the mean City Miles per Gallon for a four-wheel drive with a displacement of 4 litres.
predict(lm_separate,newdata=data.frame(drv="4",displ=4))

