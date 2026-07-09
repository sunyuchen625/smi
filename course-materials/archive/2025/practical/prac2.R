library(tidyverse)
data("mpg")
?mpg
str(mpg)

####filter for rows
#看车的厂家
table(mpg$manufacturer)
#找到都是奥迪的厂家
filter(mpg, manufacturer == "audi")#method 1
mpg[mpg$manufacturer== "audi",]#method 2

#More than one constraint(奥迪的厂家和2000前的）:
filter(mpg, manufacturer == "audi", year <= 2000)
mpg[(mpg$manufacturer== "audi") & (mpg$year <= 2000),]

##Filter for cars with front-wheel drive and 6 cylinders. 
###How many cars satisfy these requirements?
filter(mpg, drv == "f", cyl == 6)
filter(mpg, drv == "f" & cyl == 6)

#filter for all cars from audi or dodge
filter(mpg, manufacturer == "audi"| manufacturer == "dodge")
filter(mpg, manufacturer %in% c("audi", "dodge"))

###select for column
##select model, trans
select(mpg, model, trans)

##to select variables whose names contain a particular word, then use contains()
select(mpg, contains("dis"))
##view a range of columns displ to cyl
select(mpg, displ:cyl)
##get the model, displ, and year
select(mpg, model:year)
select(mpg, model, displ, year)

####Mutate
##加一列cty_km_l = cty * 0.425144
mutate(mpg, cty_km_l = cty * 0.425144)
##存下来
mpg1=mutate(mpg, cty_km_l = cty * 0.425144)

####多种操作
##if you want to filter and select and mutate
mpg_audi <- filter(mpg, manufacturer == "audi")
mpg_trans_cty <- select(mpg_audi, trans:cty)
mpg_trans_cty_km <- mutate(mpg_trans_cty, cty_km_l = cty * 0.425144)
mpg_trans_cty_km

##%>% is called a magrittr（then）
mpg %>%
  filter(manufacturer == "audi") %>%
  select(trans:cty) %>%
  mutate(cty_km_l = cty * 0.425144)

###example
#Get all cars from audi that were made before or including 2000.
#Keep only the information for manufacturer,model, displ, year, cty. 
#Filter these for all cars with a city efficiency of greater than 8 km/litre.(cty_km_l = cty * 0.425144))

mpg %>%
  filter(manufacturer == "audi",year <= 2000) %>%
  select(manufacturer:year, cty) %>%
  mutate(cty_km_l = cty * 0.425144) %>%
  filter(cty_km_l > 8)

#####Group_by and summarise
###we wanted the mean city efficiency for each
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(cty))
##add sd and n for each group
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(cty),sd=sd(cty),n = n())

#####function
#####ler CI dwoon load from BB
source("get_lwr_ci.R")
get_lwr_ci(mpg$cty)
#### try upper CI
source("get_upr_ci.R")
get_upr_ci(mpg$cty)


mpg %>% group_by(manufacturer) %>%
  summarise(lwr = get_lwr_ci(cty),
            upr = get_upr_ci(cty))


