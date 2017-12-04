# Master File
library(dplyr)
library(ggplot2)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # Home Tab
  
  # Map Tab
  
  # Car Insurance Tab
  
  # Comparision Tab
      dataPlot <- read.csv(file = 'data/bad-drivers.csv', stringsAsFactors = FALSE)
      
      # Change column names of data frame
      colnames(dataPlot) <- c("State", "Number.Collisions", "Collisions.Speeding", "Collisions.Alcohol", "Collisions.Not.Distracted", "Collisions.No.Previous", "Car.Insurance", "Losses.By.Insurance")
      
      # Compute US average of fatal collisions per billion miles
      usMeanDataFrame <- summarize(dataPlot, mean = mean(Number.Collisions))
      usMean <- usMeanDataFrame[1,1]
      
      output$higherAverage <- renderPlot({
        # filter out data frame for states higher than US mean
        higherStates <- filter(dataPlot, Number.Collisions > usMean)
        
        # draw the histogram with the specified number of bins
        ggplot(higherStates) + geom_point(aes_string(x = "State", y = input$higherY, color = input$higherColorType)) + ggtitle("Analysis of States Data Higher than US Mean") + theme(axis.text.x=element_text(angle=90,hjust=1))
      })
      
      output$lowerAverage <- renderPlot({
        # filter out data frame for states lower than US mean
        lowerStates <- filter(dataPlot, Number.Collisions < usMean)
        
        # draw the histogram with the specified number of bins
        ggplot(lowerStates) + geom_point(aes_string(x = "State", y = input$lowerY, color = input$lowerColorType)) + ggtitle("Analysis of States Data Lower than US Mean") + theme(axis.text.x=element_text(angle=90,hjust=1))
      })
  # Alcohol Comparision Tab
      
})
