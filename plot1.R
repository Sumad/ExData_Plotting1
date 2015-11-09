
# Read data
data<- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character",rep("numeric",7)))

# Convert Date columns from charatcer into Date class
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Select data for two days: 2007.02.01 and 2007.02.02

ind<-data$Date == "2007-02-01" | data$Date == "2007-02-02"
data1<- data[ind,]

# Create a png file and save histogram of Gobal active power in it

png(filename="plot1.png",width=480,height=480,units="px")
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()


