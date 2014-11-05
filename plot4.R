# Read in the data

d <- read.csv("./household_p_c_small.txt",sep=";",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,format="%d/%m/%Y")
d$Global_active_power <- as.double(d$Global_active_power)
d$Voltage <- as.double ( d$Voltage )
d$Global_reactive_power <- as.double ( d$Global_reactive_power )
d$Sub_metering_1 <- as.double(d$Sub_metering_1)
d$Sub_metering_2 <- as.double(d$Sub_metering_2)
d$Sub_metering_3 <- as.double(d$Sub_metering_3)

# subset to only the dates in question
e <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]
e$Time <- strptime(paste(as.character(e$Date),as.character(e$Time)),format="%Y-%m-%d %T")

# plot the histogram, output device PNG

png(filename="./plot4.png")
par(mfrow = c(2, 2))

# global active power - from plot 2
plot(e$Time,e$Global_active_power,type='l',xlab="",ylab="Global Active Power")

# voltage
plot(e$Time,e$Voltage,type='l',xlab="datetime",ylab="Voltage")

# energy sub metering - from plot 3
plot(e$Time,e$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(e$Time,e$Sub_metering_2,col='red')
lines(e$Time,e$Sub_metering_3,col='blue')
legend("topright", legend=colnames(d)[grep('Sub_metering',colnames(d))], lty=c(1,1,1), col=c("black","red","blue"), bty="n" )


# global reactive power
plot(e$Time,e$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()

