plot1<-function(){
  ##Requires the "household_power_consumption.txt" file on the root directectory of the script
  powerData<-read.table("household_power_consumption.txt",sep=";",skip = 66637
                        ,nrows=2880,colClasses = "character",na.strings = "?")
  ##Just used for copy the columns
  headerName<-read.table("household_power_consumption.txt",sep=";",nrows=1
                         ,header = TRUE)
  colnames(powerData)<-colnames(headerName)
  
  png("plot1.png",width = 480,height=480)
  hist(as.numeric(powerData$Global_active_power),col = "red"
       ,main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()
}