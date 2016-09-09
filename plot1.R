
#Load data 

power_cons <- read.table("household_power_consumption.txt",header=TRUE, sep=";",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Subset 

# Subset data

#First convert to date
power_cons$Date <- as.Date(power_cons$Date,"%d/%m/%Y");
dates_allowed <- as.Date(c("2007-02-01","2007-02-02"));

power_subset = subset(power_cons, power_cons$Date >= dates_allowed[1] & power_cons$Date <= dates_allowed[2]);
png("plot1.png",width=480,height=480);
hist(as.numeric(power_subset$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power");
dev.off()