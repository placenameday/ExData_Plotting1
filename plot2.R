library(dplyr)
library(lubridate)

dt <- unzip("epc.zip") %>%
  read.table(sep = ";", header = TRUE) %>%
  filter(Date == "2/2/2007" | Date =="1/2/2007") %>%
  mutate(Date = dmy_hms(paste(Date, Time))) %>% select(-Time) %>% mutate_if(is.character, as.numeric) %>%
  dplyr::as_tibble()


png(file = "plot2.png", width = 480,height = 480, bg = 'transparent')
plot(Global_active_power ~ Date, data = dt, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
