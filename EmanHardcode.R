#HardCode 
bad_drivers <- read.csv(file = "data/bad-drivers.csv",  quote = '')

# Selects State, Car Insurance Premiums, and Losses incurred by insurance companies for collisions per insured driver ($) from the CSV
Insurance_Information <- select(bad_drivers, State, Car.Insurance.Premiums...., Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver....)
Alabama9 <- Insurance_Information %>% filter(State == "Alabama")
California9 <- Insurance_Information %>% filter(State == "California")
Delaware9 <- Insurance_Information %>% filter(State == "Delaware")
Florida9 <- Insurance_Information %>% filter(State == "Florida")
Georgia9 <- Insurance_Information %>% filter(State == "Georgia")
Hawaii9 <- Insurance_Information %>% filter(State == "Hawaii")
Idaho9 <- Insurance_Information %>% filter(State == "Idaho")
Kansas9 <- Insurance_Information %>% filter(State == "Kansas")
Louisiana9 <- Insurance_Information %>% filter(State == "Louisiana")
Maine9 <- Insurance_Information %>% filter(State == "Maine")
Nebraska9 <- Insurance_Information %>% filter(State == "Nebraska")
Ohio9 <- Insurance_Information %>% filter(State == "Ohio")
Pennsylvania9 <- Insurance_Information %>% filter(State == "Pennsylvania")
Tennessee9 <- Insurance_Information %>% filter(State == "Tennessee")
Utah9 <- Insurance_Information %>% filter(State == "Utah")
Vermont9 <- Insurance_Information %>% filter(State == "Vermont")
Washington9 <- Insurance_Information %>% filter(State == "Washington")

Specific_States <- rbind(Alabama9, California9, Delaware9, Florida9, Georgia9, Hawaii9, Idaho9, Kansas9, Louisiana9,
                         Maine9, Nebraska9, Ohio9, Pennsylvania9, Tennessee9, Utah9, Vermont9, Washington9)
Specific_States_melt <-melt(Specific_States)
