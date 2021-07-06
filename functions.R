removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)

removeBlankLines <- function(x) grepl("^$", x)

performSimpleClean <- function(x){
  rowInc <- 1
  dropRows <- c()
  
  for(i in x){
    if(identical("", i)){
      dropRows = c(dropRows, rowInc)
    }
    
    rowInc <- rowInc + 1
  }
  
  # remove all the blank rows
  chxdf <- data.frame(x)
  chxdf <- chxdf[-c(dropRows), ]
  rm(dropRows)
  rm(i)
  rm(rowInc)
  rm(x)
  
  # remove unnecessary characters
  chxdf <- as.data.frame(lapply(chxdf, gsub, pattern="--", replacement=" "))
  if(!is.null(ncol(chxdf))){
    if(ncol(chxdf) > 5){
      chxdf <- t(chxdf)
      # message("transpose!")
    } 
  }
  
  chxdf <- as.data.frame(chxdf)
  rownames(chxdf) <- NULL # reset the row names
  
  # remove unnecessary characters
  chxdf <- as.data.frame(lapply(chxdf, gsub, pattern="\"", replacement=" "))
  if(!is.null(ncol(chxdf))){
    if(ncol(chxdf) > 5){
      chxdf <- t(chxdf)
      # message("transpose!")
    } 
  }
  
  chxdf <- as.data.frame(chxdf)
  rownames(chxdf) <- NULL # reset the row names
  
  return(chxdf)
}