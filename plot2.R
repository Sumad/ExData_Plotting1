# Read data
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character",rep("numeric",7)))

# Convert Date columns from charatcer into Date class
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Select data for two days: 2007.02.01 and 2007.02.02

ind<-data$Date == "2007-02-01" | data$Date == "2007-02-02"
data1<- data[ind,]



# Convert time column into POSIXct time class as it is feasble to draw time plots with POSIXct time object


data1$Time<-as.POSIXct(paste(as.character(data1$Date)," ",data1$Time),"%Y-%m-%d %H:%M:%S",tz="EST")

# Open a png file device

png(filename="plot2.png",width=480,height=480,units="px")

#  plot spcifying x and y variables

 
plot(data1$Time,data1$Global_active_power,type="line",lwd=2,ylab="Global Active Power(kilowatts)",xlab="")

dev.off()