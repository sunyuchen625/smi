income <- c(25, 33, 22, 41, 18, 28, 32, 24, 53, 26)
education <- c(11, 12, 11, 15, 8, 10, 11, 12, 17, 11)

# Fit the linear regression model
model_q1 <- lm(income ~ education)
summary(model_q1)

new_edu <- data.frame(education = 16)
predict(model_q1, new_edu, interval = "confidence", level = 0.90)

predict(model_q1, new_edu, interval = "prediction", level = 0.90)