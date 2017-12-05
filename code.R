bad_drivers_data <- read.csv("data/bad-drivers.csv", stringsAsFactors = FALSE)

latandlong <- read.csv("data/uscitiesv1.3.csv", stringsAsFactors = FALSE)

Alabama <- latandlong %>% filter(state_name == "Alabama", city == "Montgomery") %>% select(state_name, lat, lng)
Alaska <- latandlong %>% filter(state_name == "Alaska", city == "Juneau") %>% select(state_name, lat, lng)
Arizona <- latandlong %>% filter(state_name == "Arizona", city == "Phoenix") %>% select(state_name, lat, lng)
Arkansas <- latandlong %>% filter(state_name == "Arkansas", city == "Little Rock") %>% select(state_name, lat, lng)
California <- latandlong %>% filter(state_name == "California", city == "Sacramento") %>% select(state_name, lat, lng)
Colorado <- latandlong %>% filter(state_name == "Colorado", city == "Denver") %>% select(state_name, lat, lng)
Connecticut <- latandlong %>% filter(state_name == "Connecticut", city == "Hartford") %>% select(state_name, lat, lng)
Delaware <- latandlong %>% filter(state_name == "Delaware", city == "Dover") %>% select(state_name, lat, lng)
DC <- latandlong %>% filter(state_name == "District of Columbia", city == "Washington") %>% select(state_name, lat, lng)
Florida <- latandlong %>% filter(state_name == "Florida", city == "Tallahassee") %>% select(state_name, lat, lng)
Georgia <- latandlong %>% filter(state_name == "Georgia", city == "Atlanta") %>% select(state_name, lat, lng)
Hawaii <- latandlong %>% filter(state_name == "Hawaii", city == "Honolulu") %>% select(state_name, lat, lng)
Idaho <- latandlong %>% filter(state_name == "Idaho", city == "Boise") %>% select(state_name, lat, lng)
Illinois <- latandlong %>% filter(state_name == "Illinois", city == "Springfield") %>% select(state_name, lat, lng)
Indiana <- latandlong %>% filter(state_name == "Indiana", city == "Indianapolis") %>% select(state_name, lat, lng)
Iowa <- latandlong %>% filter(state_name == "Iowa", city == "Des Moines") %>% select(state_name, lat, lng)
Kansas <- latandlong %>% filter(state_name == "Kansas", city == "Topeka") %>% select(state_name, lat, lng)
Kentucky <- latandlong %>% filter(state_name == "Kentucky", city == "Frankfort") %>% select(state_name, lat, lng)
Louisiana <- latandlong %>% filter(state_name == "Louisiana", city == "Baton Rouge") %>% select(state_name, lat, lng)
Maine <- latandlong %>% filter(state_name == "Maine", city == "Augusta") %>% select(state_name, lat, lng)
Maryland <- latandlong %>% filter(state_name == "Maryland", city == "Annapolis") %>% select(state_name, lat, lng)
Massachusetts <- latandlong %>% filter(state_name == "Massachusetts", city == "Boston") %>% select(state_name, lat, lng)
Michigan <- latandlong %>% filter(state_name == "Michigan", city == "Lansing") %>% select(state_name, lat, lng)
Minnesota <- latandlong %>% filter(state_name == "Minnesota", city == "Saint Paul") %>% select(state_name, lat, lng)
Mississippi <- latandlong %>% filter(state_name == "Mississippi", city == "Jackson") %>% select(state_name, lat, lng)
Missouri <- latandlong %>% filter(state_name == "Missouri", city == "Jefferson City") %>% select(state_name, lat, lng)
Montana <- latandlong %>% filter(state_name == "Montana", city == "Helena") %>% select(state_name, lat, lng)
Nebraska <- latandlong %>% filter(state_name == "Nebraska", city == "Lincoln") %>% select(state_name, lat, lng)
Nevada <- latandlong %>% filter(state_name == "Nevada", city == "Carson City") %>% select(state_name, lat, lng)
NH <- latandlong %>% filter(state_name == "New Hampshire", city == "Concord") %>% select(state_name, lat, lng)
NJ <- latandlong %>% filter(state_name == "New Jersey", city == "Trenton") %>% select(state_name, lat, lng)
NM <- latandlong %>% filter(state_name == "New Mexico", city == "Santa Fe") %>% select(state_name, lat, lng)
NY <- latandlong %>% filter(state_name == "New York", city == "Albany") %>% select(state_name, lat, lng)
NC <- latandlong %>% filter(state_name == "North Carolina", city == "Raleigh") %>% select(state_name, lat, lng)
ND <- latandlong %>% filter(state_name == "North Dakota", city == "Bismarck") %>% select(state_name, lat, lng)
Ohio <- latandlong %>% filter(state_name == "Ohio", city == "Columbus") %>% select(state_name, lat, lng)
Oklahoma <- latandlong %>% filter(state_name == "Oklahoma", city == "Oklahoma City") %>% select(state_name, lat, lng)
Oregon <- latandlong %>% filter(state_name == "Oregon", city == "Salem") %>% select(state_name, lat, lng)
Pennsylvania <- latandlong %>% filter(state_name == "Pennsylvania", city == "Harrisburg") %>% select(state_name, lat, lng)
RI <- latandlong %>% filter(state_name == "Rhode Island", city == "Providence") %>% select(state_name, lat, lng)
SC <- latandlong %>% filter(state_name == "South Carolina", city == "Columbia") %>% select(state_name, lat, lng)
SD <- latandlong %>% filter(state_name == "South Dakota", city == "Pierre") %>% select(state_name, lat, lng)
Tennessee <- latandlong %>% filter(state_name == "Tennessee", city == "Nashville") %>% select(state_name, lat, lng)
Texas <- latandlong %>% filter(state_name == "Texas", city == "Austin") %>% select(state_name, lat, lng)
Utah <- latandlong %>% filter(state_name == "Utah", city == "Salt Lake City") %>% select(state_name, lat, lng)
Vermont <- latandlong %>% filter(state_name == "Vermont", city == "Montpelier") %>% select(state_name, lat, lng)
Virginia <- latandlong %>% filter(state_name == "Virginia", city == "Richmond") %>% select(state_name, lat, lng)
Washington <- latandlong %>% filter(state_name == "Washington", city == "Olympia") %>% select(state_name, lat, lng)
WV <- latandlong %>% filter(state_name == "West Virginia", city == "Charleston") %>% select(state_name, lat, lng)
Wisconsin <- latandlong %>% filter(state_name == "Wisconsin", city == "Madison") %>% select(state_name, lat, lng)
Wyoming <- latandlong %>% filter(state_name == "Wyoming", city == "Cheyenne") %>% select(state_name, lat, lng)

states_coord <- rbind(Alabama, Alaska, Arizona, Arkansas, California, Colorado, 
                      Connecticut, Delaware, DC, Florida, Georgia, Hawaii, Idaho, Illinois,
                      Indiana, Iowa, Kansas, Kentucky, Louisiana, Maine, Maryland, Massachusetts,
                      Michigan, Minnesota, Mississippi, Missouri, Montana, Nebraska, Nevada, NH,
                      NJ, NM, NY, NC, ND, Ohio, Oklahoma, Oregon, Pennsylvania, RI, SC, SD, Tennessee,
                      Texas, Utah, Vermont, Virginia, Washington, WV, Wisconsin, Wyoming)

colnames(states_coord)[1] <- "State"

full_data <- bad_drivers_data %>%
  full_join(states_coord)

state_data <- geojsonio::geojson_read("data/us_states.json", what = "sp")



