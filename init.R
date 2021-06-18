rm(list = ls()) # clear everything to start

## First specify the packages of interest
packages = c("tm", "wordcloud", "quanteda", "syuzhet", "stringi")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)  

gatsby <- VCorpus(DirSource(".",pattern=".txt", ignore.case=TRUE, mode="text"))

rm(package.check)
rm(packages)