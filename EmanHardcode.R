#HardCode 
bad_drivers <- read.csv(file = "data/bad-drivers.csv",  quote = '')

# Selects State, Car Insurance Premiums, and Losses incurred by insurance companies for collisions per insured driver ($) from the CSV
Insurance_Information <- select(bad_drivers, State, Car.Insurance.Premiums...., Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver....)
Alabama <- Insurance_Information %>% filter(State == "Alabama")
California <- Insurance_Information %>% filter(State == "California")
Delaware <- Insurance_Information %>% filter(State == "Delaware")
Florida <- Insurance_Information %>% filter(State == "Florida")
Georgia <- Insurance_Information %>% filter(State == "Georgia")
Hawaii <- Insurance_Information %>% filter(State == "Hawaii")
Idaho <- Insurance_Information %>% filter(State == "Idaho")
Kansas <- Insurance_Information %>% filter(State == "Kansas")
Louisiana <- Insurance_Information %>% filter(State == "Louisiana")
Maine <- Insurance_Information %>% filter(State == "Maine")
Nebraska <- Insurance_Information %>% filter(State == "Nebraska")
Ohio <- Insurance_Information %>% filter(State == "Ohio")
Pennsylvania <- Insurance_Information %>% filter(State == "Pennsylvania")
Tennessee <- Insurance_Information %>% filter(State == "Tennessee")
Utah <- Insurance_Information %>% filter(State == "Utah")
Vermont <- Insurance_Information %>% filter(State == "Vermont")
Washington <- Insurance_Information %>% filter(State == "Washington")

Specific_States <- rbind(Alabama, California, Delaware, Florida, Georgia, Hawaii, Idaho, Kansas, Louisiana,
                         Maine, Nebraska, Ohio, Pennsylvania, Tennessee, Utah, Vermont, Washington)
Specific_States_melt <-melt(Specific_States)
