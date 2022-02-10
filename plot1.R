library(dplyr)
library(lubridate)

# Download the data zip file.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "epc.zip", method = "curl")

# Read and filter the data.
dt <- unzip("epc.zip") %>%
  read.table(sep = ";", header = TRUE) %>%
  filter(Date == "2/2/2007" | Date =="1/2/2007") %>%
  mutate(Date = dmy_hms(paste(Date, Time))) %>% select(-Time) %>% mutate_if(is.character, as.numeric) %>%
  dplyr::as_tibble()

# Save the data as txt file, so it can be used in future work.
write.table(dt, "dt.txt")

# Creat png picture and save it.
png(file = "plot1.png", width = 480,height = 480)
hist(dt$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
