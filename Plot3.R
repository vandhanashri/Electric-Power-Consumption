####READING THE DATASET#######
power_data<-read.table(household_power_consumption.txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
###
###SUBSET THE DATA
powerdata_anal <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerdata_anal)
###Sub_metering needs to be converted to numeric for plotting 

powerdata_anal$Sub_metering_1<-as.numeric(powerdata_anal$Sub_metering_1)
powerdata_anal$Sub_metering_2<-as.numeric(powerdata_anal$Sub_metering_2)
powerdata_anal$Sub_metering_3<-as.numeric(powerdata_anal$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, powerdata_anal$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, powerdata_anal$Sub_metering_2, type="l", col="red")
lines(datetime, powerdata_anal$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
