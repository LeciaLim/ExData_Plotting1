# DATASCIENCE: EXPLORATORY DATA ANALYSIS
# WEEK 1: COURSE PROJECT (PART 2)

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

# plot 2
par(mfrow=c(1,1))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(subpower$fulldate, as.numeric(subpower$Global_active_power), 
     main="", ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(subpower$fulldate, as.numeric(subpower$Global_active_power), lwd=1)
dev.off()