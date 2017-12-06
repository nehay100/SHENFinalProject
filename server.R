# Master File
library(dplyr)
library(ggplot2)
library(shiny)
library(leaflet)
library(mapview)
library(rsconnect)
library(geojsonio)
library(htmltools)
library(reshape2)

source("code.R")
source("EmanHardcode.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # Home Tab
  
  # Map Tab
     output$mymap <- renderLeaflet({
    
    #You input a state and you get the percentage as an output for speeding, not distracted, alcohol impaired, and not involved in 
    if(input$states == "Speeding") {
      states = full_data$Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding
    } else if(input$states == "Not distracted") {
      states = full_data$Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted
    } else if(input$states == "Alcohol impaired") {
      states = full_data$Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired
    } else {
      states = full_data$Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents
    }
    
    #For the display of the markers
    string1 <- paste(strong(span("State:", style = "color:#0083C4")), full_data$State) #String of the state name, "State:" is bold and colored to match the color of the marker
    string2 <- paste("The percentage is:", states, "%") #String of the percentage of the options for that specific state
    popup <- paste(sep = "<br/>", string1, string2) #Line break of both strings
    
    leaflet(state_data) %>%
      setView(-96, 37.8, 4) %>% #Lat and long coordinates for the map boundaries
      addProviderTiles("MapBox", options = providerTileOptions(
        id = "mapbox.light", #This creates an outline of every state in the United States
        accessToken = Sys.getenv('pk.eyJ1IjoiaHdhaGVlZWQiLCJhIjoiY2phc21jYnY1NHNibjJxcGxseG9vMzl4cSJ9.xTnmU0DdOSrPePsTnlRdgg'))) %>%
      addTiles() %>% #Adds the background of all continents, makes it look like an actual map rather than just the outline
      addPolygons(weight = 2, 
                  opacity = 1, 
                  color = "black", #Outline adjustments
                  dashArray = "1", 
                  fillOpacity = 0.2)  %>%
      addMarkers(data = full_data, lng = full_data$lng, lat = full_data$lat, popup=popup) %>% #The markers placed on the map
      setView(lng = -95.85, lat = 38.75, zoom = 5) #The boundary that is first displayed when opened
    
     })
  
  # Car Insurance Tab
     output$Information <- renderPlot({
       
       State_Names <- rep(c("Alabama", "California", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Kansas", "Louisiana", "Maine", "Nebraska", "Ohio",   
                            "Pennsylvania", "Tennessee", "Utah", "Vermont", "Washington"), 2)
       Car_Insurance_and_Losses <- rep(c(Specific_States_melt$variable))
       Colors <- c(rep("Car Insurance Premiums", 1), rep("Losses incurred by insurance companies for collisions per insured driver", 1))
       
       Insurance_Losses_Data <- data.frame(  # create dataframe to select variable states, and costs for ggplot 
         Variable <- factor(c(Car_Insurance_and_Losses)),
         States <- factor(c(State_Names)),
         costs <- c(Specific_States_melt$value)
       )
       data <- filter(Insurance_Losses_Data, States == input$State) # filters the specific state in the datatable 
       
       ggplot(data, aes(x = data$State, y = data$costs, fill = Colors)) +  # creates ggplot 
         geom_bar(colour = "Black", stat = "identity",
                  position=position_dodge(),
                  size=.3) +    # Thinner lines
         xlab("Name of State") + ylab("Premium and Losses costs") + # labels the x and y axis 
         ggtitle("Car Insurance Premiums vs Losses incurred by insurance companies for collisions per insured driver") +  # Set title
         theme_dark() # gives dark background 
       
     })
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
})
