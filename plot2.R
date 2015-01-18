plot2<- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI$year<-as.factor(NEI$year)  ##Do I need this
  a<-ddply(subset(NEI,fips == "24510"), ##just use the Baltimore Data
           "year",  #aggregate by year
           summarise, 
           Total= sum(Emissions)) #calculate totals by year using just Baltimore
  
  png("plot2.png",width = 720 , height = 480, bg = "transparent")
  
  plot(as.Date(a$year,format = "%Y"),
       a$Total,
       pch = 3, 
       xlab = "Year", 
       ylab = "PM2.5 (tons)",
       xlim = c(as.Date("1998",format="%Y"),as.Date("2008",format="%Y")))
  
  title("Total Baltimore,MD PMEmissions of PM2.5 from all sources in tons")
  
  dev.off()
} 