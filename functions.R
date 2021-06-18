removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)

removeBlankLines <- function(x) grepl("^$", x)