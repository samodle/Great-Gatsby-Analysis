message("-")
message("--- b) 10 longest words and sentences in each chapter ---")

ch1 <- gatsby[[1]]$content
ch2 <- gatsby[2]$content
ch3 <- gatsby[3]

for(i in ch1){
if(!identical("", i)){
    print(i)
 }
}

# this will produce the longest words (by line?), but not necessarily the longest in the passage (??)
longestWordTest <- sapply(strsplit(ch1, " "), function(x) x[which.max(nchar(x))])