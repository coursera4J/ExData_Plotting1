
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
png("plot1.png")

#plot the graph
hist(data2plot$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")
dev.off()
