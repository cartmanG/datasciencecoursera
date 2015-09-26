rankall <- function(outcome, num="best") {
  
  #read in data file
  data<-read.csv("outcome-of-care-measures.csv")
  
  # sets R warnings off for NA data (alternative to suppress warnings in practice assignment 3)
  options(warn=-1)
  
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
  
  #get levels of states from data
  states <- levels(data[,7])
  
  #generate tablee
  output <- vector()
  
  #loop through states vector and get hospital name
  for (i in 1:length(states)) {
    
    ## subset data by the considered state
    statedata <- data [grep(states[i],data$State),]
    
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
    
    output <- append(output, c(as.character(hospital), states[i]))
    
  }
  
  ## Just because it's simpler to generate a matrix rather than a data frame, I generate it first and convert it
  ## to data frame immediatly after. 
  output <- as.data.frame(matrix(output,length(states),2, byrow = TRUE))
  ## Name of the columns will be "cities", "areakm2" and "populationk". Name of the rows are the countries.
  colnames(output) <- c("hospital","state")
  rownames(output) <- states
  return(output)
    
    
}

