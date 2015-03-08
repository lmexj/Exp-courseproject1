setwd("D:/Coursera/Data Science Specialization/4. Exploratory data analysis/Week1 Analytic graphics and base plotting")

library(dplyr)
Data<- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                  sep= ";", header= TRUE, na.strings="?")
Sys.setlocale("LC_TIME", "English")

# Subset data from the dates 2007-02-01 and 2007-02-02 
Data2<- subset(Data, Date =="1/2/2007"| Date =="2/2/2007")

# Convert data and time to POSIXlt format
x <- paste(Data2$Date, Data2$Time, sep= " " )
head(x)
fulltime <- strptime(x, format= "%d/%m/%Y %H:%M:%S")
date <- as.Date(fulltime)
Data2 <- mutate(Data2, Date = date) # exchange the Data column with reformated dates
Data2$fulltime <- fulltime # add full dates and time column
names(Data2)

### Plot 2
Data2$Global_active_power = as.numeric(Data2$Global_active_power)
png(filename =  "plot2.png", width = 480, height = 480, units = "px",
    bg = "transparent") 
with(Data2, plot(x = fulltime, y = Global_active_power,  type="l", ylab= "Global Active Power (kilowatts)" ))
dev.off()
