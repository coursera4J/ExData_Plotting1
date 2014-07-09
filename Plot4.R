#define the datatype for each column for data import
cols<-c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

#read the entire dataset, assume that the data file is in the current workspace folder
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=cols)

#subset the dataset to what the project is asking for
dataSubset<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

#removed rows with NA values
dataNaRmed<-na.omit(dataSubset)

#Combine the Data and Time columns together and create a new column dataTime
#the data frame data2plot is ready to plot
dateTime <-strptime(paste(dataSubset$Date, dataSubset$Time), format="%d/%m/%Y %H:%M:%S")
data2plot<-cbind(dataSubset, dateTime)

#Open Graphic Device
png("plot4.png")

#plot the graph
par(mfcol = c(2, 2))
with(data2plot, 
     {
        plot(dateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
             
        plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(dateTime, Sub_metering_2, col="red")
        lines(dateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_mertering_1","Sub_mertering_2", "Sub_mertering_3"), bty="n") 
        
        plot(dateTime, Voltage, type="l", ylab="Voltage", xlab="datatime")
        plot(dateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datatime")
     }
)


dev.off()
