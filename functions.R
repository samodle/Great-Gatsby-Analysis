removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)

removeBlankLines <- function(x) grepl("^$", x)

getNLongestWords <- function(n, inputText){
  a <- strsplit(inputText, " ")
  b <- vector()
  for(i in a){
    b <- c(b, i)
  }
  
  # this will produce the longest words (by line?), but not necessarily the longest in the passage (??)
  # longestWords <- sapply(strsplit(ch1df$V1, " "), function(x) x[which.max(nchar(x))])
  
  lCorpus <- tm::Corpus(VectorSource(b))
  z <- tm::tm_map(lCorpus, tm::content_transformer(removeNumPunct))
  z <- z$content[order(nchar(z$content), z$content)]
  tenLongest <- tail(z, n)
  return(rev(tenLongest))
}

getNLongestSentences <- function(n, inputText){
  
  #the text uses Mr. so this needs to be accounted for
  chstring <- paste(inputText, collapse = " ")
  
  chstring <- gsub("Mr.", "Mr", chstring)
  
  longestSentences <- unlist(strsplit(chstring, "(?<=[[:punct:]])\\s(?=[A-Z])", perl=T))
  
  print(longestSentences)
  
  tenLongest <- tail(longestSentences, n)
  return(rev(tenLongest))
}


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