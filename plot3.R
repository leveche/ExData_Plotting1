# Read in the data

d <- read.csv("./household_p_c_small.txt",sep=";",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,format="%d/%m/%Y")
d$Sub_metering_1 <- as.double(d$Sub_metering_1)
d$Sub_metering_2 <- as.double(d$Sub_metering_2)
d$Sub_metering_3 <- as.double(d$Sub_metering_3)

# subset to only the dates in question
e <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]
e$Time <- strptime(paste(as.character(e$Date),as.character(e$Time)),format="%Y-%m-%d %T")

# plot the histogram, output device PNG

png(filename="./plot3.png")
plot(e$Time,e$Sub_metering_1,type='l',xlab="",ylab="Energy Sub Metering", main="Energy Sub Metering")
lines(e$Time,e$Sub_metering_2,col='red')
lines(e$Time,e$Sub_metering_3,col='blue')
legend("topright", legend=colnames(d)[grep('Sub_metering',colnames(d))], lty=c(1,1,1), col=c("black","red","blue") )
dev.off()
