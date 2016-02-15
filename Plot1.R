#loading data and create sub_data which only included the data we need for plotting
datafile <- "./Exploratory Data Analysis/Assignment1/household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#plot the histogram for Global_active_power
globalActivePower <- as.numeric(sub_data$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
