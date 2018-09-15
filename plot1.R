# DATASCIENCE: EXPLORATORY DATA ANALYSIS
# WEEK 1: COURSE PROJECT (PART 1)

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

# plot 1
par(mfrow=c(1,1))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(subpower$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()