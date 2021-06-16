message("-")
message("--- Intro To Text Analysis Functions ---")



message("-")
message("extract text from corpus:")
btext <- gatsby[[1]]
print(substr(btext[1], 0, 500))


message("-")
message("Document Term Matrix:")
gatsbyDTM <- DocumentTermMatrix(gatsby)
inspect(gatsbyDTM)
str(gatsbyDTM)


message("-")
message("Term Document Matrix:")
gatsbyTDM <- TermDocumentMatrix(gatsby)
inspect(gatsbyTDM)
str(gatsbyTDM)


message("-")
message("Make It A Data Frame:")

gatsbydf <-data.frame(btext[1])
print(head(gatsbydf[1]))

message("-")
message("Clean The Corpus:")
gatsbycl <- tm::tm_map(gatsby, content_transformer(removeNumPunct))
str(gatsbycl)
inspect(gatsbycl)


message("-")
message("Make It Lower Case:")
gatsbyLow <- tm::tm_map(gatsbycl, tm::content_transformer(tolower))
str(gatsbyLow)
inspect(gatsbyLow)

message("-")
message("Compute The New Document Term Matrix:")
gatsbyDTM <- DocumentTermMatrix(gatsbyLow)
inspect(gatsbyDTM)
str(gatsbyDTM)

message("-")
message("Removing Stop Words:")
myStopwords <- c(tm::stopwords("english"))
gatsbyStop <- tm::tm_map(gatsbyLow, tm::removeWords, myStopwords)
tm::inspect(gatsbyStop[[1]])

message("-")
message("Compute The New Document Term Matrix (Again):")
gatsbyDTM <- DocumentTermMatrix(gatsbyStop)
inspect(gatsbyDTM)
str(gatsbyDTM)

message("-")
message(":")

message("-")
message(":")

message("-")
message(":")

#rm(btext)
#rm(gatsbyDTM)