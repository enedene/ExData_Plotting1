#unzip the data file
#please wait for a minute for data to load and transform, script works

#Load the Data
fullData = read.csv(file = "household_power_consumption.txt", sep = ";", header = TRUE, 
                    na.strings = c("?", " ?", "? "), stringsAsFactors = FALSE)
#combine date and time
fullData$DateTime = strptime(paste0(fullData$Date, ":", fullData$Time), format="%d/%m/%Y:%H:%M:%S")

#subset data from the dates 2007-02-01 and 2007-02-0
projectData = fullData[(as.Date(fullData$DateTime) == "2007-02-01") | (as.Date(fullData$DateTime) == "2007-02-02"), ]

#remove Date and Time, as we now have DateTime variable
projectData$Date = NULL
projectData$Time = NULL

png(filename = "plot2.png", width = 480, height = 480)
with(projectData, plot(DateTime, Global_active_power, xlab = "",
                       ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
