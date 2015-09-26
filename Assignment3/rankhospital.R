rankhospital <- function(state, outcome, num = "best") {
  
    
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
  
  ## subset data by the considered state
  statedata <- data [grep(state,data$State),]
  
  ## reduce statedata to just interested columns, hospital.name and outcome number
  statedata<-statedata[,c(2,col)]
  
  ## order data
  orderdata <- statedata[order(statedata[,2],statedata[,1],na.last = NA),]
  
  # based on best, worst, or rank append the data for the state to the output vector
  hospital <- if(num == "best") {
    orderdata[1, 1]
  } else if(num == "worst") {
    orderdata[nrow(orderdata), 1]
  } else{
    orderdata[num, 1]
  }
  
  return(as.character(hospital))
  
}
