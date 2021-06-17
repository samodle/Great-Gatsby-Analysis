message("-")
message("--- Intro To Text Analysis Functions ---")



message("-")
message("extract text from corpus:")
btext <- gatsby[[1]]
# print(btext[1])


message("-")
message("Document Term Matrix:")
gatsbyDTM <- DocumentTermMatrix(gatsby)
inspect(gatsbyDTM)
message("-")
str(gatsbyDTM)


message("-")
message("Term Document Matrix:")
gatsbyTDM <- TermDocumentMatrix(gatsby)
inspect(gatsbyTDM)
message("-")
str(gatsbyTDM)


message("-")
message("Make It A Data Frame:")

gatsbydf <-data.frame(btext[1])
print(head(gatsbydf[1]))

message("-")
message("Clean The Corpus:")
gatsbycl <- tm::tm_map(gatsby, content_transformer(removeNumPunct))
str(gatsbycl)
message("-")
inspect(gatsbycl)


message("-")
message("Make It Lower Case:")
gatsbyLow <- tm::tm_map(gatsbycl, tm::content_transformer(tolower))
str(gatsbyLow)
message("-")
inspect(gatsbyLow)

message("-")
message("Compute The New Document Term Matrix:")
gatsbyDTM <- DocumentTermMatrix(gatsbyLow)
inspect(gatsbyDTM)
message("-")
str(gatsbyDTM)

message("-")
message("Removing Stop Words:")
myStopwords <- c(tm::stopwords("english"))
gatsbyStop <- tm::tm_map(gatsbyLow, tm::removeWords, myStopwords)
# tm::inspect(gatsbyStop[[1]])

message("-")
message("Compute The New Term Document Matrix:")
gatsbyStopTDM <- DocumentTermMatrix(gatsbyStop)
inspect(gatsbyStopTDM)
str(gatsbyStopTDM)

message("-")
message("Frequent Terms:")
freqTerms <- tm::findFreqTerms(gatsbyStopTDM, lowfreq = 5)
print(nchar(freqTerms[3]))
print(freqTerms[3])
print(freqTerms)
message("-")
gatsbytf <- tm::termFreq(gatsbyStop[[1]])
print(gatsbytf)

message("-")
message("Draw A Dendrogram:")
gatsbydf <- as.data.frame(gatsbyStopTDM[[1]])
gatsbyDist <- dist(gatsbydf)
gatsbyDG <- hclust(gatsbyDist, method="ward.D2")
print(str(gatsbyDG))
plot(gatsbyDG)

message("-")
message(":")

#rm(btext)
#rm(gatsbyDTM)