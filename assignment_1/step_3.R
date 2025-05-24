library(dplyr) 

mfm_gastro <- orbis_panel_berlin %>% filter(name_native == "MFM Gastro GmbH")


years_with_statements <- orbis_panel_berlin %>%
  filter(name_native == "MFM Gastro GmbH") %>%
  select(year) %>%
  distinct()
print(years_with_statements)
