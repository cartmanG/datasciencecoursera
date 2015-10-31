# Question 5
# launch given code
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

# create a data fram from amzn
amzn_data <- data.frame(amzn)

# count the values collected in 2012
sum(format(as.Date(x = rownames(amzn_data), format = "%Y-%m-%d"), "%Y") == 2012)

# count the values collected in Mondays 2012
sum(format(as.Date(x = rownames(amzn_data), format = "%Y-%m-%d"), "%Y%a") == "2012Mon")