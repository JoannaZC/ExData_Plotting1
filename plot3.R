x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                stringsAsFactors=FALSE)
x[,1] <- as.Date(x[,1],"%d/%m/%Y")
range <- (x[,1]=="2007-02-01") | (x[,1]=="2007-02-02")
data <- x[range,]
time <- strptime(paste(data[,1],data[,2]),"%Y-%m-%d %H:%M:%S")
png("plot3.png",width = 480, height = 480)
plot(time,as.numeric(data[,7]),type="l",ylab="Energy sub metering",xlab="")
points(time,as.numeric(data[,8]),type="l",col="red")
points(time,as.numeric(data[,9]),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()