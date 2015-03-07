plot2 <- function()
{
# Read in entire dataset, get rid of NAs
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subset the data by date between 2007-02-01 and 2007-02-02
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# plot 2
# open PNG graphics device
png("plot2.png")

# set up plot with x-axis labels and y-axis labels, but without the data yet
plot(data$Datetime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")

# add data in line format
lines(data$Datetime,data$Global_active_power)

# close connection
dev.off()
}