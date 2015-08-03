library(shiny)
library(markdown)

shinyUI(navbarPage("Coursera Data Science Capstone Project",
                   
                   tabPanel("Text Predictor",
                            sidebarLayout(
                              sidebarPanel(
                                textInput('Text', label = h3("Enter your text here:"), value = )
                              ),
                              
                              mainPanel(
                                h3('Tokenized and "cleaned" text:'), textOutput('InputText'),
                                h3('Number of words:'), textOutput('NumWords'),
                                h3('Predicted next word:'), textOutput('NextWord')
                              )
                            )),
                   
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("README.md")
                            ))
))

        