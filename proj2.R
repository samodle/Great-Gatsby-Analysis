rm(list = ls()) # clear everything to start

options(java.parameters = c("-XX:+UseConcMarkSweepGC", "-Xmx8192m")) # let's make it fast
library(xlsx)

source("functions.R") # load helper functions

if(!exists("gatsby")){
  source("init.R")  #install packages, load the corpus
}

scheduler = c(
  FALSE, # a & g
  TRUE, # b & d & f
  FALSE, # c
  FALSE, # e
  FALSE, # f
  FALSE  # h
)

# a) Apply functions from Intro To Text Analytics
# g) Follow the procedures in Introduction to Text Analytics re Word Cloud and Sentiment Analysis
if(scheduler[1]){
  source("intro.R")
}


# b) Prior to removing the punctuation, find the 10 longest words and 10 longest sentences in each chapter. 
# d) Use openNLP to mark the parts of speech for the 10 longest sentences found in part b for nouns and verbs having a length of 5 or greater. 
# f) Generate bigrams and trigrams for all words whose length is greater than 6 characters in the 10 longest sentences of each chapter.
if(scheduler[2]){
  source("longestWordsSentences.R")
}

# c) If the dendrogram is unreadable, remove words of length 2, 3, 4, etc. to see how the dendrogram is affected. Show the dendrogram each time.
# For the following you will need to write R functions to help you compute the results.
# Use the packages textreuse, wordnet, zipfR
if(scheduler[3]){
  source("")
}

# e) Analyze word frequency using functions from package zipfR. 
if(scheduler[4]){
  source("")
}

# h) Install the packages stringi, quanteda and select three additional methods from each – not the ones used g – apply them and show the results.
if(scheduler[5]){
  source("")
}


rm(scheduler)