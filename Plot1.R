## Loading full data

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings = "?",
                 nrows=2075259, check.names = F, stringsAsFactors = F,comment.char = "", quote='\"')

data_new <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_new$Date <- as.Date(data_new$Date, format = "%d/%m/%Y")
hist(data_new$Global_active_power, main = "GLobal Active Power", xlab = "Global Active Power (kilowatts)", ylabs = "Frequency", col="Red")

dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
