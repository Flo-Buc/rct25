# Open Data
orb_berlin <- readRDS("/workspaces/rct25/data/generated/Orbis_Berlin_Data/orbis_panel_berlin.rds")

library(dplyr)



# Filter the data for the specific postal code and year
filtered_data_step4 <- orb_berlin %>%
  filter(postcode == "10437" & year == 2021)

# Find the company with the largest total assets (toas)
if (nrow(filtered_data_step4) > 0) {
  company_with_highest_assets <- filtered_data_step4 %>%
    arrange(desc(toas)) %>%
    slice(1) %>%
    select(name_native, toas, shfd, turn)
  
  cat("The company with the highest financial assets in postcode 10437 for the year 2021 is:\n")
  cat("Company Name: ", company_with_highest_assets$name_native, "\n")
  cat("Total Assets (toas): ", company_with_highest_assets$toas, "\n")
  cat("Book Value of Equity (shfd): ", company_with_highest_assets$shfd, "\n")
  cat("Net Sales (turn): ", company_with_highest_assets$turn, "\n")
} else {
  cat("No data found for postcode 10437 in the year 2021.\n")
}
