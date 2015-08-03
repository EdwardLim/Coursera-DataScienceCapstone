library(shiny)

source("./word_predictor.R")

shinyServer(function(input, output) {
  
  nextWord <- reactive({
    inputText <- cleanInput(input$Text)
    numWords <- length(inputText)
    
    # Attach tokenized and "cleaned" text as well as number of words
    # to the respective elements in Shiny UI.
    output$InputText <- renderPrint(inputText)  # Show as a vector of words with ""
    output$NumWords <- renderText(numWords)
    
    # Predict the next word using the function in word_predictor.R
    nextWord <- nextWordPrediction(numWords, inputText)
    })
  
  # Attach the predicted word to the NextWord element in Shiny UI.
  output$NextWord <- renderText(nextWord())

})