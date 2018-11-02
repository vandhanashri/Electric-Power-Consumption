####READING THE DATASET#######
power_data<-read.table(household_power_consumption.txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
###
###SUBSET THE DATA
powerdata_anal <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerdata_anal)
###Global_active_power needs to be converted to numeric for plotting the graphs 2 and 4
powerdata_anal$Global_active_power<-as.numeric(powerdata_anal$Global_active_power)
powerdata_anal$Sub_metering_1<-as.numeric(powerdata_anal$Sub_metering_1)
powerdata_anal$Sub_metering_2<-as.numeric(powerdata_anal$Sub_metering_2)
powerdata_anal$Sub_metering_3<-as.numeric(powerdata_anal$Sub_metering_3)
powerdata_anal$Global_reactive_power<-as.numeric(powerdata_anal$Global_reactive_power)
powerdata_anal$Voltage<-as.numeric(powerdata_anal$Voltage)
datetime <- strptime(paste(powerdata_anal$Date, powerdata_anal$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

####PLOT4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime,powerdata_anal$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, powerdata_anal$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, powerdata_anal$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,powerdata_anal$Sub_metering_2, type="l", col="red")
lines(datetime, powerdata_anal$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, powerdata_anal$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
