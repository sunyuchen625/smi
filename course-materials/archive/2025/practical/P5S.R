####Load data
mpg=read.table("mpg.csv",sep = ",",header = TRUE)
head(mpg)
library(tidyverse)
library(MASS)
data(mpg)

##1 Simple linear regression
#a)produce a scatterplot of cty on displ. Comment on the relationship between cty and displ.
library(ggplot2)
ggplot(mpg1, aes(x = displ, y = cty)) + geom_point()
#b)Fitting a linear model
M1 <- lm(cty ~ displ, data = mpg)
summary(M1)
#c Obtaining coefficients
library(broom)
tidy(M1)
#d Get Model summaries
glance(M1)
#e Assumption checking
#1) Linearity
#2) Normality
#3) Constant variance
#4) Independence
par(mfrow = c(2,2))
plot(M1)
#f obtain the residuals and fitted values
residuals(M1)
fitted(M1)
#g Prediction
##with no new data,
predict(M1)[1:10] 
##predict for new values,
newdata = data.frame(displ=c(3,4,5,6))
predict(M1, newdata = newdata)

##2 Categorical variables in a linear model
# categorial variables cty ~ drv
M2 = lm(cty ~ drv, data = mpg)
summary(M2)
anova(M2)
tidy(anova(M2))

####Multiple linear regression
###a with displ and drv
M3 <- lm(cty ~ displ + drv, data = mpg)
###b add intersection
M4 <- lm(cty ~ displ + drv + displ:drv, data = mpg)
M5 <- lm(cty ~ displ * drv, data = mpg)
summary(M5)

#####Model selection
#a)there is curvature in the dataset, we will use the log transform of cty.
full =log(cty) ~ (cyl + displ + drv)^2
smallest= log(cty) ~ 1
fullfit=lm(full,data=mpg)
smallestfit=lm(smallest,data=mpg)
add1(smallestfit, scope = full, test = "F")

summary(smallestfit)

####Automatic Model selection
step(fullfit, direction = "backward",k=log(234))
step(smallestfit, scope = full, direction = "forward")
     
