best <- function(state, outcome) {
  # state argument indicates the two letter state abbreviation you would like to gather data for
  # outcome argument indicates either heart attack, heart failure, or pneumonia 
  # function returns the hospital name with the best (lowest) 30-day mortality rate 
  # for the specified outcome in the given state
  
  #read in data file
  data<-read.csv("outcome-of-care-measures.csv")
  
  # sets R warnings off for NA data (alternative to suppress warnings in practice assignment 3)
  options(warn=-1)
  
  # make sure state entered is valid
  if(!(state %in% data$State)) { 
    stop("invalid state")
  }
  
  #validate outcome
  if (!((outcome == "heart attack") | (outcome == "heart failure")
        | (outcome == "pneumonia"))) {
    stop ("invalid outcome")
  }
  
  # determine column number based on outcome
  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  
  #convert appropraie column of data to numeric to allow sorting
  data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
  
  #convert hospital name to character
  data[, 2] <- as.character(data[, 2])
  
  ## subset data by the considered state
  statedata <- data [grep(state,data$State),]
  
  ## reduce statedata to just interested columns, hospital.name and outcome number
  statedata<-statedata[,c(2,col)]
  
  ## order data
  orderdata <- statedata[order(statedata[,2],statedata[,1],na.last = NA),]
  
  # based on best, worst, or rank append the data for the state to the output vector
  hospital <- orderdata[1, 1]
  
  return(as.character(hospital))
}
