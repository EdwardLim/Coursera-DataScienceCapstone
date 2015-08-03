library(tm)
library(stringr)
library(stylo)

## Load the data
bigrams <- readRDS('./data/bigrams.rds')
trigrams <- readRDS('./data/trigrams.rds')
quadgrams <- readRDS('./data/quadgrams.rds')

cleanText <- function(text){
  
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  
  # Convert the input text string into a vector of words
  cleanText <- txt.to.words.ext(cleanText, 
                                language="English.all", 
                                preserve.case = TRUE)
  
  return(cleanText)
}


nextWordPrediction <- function(wordCount, text){
  
  ## If number of words is equal or more than 3, then just take the last 3 words.
  if (wordCount >= 3) {
    text <- text[(wordCount-2):wordCount]
    
    # Predict using quadgrams
    wordPrediction <- as.character(quadgrams[quadgrams$unigram==text[1] & 
                                               quadgrams$bigram==text[2] & 
                                               quadgrams$trigram==text[3],]
                                   [1,]$quadgram)
  }

    # Predict using trigrams
  else if (wordCount == 2) {
    wordPrediction <- as.character(trigrams[trigrams$unigram==text[1] & 
                                              trigrams$bigram==text[2],]
                                   [1,]$trigram)
  }
  
  # Predict using bigrams
  else {
    wordPrediction <- as.character(bigrams[bigrams$unigram==text[1],]
                                   [1,]$bigram)
  }
  
  print(wordPrediction)
  
}