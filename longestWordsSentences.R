message("-")
message("--- b) 10 longest words and sentences in each chapter ---")

# see 'functions.R' for 'performSimpleClean' source code
ch1df <- performSimpleClean(gatsby[[1]]$content)
ch2df <- performSimpleClean(gatsby[[2]]$content)
ch3df <- performSimpleClean(gatsby[[3]]$content)

ch1TenLongest <- getNLongestWords(10, ch1df$V1)
ch2TenLongest <- getNLongestWords(10, ch2df$V1)
ch3TenLongest <- getNLongestWords(10, ch3df$V1)

message("Chapter 1:")
print(rev(ch1TenLongest))

message("Chapter 2:")
print(rev(ch2TenLongest))

message("Chapter 3:")
print(rev(ch3TenLongest))