# First, unzip the zip file and read the txt
unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", 
                   header=T, quote="\"",sep=";",na.strings="?",fileEncoding = "us-ascii", as.is = T)
# Deal with date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
selected <- subset(data, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
#Open a png device
png(filename="plot1.png", width = 480, height = 480)
#Draw the histogram
hist(selected$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power") 
#Close the png device and save it to the file
dev.off()
