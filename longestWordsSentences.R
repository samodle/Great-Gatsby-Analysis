message("-")
message("--- b) 10 longest words and sentences in each chapter ---")

ch1 <- gatsby[[1]]$content
ch2 <- gatsby[[2]]$content
ch3 <- gatsby[[3]]$content

rowInc <- 1
dropRows <- c()

for(i in ch1){
  if(identical("", i)){
    dropRows = c(dropRows, rowInc)
  }
  
  rowInc <- rowInc + 1
}

# remove all the blank rows
ch1df <- data.frame(ch1)
ch1df <- ch1df[-c(dropRows), ]
rm(dropRows)
rm(i)
rm(rowInc)
rm(ch1)

# remove unnecessary characters
ch1df <- lapply(ch1df, gsub, pattern="--", replacement=" ")
if(!is.null(ncol(ch1df))){
  if(ncol(ch1df) > 5){
    ch1df <- t(ch1df)
  } 
}


# this will produce the longest words (by line?), but not necessarily the longest in the passage (??)
longestWordTest <- sapply(strsplit(ch1df$value, " "), function(x) x[which.max(nchar(x))])