## plot1.R

## Import libraries
library(dplyr)

## Download file to local folder, unzip and import as data frame (df)
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
# unzip("household_power_consumption.zip")

df_read <- read.table("household_power_consumption.txt", header=T, sep=";")
df <- tbl_df(df_read) # Make data frame more readable
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ] # Make subset for relevant dates

## Tidying data, convert date and time to POSIXct and numeric values stored as factors to numeric

time2 <- strptime(paste(df$Date, df$Time), "%m/%d/%Y %H:%M:%S")
time2 <- as.data.frame(date2)
factors <- select(df, -c(Date, Time))
nums <- as.data.frame(lapply(factors, function(x) as.numeric(as.character(x)))) 
names(date2) <- "Time"
df_tidy <- tbl_df(cbind(time2, nums))

## With tidy data, creat plot and export to 

# First, check output on screen
png(file = "plot4.png")
par(mfcol = c(2,2))
plot(df_tidy$Time, df_tidy$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
with(df_tidy, plot(Time, Sub_metering_1, type="l", 
                   ylab = "Energy sub metering", xlab = ""))
with(df_tidy, lines(Time, Sub_metering_2, col="red"))
with(df_tidy, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(df_tidy$Time, df_tidy$Voltage, ylab = "Voltage", 
     xlab = "datetime", type = "l")
with(df_tidy, plot(Time, Global_reactive_power, type = "l", 
                   xlab="datetime"))

# Export to png. Default export size is the one asked for (480x480)
png(file = "plot4.png")
par(mfcol = c(2,2))
plot(df_tidy$Time, df_tidy$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
with(df_tidy, plot(Time, Sub_metering_1, type="l", 
                   ylab = "Energy sub metering", xlab = ""))
with(df_tidy, lines(Time, Sub_metering_2, col="red"))
with(df_tidy, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(df_tidy$Time, df_tidy$Voltage, ylab = "Voltage", 
     xlab = "datetime", type = "l")
with(df_tidy, plot(Time, Global_reactive_power, type = "l", 
                   xlab="datetime"))
dev.off()






