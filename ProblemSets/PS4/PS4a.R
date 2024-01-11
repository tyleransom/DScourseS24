# Dowwnload JSON
system('wget -O dates.json "https://www.vizgr.org/historical-events/search.php?format=json&begin_date=00000101&end_date=20210219&lang=en"')

# View contents
system("cat dates.json")

# Convert to df
library(jsonlite)
library(tidyverse)
mylist <- fromJSON('dates.json')
mydf <- bind_rows(mylist$result[-1])

# What is mydf?
print(class(mydf))

# What is mydf$date?
print(class(mydf$date))

# Print first few rows
print(head(mydf))


