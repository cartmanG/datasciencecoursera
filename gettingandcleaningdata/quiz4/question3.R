# Question 3
# change the column name to match the question
q2 <- rename(q2, countryNames = economy)

# find countries whose name begins with "United"
grep(pattern = "^United", x = q2$countryNames)

# count the countries whose name begins with "United
sum(grepl(pattern = "^United", 
          x = q2$countryNames) == TRUE)