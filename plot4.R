## read relevant data
datos<-read.csv("household_power_consumption.txt",sep=";", dec = ".", stringsAsFactors=FALSE )
datos<-datos[datos$Date=="1/2/2007" | datos$Date=="2/2/2007" ,]

## initialization
par(mfrow = c(2, 2) , mai=c(1,0.7,0.5,0.5))


## subsetting
datas<-datos[,c("Sub_metering_1", "Sub_metering_2","Sub_metering_3", "Global_active_power", "Voltage", "Global_reactive_power")]
datas[,"Sub_metering_1"]<-as.numeric(datas[,"Sub_metering_1"])
datas[,"Sub_metering_2"]<-as.numeric(datas[,"Sub_metering_2"])
datas[,"Sub_metering_3"]<-as.numeric(datas[,"Sub_metering_3"])
datas[,"Global_active_power"]<-as.numeric(datas[,"Global_active_power"])
datas[,"Voltage"]<-as.numeric(datas[,"Voltage"])
datas[,"Global_reactive_power"]<-as.numeric(datas[,"Global_reactive_power"])

datat<-data.frame(paste(datos[,"Date"],datos[,"Time"]),stringsAsFactors=FALSE)
datat<-data.frame(strptime(datat[,1], format="%d/%m/%Y %H:%M:%S"))

datoss<-cbind(datat,datas)
names(datoss)<-c("datetime", "sm1", "sm2","sm3", "GAP", "V", "GRP")


## plot 1
plot(datoss[c(1,5)], type="l", ylab="Global Active Power", xlab="",main="" )

## plot 2
plot(datoss[c(1,6)], type="l", ylab="Voltage", xlab="datetime",main="" )

## plot 3
plot(datoss[c(1,2)], type="l", ylab="Energy sub metering", xlab="",main="" )
lines(data.matrix(frame=datoss[c(1,3)]), type="l", col="red")
lines(data.matrix(frame=datoss[c(1,4)]), type="l", col="blue")
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n" ,cex=0.9)

## plot 4
plot(datoss[c(1,7)], type="l", ylab="Global_reactive_power", xlab="datetime",main="" )