### Author: NAME
### ID: a1234567
### This is a script to clean the survey data for assignment 1
# Packages
library(tidyverse)
# Load data
survey <- read_csv("data/survey2003_dirty.csv")

## I will go through and clean/investigate each variable individually
# Favourite Genre
## Correct variable type? Should be character/factor
class(survey$favourite_genre)

## Table of values
table(survey$favourite_genre)

### 1 actin instead of action
### 1 comdy instead of comedy
### 4 Comedy instead of comedy
### 1 Thriler instead of thriller
### 1 thrller instead of thriller
### "prefer not to answer" treated as NA

## Recode values
### First treat the NA value
survey$favourite_genre[survey$favourite_genre == "prefer not to answer"] <- NA

survey$favourite_genre <- fct_recode(survey$favourite_genre,
                                     action = "actin",
                                     comedy = "Comedy",
                                     comedy = "comdy",
                                     thriller = "Thriler",
                                     thriller = "thrller")
## Bar plot
survey %>% 
  ggplot(aes(favourite_genre)) +
  geom_bar()
### We see that there are more people who like comedy compared to other genres.

# Sleep
## Correct variable type? Should be numeric
class(survey$sleep_hr)

## 5-number summary
summary(survey$sleep_hr)

### Definitely an incorrectly entered observation or 2

## How many incorrectly entered?
### Going to look at more than 12 hours of sleep to see if thes are reasonable
survey$sleep_hr[survey$sleep_hr > 12]

### 2 observations that we don't know the true value of, these are obviously entered incorrectly.

## Histogram, ignoring incorrect data
survey %>% 
  filter(sleep_hr <= 12) %>% 
  ggplot(aes(sleep_hr)) +
  geom_histogram()

## Summary stats
survey %>% 
  filter(sleep_hr <= 12) %>% 
  summarise(m = mean(sleep_hr), s = sd(sleep_hr))

### There could still be some errors here with too little sleep, but these are plausibly values.
### We see the the distribution of sleep is roughly symmetric about a mean of 6.22 hours of sleep and a standard deviation of 1.8 hours of sleep. These values seem reasonable.

# TV
## Correct variable type? Should be numeric
class(survey$TV_hr)

## 5-number summary
summary(survey$TV_hr)

### Definitely an incorrectly entered observation or 2
### Cannot have negative hours of TV

## How many incorrectly entered?
### Going to look at less than 0 hours of TV.  Anything less than 0 can be added
survey$TV_hr[survey$TV_hr < 0]

### 11 observations that we don't know the true value of, these are obviously entered incorrectly.
### We will code these as NA values
survey$TV_hr[survey$TV_hr < 0] <- NA

## 5-number summary again
summary(survey$TV_hr)
### Much better

## Histogram, ignoring incorrect data
survey %>% 
  filter(!is.na(TV_hr)) %>% 
  ggplot(aes(TV_hr)) +
  geom_histogram()
## Summary stats
survey %>% 
  filter(!is.na(TV_hr)) %>% 
  summarise(m = median(TV_hr), s = IQR(TV_hr))
### We see the the distribution of TV is right skewed.  Probably unimodal, but could be bimodal.  Since this is skewed, we look at the median and IQR as measures of location and spread.  This distribution ans a median of 1.1 hours and an IQR of 1.5 hours.

# Height
## Correct variable type? Should be numeric
class(survey$height)
### Wrong variable type, change this to numeric
survey$height <- as.numeric(survey$height)

## 5-number summary
summary(survey$height)
### There are 2 NA's and definitely some incorrect values.  Let's look.

## How many incorrectly entered?
### Going to look at more Taller than 205cm, as this is a believable height.  Also, anything below 63 centimetres is unreasonable (this is the height of the known shortest person.)
survey$height[survey$height > 205|survey$height <63]
### There is 1 incorrect value that is too large it is likely meant to be 186.5.  However, we do not know this for sure, so we don't change it.  There are 3 likely values that are too small

## Histogram, ignoring incorrect data
survey %>% 
  filter(!is.na(height), height <= 205, height >=63) %>% 
  ggplot(aes(height)) +
  geom_histogram()
## Summary stats
survey %>% 
  filter(!is.na(height), height <= 205, height >=63) %>% 
  summarise(m = median(height), s = IQR(height))
### Height seems to be slightly left skewed, unimodal, with median 170 and IQR 20.  These numbers seem reasonable.

# Weight
## Correct variable type? Should be numeric
class(survey$weight)
### Wrong variable type, change this to numeric
survey$weight <- as.numeric(survey$weight)
### The coerced NA's are all reasonable

## 5-number summary
summary(survey$weight)
### There are 3 NA's and definitely some incorrect values.  Let's look.

## How many incorrectly entered?
### Going to look at weight less than 40kg as unreasonable
### I do not deem 190kg as unreasonable.
survey$weight[survey$weight <40]
### There is 1 value I am willing to call incorrectly entered.  Deeper analysis would need to be done to investigate the others.  We will set out lower limit as 37.3.

## Histogram, ignoring incorrect data
survey %>% 
  filter(weight>=73.3, !is.na(weight)) %>% 
  ggplot(aes(weight)) +
  geom_histogram()
## summary Stats
survey %>% 
  filter(weight>=73.3, !is.na(weight)) %>% 
  summarise(m = median(weight), s = IQR(weight))
### Weight seems right skewed.  This could be heavily driven by the subject with 190kg weight.  This distribution appears unimodal, with median 78.25kg and IQR 4.575 kg.  These appear reasonable.

# Gender
## Correct variable type? Should be character/factor
class(survey$gender)

## Table of values
table(survey$gender)
### 2 F instead of Female
### 2 M instead of Male
### No missing values

## Recode values
survey$gender <- fct_recode(survey$gender,
                            Male = "M",
                            Female = "F")
## Bar plot
survey %>% 
  ggplot(aes(gender)) +
  geom_bar()
### We see that there are more Males in the survey.

# Save the data
write_csv(survey, "data/survey_clean.csv")
