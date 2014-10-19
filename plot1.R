# Read in the data

d <- read.csv("./household_p_c_small.txt",sep=";")
d$Date <- as.Date(d$Date,format="%d/%m/%Y")
d$Global_active_power <- as.double(d$Global_active_power)

# subset to only the dates in question
e <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]

# plot the histogram, output device PNG

png(filename="./plot1.png")
hist(e$Global_active_power,col="red",xlab="Global active power (kilowatts)",main="Global Active Power")
dev.off()