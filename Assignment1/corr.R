corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  #create list of files
  files_list <- list.files(directory,full.names=TRUE)
  
  #get index of files showing number of complete cases (use complete.R)
  index_nobs <- complete(directory)
  
  #get subset of index_nobs where nobs> threshold
  ss_index_nobs<-subset(index_nobs,nobs>threshold)
  
  #get loop length from nrows of ss_index_nobs
  loop_length<-nrow(ss_index_nobs)
  
  # --- Assert create an empty numeric vector
  corrsNum <- numeric(0)
  
  #loop through files and load in dat using rbind
  if (loop_length==0){
    corrsNum<=numeric(0)
  } else{
  
  for(i in 1:loop_length){
    dat <- read.csv(files_list[ss_index_nobs[i,1]])
    corrsNum <- c(corrsNum, cor(dat$sulfate, dat$nitrate, use = "pairwise.complete.obs"))
  }
  }
  
  
  return(corrsNum)
  
}