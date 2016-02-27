plot3<-function(){
  powerData<-read.table("household_power_consumption.txt",sep=";",skip = 66637
                        ,nrows=2880,colClasses = "character",na.strings = "?")
  headerName<-read.table("household_power_consumption.txt",sep=";",nrows=1
                         ,header = TRUE)
  colnames(powerData)<-colnames(headerName)
  ##add the Date with time column in the dataframe
  powerData$completeDate<-strptime(paste(powerData$Date, powerData$Time, sep="")
                                   ,format="%d/%m/%Y%H:%M:%S")
  png("plot3.png",width = 480,height=480)
  plot(powerData$completeDate,powerData$Sub_metering_1,type = "l"
       ,ylab = "Energy sub metering",xlab="",col="black")
  points(powerData$completeDate,powerData$Sub_metering_2,type = "l",col="red")
  points(powerData$completeDate,powerData$Sub_metering_3,type = "l",col="blue")
  legend("topright",lwd =1,col=c("black","red","blue")
      ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}