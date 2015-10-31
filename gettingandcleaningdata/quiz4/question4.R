# Question 4
# download file from server
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", 
              destfile = "q4.csv", 
              method = "curl")

# load two csv file
q4_1 <- q2
q4_2 <- read.csv("q4.csv", header = TRUE)

# reshape the data
names(q4_2) <- tolower(gsub(pattern = "\\.", 
                            replacement = "", 
                            x = names(q4_2)))

# merge the data
q4_merge <- join(x = q4_1, y = q4_2)

# count the fiscal year end in June
sum(grepl(pattern = "^[Ff]iscal(.*)[Yy]ear(.*)[Ee]nd(.)*[Jj]une", 
          x = q4_merge$specialnotes) == TRUE)