# Master File
library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Show a plot of the generated distribution
    mainPanel(
      navbarPage("INFO 201 Final Project",
                 #tags$style(type = 'text/css', '.navbar {
                           #font-family: Arial;
                           # font-size: 20px;}'),    
                 tabPanel("Home"),
                 tabPanel("Map",
                          
                          leafletOutput("mymap", width="1600", height="800"), #Output of the map
                          
                          #The panel on the right side of the map
                          absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                        draggable = TRUE, top = 85, left = "auto", right = 20, bottom = "auto",
                                        width = 400, height = "auto",
                                        
                                        h2("A Cumulative Map of the Bad Drivers Data", align = "center"), #Title of side panel
                                        
                                        tags$head(includeCSS("styles.css")), #CSS for opacity of the side panel
                                        
                                        selectInput("states", "Percentage of drivers involved in a car crash who were:", 
                                                    choices = c("Speeding",
                                                                "Not distracted",
                                                                "Alcohol impaired",
                                                                "Not involved in any previous accidents"), #Selection of options
                                                    selected = "Speeding"),
                                        
                                        p("Insert analysis paragraph here"))), #Analysis paragraph
                          
                tabPanel("Car Insurance", 
                          # Selects State, Car Insurance Premiums, and Losses incurred by insurance companies for collisions per insured driver ($) from the CSV
                          
                          # Pages Title
                          titlePanel("Car Insurance Premium and Losses"),
                          sidebarLayout(sidebarPanel(selectInput(inputId = "State", label = "States:", choices = c("Alabama", "California", "Delaware", "Florida","Georgia", "Hawaii", "Idaho",
                                             "Utah", "Vermont", "Washington"),
                                                                 selected = "Washington")
                          ),
                          # Displays the plot
                          mainPanel(plotOutput("Information")
                          )
                          )),
                 tabPanel("Comparision", 
                          # Application title
                          titlePanel("Comparision of Data with US Average"),
                          
                          # Sidebar with a slider input for number of bins 
                          sidebarLayout(
                            sidebarPanel(
                              # Graphs for states larger than US State average
                              # user inserts which variable represents x axis
                              radioButtons("higherY", "Choose what variable is on Y axis for Higher States Data: ",
                                           choices = list("Speeding" = 'Collisions.Speeding', "Alcohol" = 'Collisions.Alcohol', "Not Distracted" = 'Collisions.Not.Distracted'),
                                           selected = 'Collisions.Speeding'),
                              
                              # user inserts which variable will be represented by color
                              radioButtons("higherColorType", "Choose which variable to display by color for Higher States Data: ",
                                           choices = list("Car Insurance" = 'Car.Insurance', "Losses on Insurance Companies" = 'Losses.By.Insurance'),
                                           selected = 'Car.Insurance'),
                              
                              # Graphs for states lower than US State average
                              # user inserts which variable represents x axis
                              radioButtons("lowerY", "Choose what variable is on Y axis for Lower States Data: ",
                                           choices = list("Speeding" = 'Collisions.Speeding', "Alcohol" = 'Collisions.Alcohol', "Not Distracted" = 'Collisions.Not.Distracted'),
                                           selected = 'Collisions.Speeding'),
                              
                              # user inserts which variable will be represented by color
                              radioButtons("lowerColorType", "Choose which variable to display by color for Lower States Data: ",
                                           choices = list("Car Insurance" = 'Car.Insurance', "Losses on Insurance Companies" = 'Losses.By.Insurance'),
                                           selected = 'Car.Insurance')
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                              plotOutput("higherAverage"),
                              plotOutput("lowerAverage")
                            )
                          )),
                 tabPanel("Alcohol Comparision")
      )
    )
  )
)
