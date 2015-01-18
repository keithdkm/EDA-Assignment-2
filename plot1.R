library(plyr)

plot1<- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI$year<-as.factor(NEI$year) 
  a<-ddply(NEI,"year",summarise,Total= sum(Emissions)) #calculate totals by year 
  
  png("plot1.png",width = 720 , height = 480, bg = "transparent")
  
  plot(as.Date(a$year,format = "%Y"),
       a$Total,
       pch = 3, 
       xlab = "Year", 
       ylab = "PM2.5 (tons)",
       xlim = c(as.Date("1998",format="%Y"),as.Date("2008",format="%Y")))
  title("Total US PM2.5 Emissions from all sources in tons")
  #axis(side = 1, at = vapply(seq(as.Date("1998",format="%Y"), as.Date("2008",format="%Y"), "years"),as.Date )
  dev.off()
}