x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                stringsAsFactors=FALSE)
x[,1] <- as.Date(x[,1],"%d/%m/%Y")
range <- (x[,1]=="2007-02-01") | (x[,1]=="2007-02-02")
data <- x[range,]
png("plot1.png",width = 480, height = 480)
hist(as.numeric(data[,3]),xlab="Global Active Power (kilowatts)",col="red",
     main="Global Active Power")
dev.off()