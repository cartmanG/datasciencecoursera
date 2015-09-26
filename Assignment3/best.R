best <- function(state, outcome) {
  # state argument indicates the two letter state abbreviation you would like to gather data for
  # outcome argument indicates either heart attack, heart failure, or pneumonia 
  # function returns the hospital name with the best (lowest) 30-day mortality rate 
  # for the specified outcome in the given state
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  options(warn=-1) # sets R warnings off for NA data
  
  # make sure state entered is valid
  if(!(state %in% data$State)) { 
    stop("invalid state")
  }
  
  #since state data is valid, subset the data here, so it passes a smaller set to my help function
  data<-subset(data,data$State==state) 
  
  
  # check that outcome is valid and do appropriate calculations
  # found outcome numbers using provided informational PDF
  if(outcome == "heart attack") {
    findBest(11, data)
  }
  else if (outcome == "heart failure") {
    findBest(17, data)
  }
  else if(outcome == "pneumonia") {
    findBest(23, data)
  }
  else {
    stop("invalid outcome")
  }  
  
}

# helper function that finds the best hospital for the given outcome number
findBest <- function(outcomeNumber, data) {
  #as data was read in as character, convert outcome column to numeric
  data[, outcomeNumber] <- as.numeric(data[, outcomeNumber])
  
  #data to just interested columns, hospital.name and outcome number
  data<-data[,c(2,outcomeNumber)]
  
  #order the data ascending by outcomenumber, then by hospital name to break the ties
  orderdata <- data[order(data[,2],data[,1]),]
  
  #filter out only complete cases 
  # q: before filtering out complete cases, should we subset the data
  # ie. should a hospital to included in data set for heart attack if they didn't have pneumonia cases?
  orderdata <- orderdata[complete.cases(orderdata),] 
  return(orderdata[1,"Hospital.Name"]) # return best hospital name
}