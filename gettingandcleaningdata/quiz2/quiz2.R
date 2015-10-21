Quiz 2

Question 1
> library(httr)
> oauth_endpoints("github")
> myapp ", secret = "")
> github_token  req  stop_for_status(req)
> content(req)
> BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))


Question 2
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
> download.file(fileUrl, destfile="./pid.csv")
> library(sqldf)
> acs <- read.csv("./pid.csv", header=T, sep=",")
> sqldf("select pwgtp1 from acs where AGEP < 50")

Question 3
> sqldf("select distinct AGEP from acs")

Question 4
> hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
> con <- url(hurl)
> htmlCode <- readLines(con)
> close(con)
> sapply(htmlCode[c(10, 20, 30, 100)], nchar)
<meta name="Distribution" content="Global" /> 
45 
<script type="text/javascript"> 
31 
})(); 
7 
\t\t\t\t<ul class="sidemenu"> 
25 

Question 5
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
> download.file(fileUrl, destfile="./wksst8110.for")
> data <- read.csv("./wksst8110.for", header = TRUE)
> file_name <- "./wksst8110.for"
> df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
> sum(df[, 4])
> [1] 32426.7
