# Set locale in the beggining to make everything work fine
Sys.setlocale("LC_TIME","English United States")
# First, unzip the zip file and read the txt
unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", 
                   header=T, quote="\"",sep=";",na.strings="?",fileEncoding = "us-ascii", as.is = T)
# Deal with date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
selected <- subset(data, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
selected$datetime <- with(selected, paste(Date, Time))
selected$datetime <- strptime(selected$datetime, format = "%Y-%m-%d %T")
#Open a png device
png(filename="plot2.png", width = 480, height = 480)
#Draw the blank plot canvas first, then draw the line graph
with(selected, plot(datetime, Global_active_power, type="n", 
                    xlab="", ylab="Global Active Power (kilowatts)"))
with(selected, lines(datetime, Global_active_power))
#Close the png device and save it to the file
dev.off()
