message("-")
message("--- b) 10 longest words and sentences in each chapter ---")

# see 'functions.R' for 'performSimpleClean' source code
ch1df <- performSimpleClean(gatsby[[1]]$content)
ch2df <- performSimpleClean(gatsby[[2]]$content)
ch3df <- performSimpleClean(gatsby[[3]]$content)

# this will produce the longest words (by line?), but not necessarily the longest in the passage (??)
longestWordTest <- sapply(strsplit(ch1df$V1, " "), function(x) x[which.max(nchar(x))])