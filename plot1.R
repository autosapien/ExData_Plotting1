plot1 <- function() {
    ## Load the data, subset for 2 days and convert to suitable formats
    d <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=FALSE)
    d <- subset(d, Date == "1/2/2007" | Date =="2/2/2007")
    d$Date <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
    d$Global_active_power <- as.numeric(d$Global_active_power)
    
    # Plot for png file
    png("plot1.png",  width = 480, height = 480, units = "px")
    hist(e$gap, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
    dev.off()
}
