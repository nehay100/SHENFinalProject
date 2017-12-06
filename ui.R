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
                          
                          leafletOutput("mymap", width="1600", height="950"), #Output of the map
                          
                          #The panel on the right side of the map
                          absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                        draggable = TRUE, top = 85, left = "auto", right = 20, bottom = "auto",
                                        width = 400, height = "auto",
                                        
                                        h2("A Cumulative Map of the Bad Drivers Data", align = "center"), #Title of side panel
                                        
                                        tags$head(includeCSS("styles/styles.css")), #CSS for opacity of the side panel
                                        
                                        selectInput("states", "Percentage of drivers involved in a car crash who were:", 
                                                    choices = c("Speeding",
                                                                "Not distracted",
                                                                "Alcohol impaired",
                                                                "Not involved in any previous accidents"), #Selection of options
                                                    selected = "Speeding"),
                                        
                                        p("For drivers involved in a car crash who were speeding, the percentages throughout the country have been
                                          consistent. The majority of the states are in the 30th percentile, which is fairly low. The state with the
                                          highest percentile is Hawaii being 54 percent, and the state with the lowest percentile is Nebraska being
                                          13 percent."),
                                        p("For drivers who were not distracted, the percentages were on the higher end of the spectrum. This could be 
                                          interpreted as a good thing because those who were involved were fully conscious during the time of the accident. 
                                          The states under this category are mostly in the 90th percentile. The state with the highest percentile is 
                                          District of Columbia, being 100 percent. The state with the lowest percentile is Mississippi with 10 percent."),
                                        p("For the drivers who were alcohol impaired, the percentages were about the same as those who were speeding.
                                          The state with the highest percentile is Montana with 44 percent. The state with the lowest percentile is
                                          Utah with 16 percent."),
                                        p("For the drivers who had not previously been involved involved in previous collisions, the percentages are
                                          about the same as the percentages for those who were not distracted. The state with the highest percentile is
                                          District of Columbia and Mississippi with 100 percent. The state with the lowest percentile is Kentucky with
                                          76 percent.")
                                        )), #Analysis paragraphs
                          
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
