pollutantmean <- function(directory, pollutant, id = 1:332) {
  #gets the mean of the specified pollutant for the selected files

  #create list of files
  files_list <- list.files(directory,full.names=TRUE)
  
  #initiate data frame for binding
  dat <- data.frame() 
  
  #loop through files and load in dat using rbind
  for(i in id){
      dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  #get mean of data stripping out the NAs
  mean(dat[, pollutant],na.rm = TRUE)
}