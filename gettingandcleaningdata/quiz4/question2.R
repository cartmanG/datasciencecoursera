# Question 2
# download file from server
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
              destfile = "q2.csv", 
              method = "curl")

# load library
library(plyr)
library(dplyr)

# load csv file
q2 <- read.csv("q2.csv", header = TRUE, skip = 3)

# reshape data
q2 <- q2[2:191, c(1,2,4,5)]
rownames(q2) <- NULL
q2 <- rename(q2, CountryCode = X)
names(q2) <- gsub(pattern = "\\.", 
                  replacement = "", 
                  x = names(q2))
names(q2) <- tolower(names(q2))

# remove the comma in column usdollars
q2$usdollars <- gsub(pattern = ",", 
                     replacement = "", 
                     x = q2$usdollars)

# convert usdollars to numeric
q2$usdollars <- as.numeric(as.character(q2$usdollars))

# calculate the average of usdollars
mean(x = q2$usdollars, na.rm = TRUE)