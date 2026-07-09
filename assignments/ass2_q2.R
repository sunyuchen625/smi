batting <- c(0.254, 0.269, 0.255, 0.262, 0.254, 0.247, 0.264, 0.271, 0.280, 0.256, 0.248, 0.255, 0.270, 0.257)
winning <- c(0.414, 0.519, 0.500, 0.537, 0.352, 0.519, 0.506, 0.512, 0.586, 0.438, 0.519, 0.512, 0.525, 0.562)

# Fit the linear regression model
model_q2 <- lm(winning ~ batting)
summary(model_q2)

new_batting <- data.frame(batting = 0.275)
predict(model_q2, new_batting, interval = "confidence", level = 0.90)

predict(model_q2, new_batting, interval = "prediction", level = 0.90)