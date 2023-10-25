# Load the necessary libraries
library(dplyr)
library(stringr)
library(tidyr)

# Read the CSV file
data <- read.csv("data/MATES_participant_paper_list.csv")

# Create a new column with the email address
data <- data %>%
  mutate(Email = str_extract_all(correspondence_address, "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b")) %>%
  unnest(Email, keep_empty = TRUE)

                                                           
write.csv(data, "data/MATES_participant_author_list.csv")

