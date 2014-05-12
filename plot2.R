## read relevant data
datos<-read.csv("household_power_consumption.txt",sep=";", dec = ".", stringsAsFactors=FALSE )
datos<-datos[datos$Date=="1/2/2007" | datos$Date=="2/2/2007" ,]

## subsetting

data<-data.frame(paste(datos[,"Date"],datos[,"Time"]),stringsAsFactors=FALSE)

data2<-datos["Global_active_power"]


data1<-strptime(data[,1], format="%d/%m/%Y %H:%M:%S")
data2[,1]<-as.numeric(data2[,1])


y<-data2[,1]


## plot 
plot(data1,y, type="l", ylab="Global Active Power (kilowatts)", xlab="",main="" )
