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
                 tabPanel("Home",
                          titlePanel("Driving Statistics in the United States"),
                          
                          helpText("By Neha Yadav, Huda Waheed, Selene Wartell, and Emmanuel Robi"), 
                          helpText("Display's:"), 
                          helpText("- a comparison between car insurance premium and losses incurred by insurance companies based by state"),              
                          helpText("- cumulative percentage of people who were involved in collisions who were speeding, alcohol impaired, not distracted, for each state"), 
                          helpText("- a comparison about states lower and higher than the United States Average"), 
                          helpText("The data was collected by Mona Chalabi and was published on the website called FiveThirtyEight"),
                          helpText("You can find the link", a("HERE!", href = "https://fivethirtyeight.com/features/which-state-has-the-worst-drivers/"))
                  ),
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
