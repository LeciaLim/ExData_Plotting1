# DATASCIENCE: EXPLORATORY DATA ANALYSIS
# WEEK 1: COURSE PROJECT (PART 3)

# Download the datasets
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "power.zip"
if (!file.exists(fileName)) {
  download.file(fileURL, fileName)
}
if (!file.exists("household_power_consumption.txt")) {
  unzip(fileName)
}

power <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subdate <- seq(as.Date("2007-02-01"), as.Date("2007-02-02"), by="day")
subpower <- power[power$Date %in% subdate,]
subpower$fulldate <- as.POSIXct(paste(subpower$Date, subpower$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 4

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

plot(subpower$fulldate, as.numeric(subpower$Global_active_power), type="n", ylab="Global Active Power", xlab="")
lines(subpower$fulldate, as.numeric(subpower$Global_active_power))

plot(subpower$fulldate, subpower$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(subpower$fulldate, subpower$Voltage)

plot(subpower$fulldate, subpower$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering")
lines(subpower$fulldate, subpower$Sub_metering_1, col="black")
lines(subpower$fulldate, subpower$Sub_metering_2, col="red")
lines(subpower$fulldate, subpower$Sub_metering_3, col="blue")
legend("topright", pch="-",lwd=2, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", cex = 0.85)

plot(subpower$fulldate, subpower$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subpower$fulldate, subpower$Global_reactive_power)

dev.off()