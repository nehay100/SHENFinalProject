# Master File
library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Show a plot of the generated distribution
    mainPanel(
      navbarPage("INFO 201 Final Project",
                 #tags$head(
                   #tags$style(HTML("
                                   #.modal{
                                   #width: 100%; 
                                   #left: 5%; 
                                   #margin-left:auto;
                                   #margin-right:auto; 
                                   #height: auto;
                                   #}"))),    
                 tabPanel("Home"),
                 tabPanel("Map",
                          leafletOutput("mymap", width="1600", height="800"), #Output of the map
                          
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
                          p("Each graph has a different legend and so we will explore all the graphs and their various trends. One
                            note is when I mention lower and higher states graph, I mean the graphs representing the states higher
                            than the US average and lower than US average."),
                          p("For collisions from speeding and the car insurance legend, both the lower and higher states graphs
                            showed data that was all over the place and very varied. Also the when looking at the color of the 
                            points for the higher states graph, car insurance premiums were on the low end scale for most accidencts and 
                            the higher insurance premiums were the outliers. For the lower states graph, the car insurance 
                            premiums were mixed with higher and lower level premiums."),
                          p("For collisions involving alcohol and the car insurance legend, the higher states data is again varied
                            with outliers. For the lower states the data is shows a trend of higher percentages throughout the US
                            between 25 to 40%. For both graphs the car insurance premiums are lower for most collisions."),
                          p("For collisions involving drivers being not distracted with the car insurance legend, both higher 
                            and lower states show a higher percentage of collisions throughout the US. Also most of those collisions
                            have lower car insurance premiums."),
                          p("Now we are going to analyze the graphs with the loss of insurance companies with the y axises: speed
                            , alcohol, and non-distraction. For speeding, the data for both higher and lower states is varied and 
                            the losses by car insurance companies is varied."),
                          p("For the alcohol, for higher states the data demonstrates a lower trend between 0 and 35% with outliers.
                            The losses by insurance companies is again varied. For lower states, demonstrates a higher trend of 
                            percentage between 25 and 40%. The losses by insurance companies tends to be lower for most collisions"),
                          p("For collisions involving drivers being not distracted, both higher 
                            and lower states show a higher percentage of collisions throughout the US. Also most of those collisions
                            have lower losses by car insurance premiums."),
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
                          ))
                 
      )
    )
  )
)
