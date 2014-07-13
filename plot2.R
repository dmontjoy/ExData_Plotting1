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
png("plot2.png", width=480, height=480, units="px")
with(data_w,plot(dateTime,Global_active_power, type="l",ylab = "Global Active Power (kilowatts)",xlab = ''))
axis(1, at=c(1,nrow(data_w)/2,nrow(data_w)),labels=c("Thu","Fri","Sat"))
dev.off()