####READING THE DATASET#######
power_data<-read.table(household_power_consumption.txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
###
###SUBSET THE DATA
powerdata_anal <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerdata_anal)
###Global_active_power needs to be converted to numeric for plotting the graphs 2 and 4
powerdata_anal$Global_active_power<-as.numeric(powerdata_anal$Global_active_power)

###PLOT2#######
datetime <- strptime(paste(powerdata_anal$Date, powerdata_anal$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerdata_anal$Global_active_power <- as.numeric(powerdata_anal$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, powerdata_anal$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
