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


message("-")
message("--- Use openNLP to mark the parts of speech for the 10 longest sentences found in part b for nouns and verbs having a length of 5 or greater ---")
# useful resource: https://dpdearing.com/posts/2011/12/opennlp-part-of-speech-pos-tags-penn-english-treebank/
message("Chapter 1:")
for(i in ch1TenLongestSentences){
  print(i)
  z <- getNounsVerbsLongerThanFive(i)
  print(z)
  message("-")
}
message("Chapter 2:")
for(i in ch2TenLongestSentences){
  print(i)
  print(getNounsVerbsLongerThanFive(i))
  message("-")
}
message("Chapter 3:")
for(i in ch3TenLongestSentences){
  print(i)
  print(getNounsVerbsLongerThanFive(i))
  message("-")
}
