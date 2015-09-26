rankhospital <- function(state, outcome, num = "best") {
  
  #read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # sets R warnings off for NA data (alternative to suppress warnings in practice assignment 3)
  options(warn=-1)

  #validations
  #State must be in data set, else return "invalid state"
  if(!(state %in% data$State)) { 
    stop("invalid state")
  }
  
  #since state data is valid, subset the data here, so it passes a smaller set to my help function
  data<-subset(data,data$State==state) 
  
  # check that outcome is valid and do appropriate calculations
  # found outcome numbers using provided informational PDF
  
  if(outcome == "heart attack") {
    if(num=="best") {
      findBest(11, data)  
    }
    else if(num =="worst"){
      findWorst(11,data)
    }
    else {
      findRank(11,data,num)
    }
    
  }
  else if (outcome == "heart failure") {
    if(num=="best") {
      findBest(17, data)  
    }
    else if(num =="worst"){
      findWorst(17,data)
    }
    else {
      findRank(17,data,num)
    }
  }
  else if(outcome == "pneumonia") {
    if(num=="best") {
      findBest(23, data)  
    }
    else if(num =="worst"){
      findWorst(23,data)
    }
    else {
      findRank(23,data,num)
    }
  }
  else {
    stop("invalid outcome")
  }  
   
  
}

## HELPER FUNCTIONS

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


# helper function that finds the worst hospital for the given outcome number
findWorst <- function(outcomeNumber, data) {
  #as data was read in as character, convert outcome column to numeric
  data[, outcomeNumber] <- as.numeric(data[, outcomeNumber])
  
  #data to just interested columns, hospital.name and outcome number
  data<-data[,c(2,outcomeNumber)]
  
  #order the data ascending by outcomenumber, then by hospital name to break the ties
  orderdata <- data[order(decreasing = TRUE,data[,2],data[,1]),]
  
  #filter out only complete cases 
  # q: before filtering out complete cases, should we subset the data
  # ie. should a hospital to included in data set for heart attack if they didn't have pneumonia cases?
  orderdata <- orderdata[complete.cases(orderdata),] 
  return(orderdata[1,"Hospital.Name"]) # return best hospital name
}

# helper function that finds the best hospital for the given outcome number
findRank <- function(outcomeNumber, data, rank) {
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
  
  #if no hospital exists for rank, then return NA
  if (rank>nrow(orderdata)){
    return("NA")
  }
    return(orderdata[rank,"Hospital.Name"]) # return best hospital name
}