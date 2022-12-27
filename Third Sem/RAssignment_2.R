df <- read.csv("C:/Users/Vinay pathak/Downloads/WHO-COVID-19-global-data.csv")
df
View(df)

# INSTALL PACKAGES
install.packages("rlang")
install.packages("dplyr")
install.packages("viridis")
install.packages("hrbrthemes")
install.packages("tidyverse")


library(dplyr)
library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(tidyr)
library(viridis)

countries <- df %>%
  filter(Country == "Saudi Arabia" | Country == "Zambia")
############################## Cumulative cases######################################################
# histogram of cumulative cases of saudi arabia and zambia

ggplot(countries, aes(x = Cumulative_cases, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("cumulative cases of saudi arabia and zambia")

# LINE PLOT of cumulative cases of saudi arabia and zambia

ggplot(countries, aes(x=ï..Date_reported, y=Cumulative_cases, color = Country, group=1)) +
  geom_line()+
  ggtitle("cumulative cases of saudi arabia and zambia")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of cumulative cases of saudi arabia and zambia
ggplot(countries,aes(x=Country, y=Cumulative_cases, fill=Cumulative_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("boxplot") +
  xlab("")

########################################## New cases ##############################################
# histogram of new cases of saudi arabia and zambia

ggplot(countries, aes(x = New_cases, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("New cases of saudi arabia and zambia")

# LINE PLOT of new cases of saudi arabia and zambia

ggplot(countries, aes(x=ï..Date_reported, y=New_cases, color = Country, group=1)) +
  geom_line()+
  ggtitle("New cases of saudi arabia and zambia")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of new cases of saudi arabia and zambia
ggplot(countries,aes(x=Country, y=New_cases, fill=New_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("boxplot") +
  xlab("")

######################################### Cumulative deaths###########################################

# histogram of cumulative deaths of saudi arabia and zambia

ggplot(countries, aes(x = Cumulative_deaths, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("cumulative Deaths of saudi arabia and zambia")

# LINE PLOT of cumulative deaths of saudi arabia and zambia

ggplot(countries, aes(x=ï..Date_reported, y=Cumulative_deaths, color = Country, group=1)) +
  geom_line()+
  ggtitle("cumulative Deaths of saudi arabia and zambia")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of cumulative cases of saudi arabia and zambia
ggplot(countries,aes(x=Country, y=Cumulative_deaths, fill=Cumulative_deaths, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("boxplot") +
  xlab("")

######################################## New Deaths ########################################################

# histogram of New Deaths of saudi arabia and zambia

ggplot(countries, aes(x = New_deaths, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("New cases of saudi arabia and zambia")

# LINE PLOT of new deaths of saudi arabia and zambia

ggplot(countries, aes(x=ï..Date_reported, y=New_deaths, color = Country, group=1)) +
  geom_line()+
  ggtitle("New deaths of saudi arabia and zambia")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of new cases of saudi arabia and zambia
ggplot(countries,aes(x=Country, y=New_cases, fill=New_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("boxplot") +
  xlab("")

########################################## year wise comparison ######################################

countries2020 <- countries %>%
  filter( ï..Date_reported < '2021-01-01')

countries2021 <- countries %>%
  filter( ï..Date_reported < '2022-01-01' & ï..Date_reported > '2020-12-31')

countries2022 <- countries %>%
  filter(ï..Date_reported > '2021-12-31')


###################################### 2020 #####################################################################

# histogram of New Deaths of saudi arabia and zambia in 2020

ggplot(countries2020, aes(x = New_deaths, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("New cases of saudi arabia and zambia in 2020")

# LINE PLOT of cumulative deaths of saudi arabia and zambia in 2020

ggplot(countries2020, aes(x=ï..Date_reported, y=Cumulative_deaths, color = Country, group=1)) +
  geom_line()+
  ggtitle("cumulative Deaths of saudi arabia and zambia in 2020")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of cumulative cases of saudi arabia and zambia in 2020
ggplot(countries2020,aes(x=Country, y=Cumulative_cases, fill=Cumulative_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Boxplot of cumulative cases of saudi arabia and zambia in 2020 ") +
  xlab("")

#Barplot of new cases of saudi arabia and zambia in 2020 

ggplot(countries2020, aes(x = Cumulative_cases, fill = Country))+
  geom_bar(stat="bin")+
  ggtitle("new cases of saudi arabia and zambia in 2020")

####################################################### 2021 ######################################

# histogram of New Deaths of saudi arabia and zambia in 2021

ggplot(countries2021, aes(x = New_deaths, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("New cases of saudi arabia and zambia in 2021")

# LINE PLOT of cumulative deaths of saudi arabia and zambia in 2021

ggplot(countries2021, aes(x=ï..Date_reported, y=Cumulative_deaths, color = Country, group=1)) +
  geom_line()+
  ggtitle("cumulative Deaths of saudi arabia and zambia in 2021")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of cumulative cases of saudi arabia and zambia in 2021
ggplot(countries2021,aes(x=Country, y=Cumulative_cases, fill=Cumulative_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Boxplot of cumulative cases of saudi arabia and zambia in 2021 ") +
  xlab("")

#Barplot of new cases of saudi arabia and zambia in 2021 

ggplot(countries2021, aes(x = Cumulative_cases, fill = Country))+
  geom_bar(stat="bin")+
  ggtitle("new cases of saudi arabia and zambia in 2021")

############################################ 2022 ####################################################

# histogram of New Deaths of saudi arabia and zambia in 2022

ggplot(countries2022, aes(x = New_deaths, fill = Country))+
  geom_histogram(bins = 20)+
  ggtitle("New cases of saudi arabia and zambia in 2022")

# LINE PLOT of cumulative deaths of saudi arabia and zambia in 2022

ggplot(countries2022, aes(x=ï..Date_reported, y=Cumulative_deaths, color = Country, group=1)) +
  geom_line()+
  ggtitle("cumulative Deaths of saudi arabia and zambia in 2022")+
  xlab(" Dates")+
  ylab("New Cases")+
  theme_ipsum()

#Boxplot of cumulative cases of saudi arabia and zambia in 2022
ggplot(countries2022,aes(x=Country, y=Cumulative_cases, fill=Cumulative_cases, color = Country)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Boxplot of cumulative cases of saudi arabia and zambia in 2022 ") +
  xlab("")

#Barplot of new cases of saudi arabia and zambia in 2022 

ggplot(countries2022, aes(x = Cumulative_cases, fill = Country))+
  geom_bar(stat="bin")+
  ggtitle("new cases of saudi arabia and zambia in 2022")


######################################## Region analysis #########################################

ggplot(df, aes(x=WHO_region, fill=WHO_region)) + geom_bar() + 
  coord_flip()+
  theme_ipsum()

ggplot(df, aes(x=WHO_region, fill=WHO_region)) + geom_bar() + 
  coord_polar()+
  theme_ipsum()

w######################################## comparison with china ################################################

SaudiChinaZambia<-df%>% filter(Country=='Saudi Arabia'|Country=='China'| Country == 'Zambia')
View(SaudiChinaZambia)


ggplot(SaudiChinaZambia, aes(x = ï..Date_reported, y = New_deaths, color = Country, group = Country))+
  geom_line(size = 1.0)+
  scale_x_discrete(breaks=c(2020,2021,2022))+
  xlab("Year")+
  ylab("New Deaths in years")+
  ggtitle("Comparing New Covid Deaths for India USA and China over the Years")+
  theme_ipsum()


ggplot(SaudiChinaZambia, aes(x=ï..Date_reported, y = Cumulative_deaths, group=Country, color = Country)) +
  geom_line(size = 1.0) +
  scale_x_discrete(breaks=c(2020,2021,2022))+
  theme_ipsum()+
  ggtitle("Comparing Cumulative Covid Deaths for India USA and China over the Years")+
  xlab("Years")+
  ylab("Cumulative Deaths")

ggplot(SaudiChinaZambia, aes(x=ï..Date_reported, y = New_cases, group=Country, color = Country)) +
  geom_line(size = 1.0) +
  scale_x_discrete(breaks=c(2020,2021,2022))+
  theme_ipsum()+
  ggtitle("Comparing New Covid Cases for India USA and China over the Years")+
  xlab("Years")+
  ylab("New Cases")

ggplot(SaudiChinaZambia, aes(x=ï..Date_reported, y = Cumulative_cases, group=Country, color = Country)) +
  geom_line(size = 1.0) +
  scale_x_discrete(breaks=c(2020,2021,2022))+
  theme_ipsum()+
  ggtitle("Comparing New Covid Cases for India USA and China over the Years")+
  xlab("Years")+
  ylab("New Cases")