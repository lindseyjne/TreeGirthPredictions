library(shiny)

# Define UI for application that predicts the girth of a tree
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Girth of a Tree Given the Volume"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderVolume", "What is the volume of the tree", 10, 80, value = 35),
      checkboxInput("showModel1", "Show/Hide Model", value = TRUE),
      submitButton("Submit")
    ),
  
  mainPanel(
    plotOutput("plot1"),
    h3("Predicting the girth of a tree"),
    textOutput("pred1")
  )
)
))
