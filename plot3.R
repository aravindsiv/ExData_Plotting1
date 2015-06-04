## Read all the lines in the file
lines <- readLines("C:/Users//Aravind//Documents//R//coursera-exdata//household_power_consumption.txt");

## Read values into table that correspond to the dates that we want
x <- read.table(text=lines[grep("Date|1/2/2007|2/2/2007",lines)],sep=";",header=TRUE,na.strings="?");

## Some more filtering to discard dates like 12/2/2007 or 21/2/2007
x <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007",];

## Conversion of date and time into proper data types
x$Date <- as.Date(x$Date,"%d/%m/%Y");
fTime <- paste(x$Date,x$Time,sep=" ");
x$Time <- strptime(fTime,"%Y-%m-%d %H:%M:%S");

## Plotting the graph
plot(x$Time,x$Sub_metering_1,type = "n",ylab="Energy sub metering",xlab="");
lines(x$Time,x$Sub_metering_1);
lines(x$Time,x$Sub_metering_2,col="red");
lines(x$Time,x$Sub_metering_3,col="blue");

## Adding a legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"));

## Saving the graph as a .png file.
dev.copy(png,"plot3.png");
dev.off();