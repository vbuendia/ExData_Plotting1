
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



png("plot2.png",width=480,height=480);

#Please take into account my computer language is Spanish
plot(power_subset$CompTime,power_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="");

dev.off()