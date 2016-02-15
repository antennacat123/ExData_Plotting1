#loading data and create sub_data which only included the data we need for plotting
datafile <- "./Exploratory Data Analysis/Assignment1/household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(sub_data$Global_active_power)
globalReactivePower <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
sub_metering1 <- as.numeric(sub_data$Sub_metering_1)
sub_metering2 <- as.numeric(sub_data$Sub_metering_2)
sub_metering3 <- as.numeric(sub_data$Sub_metering_3)

#decide the layout to be 2*2
png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#top left chart
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#top right chart
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#bottom left chart
plot(datetime, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=1.5,col=c("black", "red", "blue"))

#bottom right chart
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()