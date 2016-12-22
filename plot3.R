plot3 <- function() {
    ## Load the data, subset for 2 days and convert to suitable formats
    d <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
    d <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")
    d$Date <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
    d$Sub_metering_1 = as.numeric(d$Sub_metering_1)
    d$Sub_metering_2 = as.numeric(d$Sub_metering_2)
    d$Sub_metering_3 = as.numeric(d$Sub_metering_3)
    
    # Plot for png file
    png("plot3.png",  width = 480, height = 480, units = "px")
    plot(d$Date, d$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(d$Date, d$Sub_metering_2, col="red")
    lines(d$Date, d$Sub_metering_3, col="blue")
    legend("topright", col = c("black", "blue", "red"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
    dev.off()
}
