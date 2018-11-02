####READING THE DATASET#######
power_data<-read.table(household_power_consumption.txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
###
###SUBSET THE DATA
powerdata_anal <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
str(powerdata_anal)
###Global_active_power needs to be converted to numeric for plotting the graphs 2 and 4
powerdata_anal$Global_active_power<-as.numeric(powerdata_anal$Global_active_power)

#####PLOT1
###saving plot1 in PNG file
png("plot1.png", width=480, height=480)
###Plot the graph
hist(powerdata_anal$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
