plot4 <- function() {
    ## Load the data, subset for 2 days and convert to suitable formats
    d <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
    d <- subset(d, Date == "1/2/2007" | Date =="2/2/2007")
    d$Date <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
    d$Sub_metering_1 = as.numeric(d$Sub_metering_1)
    d$Sub_metering_2 = as.numeric(d$Sub_metering_2)
    d$Sub_metering_3 = as.numeric(d$Sub_metering_3)
    d$Global_active_power = as.numeric(d$Global_active_power)
    d$Voltage = as.numeric(d$Voltage)
    d$Global_reactive_power = as.numeric(d$Global_reactive_power)
    
    ## Plot for png file
    png("plot4.png",  width = 480, height = 480, units = "px")
    
    par(mfrow=c(2,2))  ## create a 2 x 2 plot
    
    ## Plot 1
    plot(d$Date, d$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
    
    ## Plot 2
    plot(d$Date, d$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
    
    ## Plot 3
    plot(d$Date, d$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(d$Date, d$Sub_metering_2, col="red")
    lines(d$Date, d$Sub_metering_3, col="blue")
    legend("topright", col = c("black", "blue", "red"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), box.lwd=0)
    
    ## Plot 4
    plot(d$Date, d$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_Reactive_Power")
    dev.off()
}
