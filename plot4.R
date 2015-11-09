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

png(filename="plot4.png",width=480,height=480,units="px")

# Divide screen into 4 parts

par(mfrow=c(2,2))

#  plot 1st graph

plot(data1$Time,data1$Global_active_power,type="l",lwd=1,ylab="Global Active Power(kilowatts)",xlab="")

#  plot 2nd graph

plot(data1$Time,data1$Voltage,type="l",lwd=1,ylab="Voltage",xlab="dateTime")


#  plot 3rd graph

plot(x=data1$Time,y=data1$Sub_metering_1 ,type="l",lwd=2,ylab="Energy Sub metering",xlab="")

lines(x=data1$Time,y=data1$Sub_metering_2,col="red")

lines(x=data1$Time,y=data1$Sub_metering_3,col="blue")

legend(x="topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))


#  plot 4th graph

plot(data1$Time,data1$Global_reactive_power,type="l",lwd=1,ylab="Global Reactive Power(kilowatts)",xlab="dateTime")

dev.off()