library(dplyr) 

# Open Data
orb_berlin <- readRDS("/workspaces/rct25/data/generated/Orbis_Berlin_Data/orbis_panel_berlin.rds")


#########################################################
# Checking only for the company which filed 
#########################################################


# Creates Data (Table) with only MFM Gastro GmbH Data
mfm_gastro <- orb_berlin %>% filter(name_native == "MFM Gastro GmbH")


#Returns all years where an income statement has been filed for MFM Gastro GmbH
years_with_statements <- orb_berlin %>%
  filter(name_native == "MFM Gastro GmbH") %>%
  select(year) %>%
  distinct()
print(years_with_statements)


#########################################################
# Checking for all 5 Companies
#########################################################

# Define the list of company names to check
company_names <- c("Velomax Berlin Hallenbetriebs GmbH","Villa Rodizio Berlin","Wen Cheng Restaurants GmbH","MFM Gastro GmbH","Bellamiso Optik")

# Loop through each company name
for (company in company_names) {
  if (company %in% unique(orb_berlin$name_native)) {
    filings <- orb_berlin %>%
      filter(name_native == company) %>%
      select(year) %>%
      distinct()
    
    # Check if there are any filings
    if (nrow(filings) > 0) {
      cat("Years with filings for", company, ":\n")
      print(filings)
    } else {
      cat("Company in dataset, but no filings for", company, "\n")
    }
  } else {
    cat("Company not in Orbis data file:", company, "\n")
  }
}
