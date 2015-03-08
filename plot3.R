setwd("D:/Coursera/Data Science Specialization/4. Exploratory data analysis/Week1 Analytic graphics and base plotting")

library(dplyr)
Sys.setlocale("LC_TIME", "English")
Data<- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                  sep= ";", header= TRUE, na.strings="?")
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
names(Data2[,7:9])

### Plot3.
png(filename =  "plot3.png", width = 480, height = 480, units = "px",
    bg = "transparent") 
with(Data2, plot(x = fulltime, y = Data2[,7],  type="l", 
                 ylab= "Energy sub metering", xlab = "",
                 ylim = c(0,30) ))
lines(x = fulltime, y = Data2[,8] , col = "red") 
lines(x = fulltime, y = Data2[,9] , col = "blue")
legend("topright", pch = "____", cex=.8, col = c("black", "blue", "red"), legend = names(Data2[,7:9]))
par(new = FALSE)
dev.off()
