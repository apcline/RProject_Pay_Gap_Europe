#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

  # Read the data and perform data cleaning
  data <- read.csv("~/Documents/TBS-M2/U3-Programming/R/RProject/pay_gap_Europe.csv")
  data.clean <- na.omit(data)

  # Server logic for the "Histogram" tab
  output$distPlot <- renderPlot({
    data.sub <- subset(data.clean, Year == input$year)
    last_20_cols <- tail(colnames(data.clean), 20)

    # Draw the histogram with the specified number of bins
    plot(data.sub[, input$factors], pch = 3, main = 'Impact on gender paygap', ylab = input$factors)
  })

  # Server logic for the "Bar Chart" tab
  output$barChart <- renderPlot({
    data.sub <- subset(data.clean, Year == input$year)
    barplot(data.sub[, input$factors], main = 'Bar Chart of Pay Gap', xlab = 'Categories', ylab = 'Pay Gap')
  })

})
