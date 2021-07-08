message("-")
message("--- b) 10 longest words and sentences in each chapter ---")

# see 'functions.R' for 'performSimpleClean' source code
ch1df <- performSimpleClean(gatsby[[1]]$content)
ch2df <- performSimpleClean(gatsby[[2]]$content)
ch3df <- performSimpleClean(gatsby[[3]]$content)

ch1TenLongestWords <- getNLongestWords(10, ch1df$V1)
ch2TenLongestWords <- getNLongestWords(10, ch2df$V1)
ch3TenLongestWords <- getNLongestWords(10, ch3df$V1)

message("Longest Words")

message("Chapter 1:")
print(ch1TenLongestWords)

message("Chapter 2:")
print(ch2TenLongestWords)

message("Chapter 3:")
print(ch3TenLongestWords)

message("Longest Sentences")

ch1TenLongestSentences <- getNLongestSentences(10, ch1df$V1)
ch2TenLongestSentences <- getNLongestSentences(10, ch2df$V1)
ch3TenLongestSentences <- getNLongestSentences(10, ch3df$V1)

message("Chapter 1:")
print(ch1TenLongestSentences)

message("Chapter 2:")
print(ch2TenLongestSentences)

message("Chapter 3:")
print(ch3TenLongestSentences)

