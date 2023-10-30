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

df <- read.csv("data/MATES_participant_author_list.csv")


# Number of rows in the data frame
total_rows <- nrow(df)

# Number of rows per chunk
chunk_size <- 400

# Calculate the number of chunks needed
num_chunks <- ceiling(total_rows / chunk_size)

# Loop to create each chunk
for (i in 1:num_chunks) {
  start_row <- ((i - 1) * chunk_size) + 1
  end_row <- min(i * chunk_size, total_rows)
  
  # Subset the data frame
  subset_df <- df[start_row:end_row, ]
  
  # Create the file name
  file_name <- paste("MATES_participants_", start_row, "_to_", end_row, ".csv", sep = "")
  
  # Write the CSV file
  write_csv(subset_df, paste("C:/Users/khtmo/OneDrive - UNSW/University/PhD_Chapters/5_mates/MATES_Analysis/data", file_name, sep = ""))
}
