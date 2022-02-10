library(dplyr)
library(lubridate)

# Read and filter the data.
dt <- unzip("epc.zip") %>%
  read.table(sep = ";", header = TRUE) %>%
  filter(Date == "2/2/2007" | Date =="1/2/2007") %>%
  mutate(Date = dmy_hms(paste(Date, Time))) %>% select(-Time) %>% mutate_if(is.character, as.numeric) %>%
  dplyr::as_tibble()

# Creat png picture and save it.
png(file = "plot3.png", width = 480,height = 480, bg = 'transparent')

plot(Sub_metering_1 ~ Date, data = dt, type = "l", xlab = "", ylab = "Energy sub metering")
points(Sub_metering_2 ~ Date, data = dt, type = "l", col = "red")
points(Sub_metering_3 ~ Date, data = dt, type = "l", col = "blue")

legend("topright",
  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col=c("black","red","blue"),
  lty=1)

dev.off()