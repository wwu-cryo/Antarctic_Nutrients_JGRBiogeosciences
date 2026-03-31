library(tidyverse)

AP <- read.csv("/Users/ellieryan/Desktop/APCellCounts_20250617.csv")

AP_summary <- AP %>%
  group_by(SampleName) %>%
  summarise(
    SampleType = first(SampleType),
    DateCounted = first(DateCounted),
    Observer = first(Observer),
    CellDensity_mean = mean(CellDensity, na.rm = TRUE),
    CellDensity_sd   = sd(CellDensity, na.rm = TRUE),
    
    CellLength_mean = mean(CellLength, na.rm = TRUE),
    CellLength_sd   = sd(CellLength, na.rm = TRUE)
  ) %>%
  # Extract date and algae number from SampleName
  mutate(
    SampleDate = str_extract(SampleName, "^\\d{4}-\\d{2}-\\d{2}") %>% ymd(),
    AlgaeNum = str_extract(SampleName, "(?<=algae)\\d+") %>% as.integer()
  ) %>%
  arrange(SampleDate, AlgaeNum)   %>%
  select(-SampleDate, -AlgaeNum)# remove helper columns if not needed


write.csv(AP_summary, "/Users/ellieryan/Desktop/AP_summary.csv", row.names = FALSE)





CK <- read.csv("/Users/ellieryan/Desktop/CKCellCounts_20250617.csv")

CK_summary <- CK %>%
  group_by(SampleName) %>%
  summarise(
    Observer = first(Observer),
    CellDensity_mean = mean(CellDensity, na.rm = TRUE),
    CellDensity_sd   = sd(CellDensity, na.rm = TRUE),
    
    CellLength_mean = mean(CellLength, na.rm = TRUE),
    CellLength_sd   = sd(CellLength, na.rm = TRUE)
  ) %>%
  # Extract date and algae number from SampleName
  mutate(
    AlgaeNum = str_extract(SampleName, "(?<=algae)\\d+") %>% as.integer()
  ) %>%
  arrange(AlgaeNum) %>%
  select(-AlgaeNum)# remove helper columns if not needed


write.csv(CK_summary, "/Users/ellieryan/Desktop/CK_summary.csv", row.names = FALSE)




AP_HPIC <- read.csv("/Users/ellieryan/Desktop/APHPIC_20250617.csv")

AP_HPICsummary <- AP_HPIC %>%
  group_by(SampleName) %>%
  summarise(
    across(where(is.numeric), list(mean = ~mean(.x, na.rm = TRUE)),
           .names = "{.col}_{.fn}")) %>%
  # Extract date and algae number from SampleName
  mutate(
    SampleDate = str_extract(SampleName, "^\\d{4}-\\d{2}-\\d{2}") %>% ymd(),
    AlgaeNum = str_extract(SampleName, "(?<=algae)\\d+") %>% as.integer()
  ) %>%
  arrange(SampleDate, AlgaeNum)  


write.csv(AP_HPICsummary, "/Users/ellieryan/Desktop/AP_HPICsummary.csv", row.names = FALSE)
