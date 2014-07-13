url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consumption.zip")
unzip("power_consumption.zip")
#data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE);
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")

data_w=data[which(data$Date =='2007-02-01' | data$Date =='2007-02-02' ),]

data_w$Global_active_power<-as.numeric(as.character(data_w$Global_active_power))
data_w$dateTime <- strptime( paste(data_w$Date,data_w$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
# panel 1

with(data_w,plot(dateTime,Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='l'))

# panel 2
plot(data_w$dateTime,as.numeric(as.character(data_w$Voltage)),ylab='Voltage',xlab='datetime',type='l')

# panel 3
plot(data_w$dateTime,data_w$Sub_metering_1,ylab='Energy sub metering',xlab='',yaxt='n',ylim=c(0,35),type='l',col='black')
lines(data_w$dateTime,data_w$Sub_metering_2,col='red')
lines(data_w$dateTime,data_w$Sub_metering_3,col='blue')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd=1,bty='n')

# panel 4
plot(data_w$dateTime,as.numeric(as.character(data_w$Global_reactive_power)),yaxt='n',ylab='Global_reactive_power',xlab='datetime',type='l')
axis(side=2, at=seq(0.0,0.5,0.1),labels=seq(0.0,0.5,0.1))

dev.off()