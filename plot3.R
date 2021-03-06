#Load data 

power_cons <- read.table("household_power_consumption.txt",header=TRUE,  na.strings = "?", sep=";",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Subset 

# Subset data

#First convert to date
power_cons$Date_f <- as.Date(power_cons$Date,"%d/%m/%Y");
dates_allowed <- as.Date(c("2007-02-01","2007-02-02"));

power_subset = subset(power_cons, power_cons$Date_f >= dates_allowed[1] & power_cons$Date_f <= dates_allowed[2]);

#Prepare a time column
power_subset$CompTime <-strptime(paste(power_subset$Date, power_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


png("plot3.png",width=480,height=480);
with(power_subset, {
  plot(CompTime,Sub_metering_1, type="l",xlab="",ylab="Global Active Power (kilowatts)",col="Black")
  lines(CompTime,Sub_metering_2, type="l",col="Red")
  lines(CompTime,Sub_metering_3, type="l",col="Blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(1,1,1),col=c("black","red","blue"))
})

dev.off()