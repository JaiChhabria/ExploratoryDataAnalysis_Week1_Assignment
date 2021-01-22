# Loading whole data

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings = "?",
                 nrows=2075259, check.names = F, stringsAsFactors = F,comment.char = "", quote='\"')

data_2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_2$Date <- as.Date(data_2$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data_2$Date), data_2$Time)
data_2$DateTime <- as.POSIXct(datetime)


## Plotting the data

with(data_2, {
        plot(Global_active_power~DateTime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()