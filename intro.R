message("-")
message("--- Intro To Text Analysis Functions ---")
graphMode <- FALSE # create plots while executing?


message("-")
message("extract text from corpus:")
btext <- gatsby[[1]]
# print(btext[1])
print(btext$content[1:15])


message("-")
message("Document Term Matrix:")
gatsbyDTM <- tm::DocumentTermMatrix(gatsby)
tm::inspect(gatsbyDTM)
message("-")
str(gatsbyDTM)


message("-")
message("Term Document Matrix:")
gatsbyTDM <- tm::TermDocumentMatrix(gatsby)
tm::inspect(gatsbyTDM)
message("-")
str(gatsbyTDM)


message("-")
message("Make It A Data Frame:")

gatsbydf <-data.frame(btext[1])
print(head(gatsbydf[1]))

message("-")
message("Clean The Corpus:")
gatsbycl <- tm::tm_map(gatsby, tm::content_transformer(removeNumPunct))
#gatsbycl <- tm::tm_map(gatsbycl, content_transformer(removeBlankLines))
str(gatsbycl)
message("-")
tm::inspect(gatsbycl)


message("-")
message("Make It Lower Case:")
gatsbyLow <- tm::tm_map(gatsbycl, tm::content_transformer(tolower))
str(gatsbyLow)
message("-")
tm::inspect(gatsbyLow)

message("-")
message("Compute The New Document Term Matrix:")
gatsbyDTM <- tm::DocumentTermMatrix(gatsbyLow)
tm::inspect(gatsbyDTM)
message("-")
str(gatsbyDTM)

message("-")
message("Removing Stop Words:")
myStopwords <- c(tm::stopwords("english"))
gatsbyStop <- tm::tm_map(gatsbyLow, tm::removeWords, myStopwords)
# tm::inspect(gatsbyStop[[1]])

message("-")
message("Compute The New Term Document Matrix:")
gatsbyStopTDM <- tm::DocumentTermMatrix(gatsbyStop)
tm::inspect(gatsbyStopTDM)
str(gatsbyStopTDM)

message("-")
message("Frequent Terms:")
freqTerms <- tm::findFreqTerms(gatsbyStopTDM, lowfreq = 15)
print(nchar(freqTerms[3]))
print(freqTerms[3])
print(freqTerms)
message("-")
gatsbytf <- tm::termFreq(gatsbyStop[[1]])
print(head(gatsbytf))

if(graphMode){
  message("-")
  message("Draw A Dendrogram:")
  gatsbydf <- as.data.frame(gatsbyStopTDM[[1]])
  gatsbyDist <- dist(gatsbydf)
  gatsbyDG <- hclust(gatsbyDist, method="ward.D2")
  print(str(gatsbyDG))
  plot(gatsbyDG)
  
  message("-")
  message("Word Cloud:")
  words <- names(gatsbytf)
  wordsfreq <- gatsbytf
  pal <- brewer.pal(9, "Spectral")
  gatsbyWC <- wordcloud(words, wordsfreq, colors=pal)
}

message("-")
message("Apply Tokenization:")
gatsbyText <- gatsbycl[[1]]
print(gatsbyText$content[1:10])
message("-")
# Note that chr(0) indicates a blank line
gatsbyTokens <- quanteda::tokens(gatsbyText$content)
print(str(gatsbyTokens))

message("-")
message("Create Sparse Document Feature Matrix:")
gatsbyDFM <- quanteda::dfm(gatsbyTokens)
gatsbyDFM <- quanteda::dfm_remove(gatsbyDFM, myStopwords)
print(str(gatsbyDFM))

message("-")
message("Term Frequency of DFM:")
gatsbyDocFreq <- quanteda::docfreq(gatsbyDFM)
print(str(gatsbyDocFreq))
message("-")
print(head(gatsbyDocFreq))

message("-")
message("Assign Weights:")
gatsbyWeights <- quanteda::dfm_weight(gatsbyDFM)
print(str(gatsbyWeights))
message("-")
print(gatsbyWeights)

message("-")
message("Calculate tf-idf:")
gatsbyTFIDF <- quanteda::dfm_tfidf(gatsbyDFM, scheme_tf="count", scheme_df="inverse")
print(str(gatsbyTFIDF))

