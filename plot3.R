url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consumption.zip")
unzip("power_consumption.zip")
#data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE);
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")

data_w=data[which(data$Date =='2007-02-01' | data$Date =='2007-02-02' ),]

data_w$Global_active_power<-as.numeric(as.character(data_w$Global_active_power))
data_w$dateTime <- strptime( paste(data_w$Date,data_w$Time), format="%Y-%m-%d %H:%M:%S")
#windows()
png("plot3.png", width=480, height=480, units="px")

with(data_w,plot(dateTime,Sub_metering_1,ylab='Energy sub metering',xlab='',yaxt='n',ylim=c(0,35),type='l',col='black'))
with(data_w,lines(dateTime,Sub_metering_2,col='red'))
with(data_w,lines(dateTime,Sub_metering_3,col='blue'))
axis(side=2, at=seq(0,30,10), labels=seq(0,30,10))

legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd=1)
dev.off()