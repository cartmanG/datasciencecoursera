# Question 1
# download file from server
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "q1.csv", 
              method = "curl")

# load csv file
q1 <- read.csv("q1.csv", header = TRUE)

# get names
namesq1 <- names(q1)

# apply strsplit() and check the 123th element
strsplit(namesq1, 'wgtp')[123]
