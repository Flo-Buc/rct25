# Open Data
orb_berlin <- readRDS("~/github/rct25/data/generated/Orbis_Berlin_Data/orbis_panel_berlin.rds")

library(dplyr)

# Filter the data for the specific postal code and year
filtered_data_step4 <- orb_berlin %>%
  filter(postcode == "10437" & year == 2021)

# Find the company with the largest total assets (toas)
if (nrow(filtered_data_step4) > 0) {
  company_with_highest_assets <- filtered_data_step4 %>%
    arrange(desc(toas)) %>%
    slice(1) %>% 
    select(name_native, toas)
  
  cat("Company with the highest financial assets in postcode 10437 for the year 2021:\n")
  print(company_with_highest_assets)
} else {
  cat("No data found for postcode 10437 in the year 2021.\n")
}