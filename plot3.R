## read relevant data
datos<-read.csv("household_power_consumption.txt",sep=";", dec = ".", stringsAsFactors=FALSE )
datos<-datos[datos$Date=="1/2/2007" | datos$Date=="2/2/2007" ,]

## subsetting
datas<-datos[,c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")]
datas[,"Sub_metering_1"]<-as.numeric(datas[,"Sub_metering_1"])
datas[,"Sub_metering_2"]<-as.numeric(datas[,"Sub_metering_2"])
datas[,"Sub_metering_3"]<-as.numeric(datas[,"Sub_metering_3"])

datat<-data.frame(paste(datos[,"Date"],datos[,"Time"]),stringsAsFactors=FALSE)
datat<-data.frame(strptime(datat[,1], format="%d/%m/%Y %H:%M:%S"))

datoss<-cbind(datat,datas)
names(datoss)<-c("datetime", "sm1", "sm2","sm3")

## plot 
plot(datoss[c(1,2)], type="l", ylab="Energy sub metering", xlab="",main="" )
lines(data.matrix(frame=datoss[c(1,3)]), type="l", col="red")
lines(data.matrix(frame=datoss[c(1,4)]), type="l", col="blue")

## annotation
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
