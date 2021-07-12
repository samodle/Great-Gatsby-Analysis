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
  longString <- paste(inputText, collapse = " ")
  
  longString <- gsub("Mr.", "Mr", longString)
  longString <- gsub('\\(', "", longString)
  longString <- gsub('\\)', "", longString)
  longString <- gsub("  ", " ", longString)
  longString <- gsub("  ", " ", longString)
  
  # longestSentences <- unlist(strsplit(longString, "(?<=[[:punct:]])\\s(?=[A-Z])", perl=T))
  longestSentences <- unlist(strsplit(longString, "(?<=\\.|\\?|\\!)\\s(?=[A-Z])", perl=T))
  
  # print(longestSentences)
  
  z <- longestSentences[order(nchar(longestSentences), longestSentences)]
  tenLongest <- tail(z, 10)

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

getNounsVerbsLongerThanFive <- function(x){
  s <- as.String(xr)
  ## Need sentence and word token annotations.
  sent_token_annotator <- openNLP::Maxent_Sent_Token_Annotator()
  word_token_annotator <- openNLP::Maxent_Word_Token_Annotator()
  a2 <- NLP::annotate(s, list(sent_token_annotator, word_token_annotator))
  
  pos_tag_annotator <- Maxent_POS_Tag_Annotator()
  a3 <- NLP::annotate(s, pos_tag_annotator, a2)
  
  
  ## Determine the distribution of POS tags for word tokens.
  a3w <- subset(a3, type == "word")
  tags <- sapply(a3w$features, `[[`, "POS")
  allWords <- s[a3w]
  
  # message("Tags: ")
  # print(tags)
  # print(table(tags))
  ## Extract token/POS pairs (all of them): easy.
  # message("-")
  tagPairs <- sprintf("%s/%s", s[a3w], tags)
  targetPairs <- c()
  
  inc <- 1
  for(i in tagPairs){
    if(nchar(allWords[inc]) >= 5){
      if(substr(tags[inc],1,1) == 'N' || substr(tags[inc],1,1) == 'V'){
        targetPairs <- c(targetPairs, tagPairs[inc])
      }
    }
    inc <- inc + 1
  }
  
  return(targetPairs)
}