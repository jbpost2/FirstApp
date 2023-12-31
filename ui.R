##Solution to first app homework  
##Justin Post
library(shiny)
library(DT)
library(caret)
data("GermanCredit")


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Summaries for German Credit Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("This data set comes from the ", a(href = "https://topepo.github.io/caret/", "caret package"),  "- originally from the UCI machine learning repository"),
            br(),
            h4("You can create a few bar plots using the radio buttons below."),
            radioButtons("plot", "Select the Plot Type", choices = list("Just Classification" = "bar", "Classification and Unemployed" = "sideUmemploy", "Classification and Foreign" = "sideForeign"), selected = "bar"),
            br(),
            h4("You can find the", strong("sample mean"), " for a few variables below:"),
        selectInput("var", label = "Variables to Summarize", 
                    choices = c("Duration", "Amount", "Age"),
                    selected = "Age"),
            numericInput("round", "Select the number of digits for rounding", value = 2, min = 0, max = 5)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("barPlot"),
            br(),
            dataTableOutput("summary")
        )
    )
))
