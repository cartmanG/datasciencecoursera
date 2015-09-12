complete <- function(directory, id = 1:332) {
  #find the number of complete cases for selected case files
  
  #create list of files
  files_list <- list.files(directory,full.names=TRUE)
  
  #create a subset list of files that matches id parameter
  files_list_ss<-files_list[id]
  
  #get loop length of files_list_ss
  loop_length<-length(files_list_ss)
  
  #initiate data frame for binding and storing final values
  dat <- data.frame() 
  
  #loop through files and load in dat using rbind
  for(i in 1:loop_length){
    
    file_data<-read.csv(files_list_ss[i])
    nobs <- sum(complete.cases(file_data))
    dat <- rbind(dat, c(id[i],nobs))
  }
  
  #set column names
  colnames(dat)<-c("id","nobs")
  
  #dislay value of dat
  print(dat)
  
}