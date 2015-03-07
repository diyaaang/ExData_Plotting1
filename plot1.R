plot1 <- function()
{
# Read in entire dataset, get rid of NAs
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Subset the data by date between 2007-02-01 and 2007-02-02
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# plot 1
# open PNG graphics device
png("plot1.png")

# create histogram
hist(data$Global_active_power,col="red",xlab="Frequency",ylab="Global Active Power (kilowatts)",main="Global Active Power")

# close connection
dev.off()
}