plot2<-function(){
  powerData<-read.table("household_power_consumption.txt",sep=";",skip = 66637
                        ,nrows=2880,colClasses = "character",na.strings = "?")
  headerName<-read.table("household_power_consumption.txt",sep=";",nrows=1
                         ,header = TRUE)
  colnames(powerData)<-colnames(headerName)
  ##add the Date with time column in the dataframe
  powerData$completeDate<-strptime(paste(powerData$Date, powerData$Time, sep="")
                           ,format="%d/%m/%Y%H:%M:%S")
  png("plot2.png",width = 480,height=480)
  plot(powerData$completeDate,powerData$Global_active_power,type = "l"
       ,ylab = "Global Active Power (kilowatts)",xlab="")
  dev.off()
}