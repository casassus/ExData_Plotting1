## read relevant data
datos<-read.csv("household_power_consumption.txt",sep=";", dec = ".", stringsAsFactors=FALSE )
datos<-datos[datos$Date=="1/2/2007" | datos$Date=="2/2/2007" ,]

## subsetting
data<-datos["Global_active_power"]
data[,1]<-as.numeric(data[,1])

## plot
hist(data[,1], col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power" )


