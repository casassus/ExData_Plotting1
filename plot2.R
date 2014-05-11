## read relevant data
datos<-read.csv("household_power_consumption.txt",sep=";", dec = ".", stringsAsFactors=FALSE )
datos<-datos[datos$Date=="1/2/2007" | datos$Date=="2/2/2007" ,]

## subsetting
data1<-datos["Date"]
data3<-datos["Time"]

data1<- paste(data1[1],data3[1],  sep = " ")
data2<-datos["Global_active_power"]


data1[,1]<-as.Date(data1[,1], format="%d/%m/%Y %H:%M:%S")
data2[,1]<-as.numeric(data2[,1])

x<-data1[,1]
y<-data2[,1]

data<-cbind(data1,data2)

## plot 
plot(x,y, ylab="Global Active Power (kilowatts)", xlab="",main="" )
