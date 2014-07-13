url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consumption.zip")
unzip("power_consumption.zip")
#data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE);
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

data$Date<-strptime(data$Date,"%d/%m/%Y")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")

data$Time<-strptime(data$Time,"%H:%M:%S")
data_w=data[which(data$Date =='2007-02-01' | data$Date =='2007-02-02' ),]

data_w$Global_active_power<-as.numeric(as.character(data_w$Global_active_power))

png("plot1.png", width=480, height=480, units="px")
hist(data_w$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main="Global active power")
dev.off()
