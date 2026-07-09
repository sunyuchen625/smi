#file A3_aXXXXXXX.R
#Example R script for Assignment 3 (practica1)
## Load tidyverse
library(tidyverse)
## Read csv file
drill_dat <- read_csv("data/Drill.csv", col_types = cols())
## Part a) i), ii)

drill_summaries <- drill_dat %>% 
  group_by(Region) %>% 
  summarise(n = n(),
            mean = mean(Time_hr),
            sd = sd(Time_hr))
drill_summaries

## Part a), iii) Since max(sd)/min(sd) > 2, we do not assume equal variance.

## Part a), iv) Perform the t test with t.test
t.test(Time_hr ~ Region,
       alternative="greater", 
       data=drill_dat)
## Testing mu_1 - m_2 = 0 against mu_1 - mu_2 > 0
## Test stat is 05.904
## DF is 70.914
## pval practically 1
## Strongly reject null in favour of alternative.
## CI is (-11.08548, Inf)

## Part b)
# i)
welch_t <- function(mu1,mu2,sd1,sd2,n1,n2){
  t_stat <- (mu1-mu2)/sqrt(((sd1^2)/n1)+((sd2^2)/n2)) # Calculate the test stat using formula from lectures
  v1 <- n1-1 # Find the degrees of freedom for the individual tests
  v2 <- n2-1
  welch_df <-
    ((((sd1^2)/n1)+((sd2^2)/n2))^2)/((((sd1^4)/((n1^2)*v1))+(sd2^4)/((n2^2)*v2))) # Plug and chug formula
  p_val <- pt(t_stat,welch_df,lower.tail=F) # Note, 1 sided test so 1 sided p-value
  return(
    tibble(t_statistic=t_stat,
           DF=welch_df,
           P=p_val)
  )
}

# ii)
b_results <- welch_t(drill_summaries$mean[1], 25, # The means to test
        drill_summaries$sd[1], 2.14, # The sds
        drill_summaries$n[1], 38) # The sample sizes
b_results
## Test stat is 3.52
## DF is 90.4
## P is 0.000338

# iv)
crit_region <- qt(1-0.05,b_results$DF)
welch_df <- b_results$DF
t_stat <- b_results$t_statistic

ggplot(data.frame(c(0,0)), aes(c(-4,4))) +
  geom_area(stat="function",fun=dt,args=list(df=welch_df),fill="#00998a", xlim =
              c(crit_region,4)) + # shaded region
  stat_function(fun=dt,
                args=list(df=welch_df),
                size=1.2) + # density curve
  geom_vline(xintercept=t_stat,
             color="red",
             size=1.2,
             linetype="dashed") +
  labs(x="T",
       y="",
       title=str_c("t-distribution (df = ",welch_df,", alpha = ",0.05,")")) # axis labels
ggsave("figs/A3_crit_value.png")




