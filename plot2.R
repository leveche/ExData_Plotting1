# Read in the data

d <- read.csv("./household_p_c_small.txt",sep=";",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,format="%d/%m/%Y")
d$Global_active_power <- as.double(d$Global_active_power)

# subset to only the dates in question
e <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]
e$Time <- strptime(paste(as.character(e$Date),as.character(e$Time)),format="%Y-%m-%d %T")

# plot the histogram, output device PNG

png(filename="./plot2.png")
plot(e$Time,e$Global_active_power,type='l',xlab="",ylab="Global active power (kilowatts)")
dev.off()
