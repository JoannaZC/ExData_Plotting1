x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                stringsAsFactors=FALSE)
x[,1] <- as.Date(x[,1],"%d/%m/%Y")
range <- (x[,1]=="2007-02-01") | (x[,1]=="2007-02-02")
data <- x[range,]
time <- strptime(paste(data[,1],data[,2]),"%Y-%m-%d %H:%M:%S")
png("plot2.png",width = 480, height = 480)
plot(time,as.numeric(data[,3]),type="l",ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()