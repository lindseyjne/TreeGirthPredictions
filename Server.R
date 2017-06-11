#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/

library(shiny)

shinyServer(function(input, output){
  model1 <- lm(Girth ~ Volume, data = trees)

  model1pred <- reactive({
    volumeInput <- input$sliderVolume
    predict(model1, newdata = data.frame(Volume = volumeInput))
  })
  
  output$plot1 <- renderPlot({
    volumeInput <- input$sliderVolume
    
    plot(trees$Volume, trees$Girth, xlab = "Volume", ylab = "Girth")
    if(input$showModel1){
      abline(model1, col = "hot pink", lwd = 2)
    }
    
    
    legend(0.05, 8000, "Model Prediction", col = "hot pink", pch = 16, bty = "n", cex = 1.5)
           points(volumeInput, model1pred(), col = "green", pch = 16, cex = 1.5)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
})
