library(plyr)

plot1<- function(){
  setwd("C:/Users/Keith_2/Documents/R/Exploratory Data Analysis/Assignment 2")
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI$year<-as.factor(NEI$year)  ##Do I need this
  a<-ddply(NEI,"year",summarise,Total= sum(Emissions)) #calculate totals by year 
  
  png("plot1.png",width = 480 , height = 480, bg = "transparent")
  
  plot(as.Date(a$year,format = "%Y"),
       a$Total,
       pch = 3, 
       xlab = "Year", 
       ylab = "PM2.5 (tons)",
       xlim = c(as.Date("1998",format="%Y"),as.Date("2008",format="%Y")))
  title("Total US Emissions of PM2.5 in tons")
  dev.off()
}