plot4 <- function()
{
# Read in entire dataset, get rid of NAs
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subset the data by date between 2007-02-01 and 2007-02-02
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# plot 4
# open PNG graphics device
png("plot4.png")

# set up the four regions
par(mfrow=c(2,2))

# create plot 4a (top left)
plot(data$Datetime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(data$Datetime,data$Global_active_power)

# create plot 4b (top right)
plot(data$Datetime,data$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(data$Datetime,data$Voltage)

# create plot 4c (bottom left)
plot(data$Datetime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
lines(data$Datetime,data$Sub_metering_1)
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

# create plot 4d (bottom right)
plot(data$Datetime,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(data$Datetime,data$Global_reactive_power)

# close connection
dev.off()
}