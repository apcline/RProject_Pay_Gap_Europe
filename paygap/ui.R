#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

column_choices <- colnames(data.clean)[5:length(colnames(data.clean))]

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Gender Pay Gap"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("factors", "Select a Column:",
                  choices = column_choices,
                  selected = column_choices[1]),
      sliderInput('year', "Year:", min = min(data.clean$Year), max = max(data.clean$Year), value = 1, step = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Histogram",
                 plotOutput("distPlot")  # Display the histogram plot here
        ),
        tabPanel("Bar Chart",
                 plotOutput("barChart")
        )
      )
    )
  )
))




