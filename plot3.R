plot3 <- function()
{
# Read in entire dataset, get rid of NAs
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subset the data by date between 2007-02-01 and 2007-02-02
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# plot 3
# open PNG graphics device 
png("plot3.png")

# set up plot with x-axis labels and y-axis labels, but without the data yet
plot(data$Datetime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

# create legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

# add data in line format
lines(data$Datetime,data$Sub_metering_1)
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

# close connection
dev.off()
}