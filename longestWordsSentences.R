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


#for(i in ch1TenLongestSentences){
  message("Sentence: ")
  s <- as.String(ch1TenLongestSentences[1])
  print(s)
  
  ## Need sentence and word token annotations.
  sent_token_annotator <- openNLP::Maxent_Sent_Token_Annotator()
  word_token_annotator <- openNLP::Maxent_Word_Token_Annotator()
  a2 <- NLP::annotate(s, list(sent_token_annotator, word_token_annotator))
  
  pos_tag_annotator <- Maxent_POS_Tag_Annotator()
  #pos_tag_annotator
  a3 <- NLP::annotate(s, pos_tag_annotator, a2)
  #a3
  
  ## Variant with POS tag probabilities as (additional) features.
  head(NLP::annotate(s, Maxent_POS_Tag_Annotator(probs = TRUE), a2))
  
  ## Determine the distribution of POS tags for word tokens.
  a3w <- subset(a3, type == "word")
  tags <- sapply(a3w$features, `[[`, "POS")
  message("Tags: ")
  print(tags)
  print(table(tags))
  ## Extract token/POS pairs (all of them): easy.
  message("-")
  print(sprintf("%s/%s", s[a3w], tags))
  
  ## Extract pairs of word tokens and POS tags for second sentence:
  message("Pairs of word tokens and POS tags: ")
  a3ws2 <- annotations_in_spans(subset(a3, type == "word"),
                                subset(a3, type == "sentence")[2L])[[1L]]
  print(sprintf("%s/%s", s[a3ws2], sapply(a3ws2$features, `[[`, "POS")))
#}
