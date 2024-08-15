# Shinichi ICC 

pacman::p_load(tidyverse,
               here,
               stringr,
               purrr,
               kableExtra,
               rptR,
               lme4)



task_conflict <- read_csv(here("data", "task", "MATES_task_conflict_rate.csv"), skip = 0) # load in data




# Make the data long 


# One thing to note is the "Not Applicable" option for some items is coded as 0 and if an appriaser did not do a study it is NA 
# I think for binary you would need to code the Not Applicable as NA also.

dat <- task_conflict %>%
  select(appraiser_id, study_id, starts_with("item_")) %>%
  select(-ends_with("comment")) %>%
  pivot_longer(cols = starts_with("item_"), names_to = "item", values_to = "value") %>%
  mutate(effect_formula = case_when(
    value == "Yes" ~ 2,
    value == "No" ~ 1,
    value == "Not Applicable" ~ 0 # Change to NA if you need to
  )) %>%
  select(-value) %>%
  pivot_longer(cols = -c(study_id, item, appraiser_id), names_to = "appraiser", values_to = "appraisal_result") %>%
  select(study_id, item, appraiser_id, appraisal_result)

str(dat)

# making character strings into factors for dat

dat <- dat %>%
  mutate(across(where(is.character), as.factor))

# turning appraisal_result - turing 0 = NA, 1 = 0 and 2 = 1

dat$appraisal_result <- ifelse(dat$appraisal_result == 0, NA, ifelse(dat$appraisal_result == 1, 0, 1))


# create 14 different data sets by grouping by item
dat_list <- dat %>%
  group_by(item) %>%
  group_split()

# create a list of the ICCs for each item using the rptBinary function

icc_list <- dat_list %>%
  map(~ rptBinary(appraisal_result ~ 1 + (1|study_id),
                  grname = "study_id",
                  data = .x))

#

icc_list2 <- dat_list %>%
  map(~ rptBinary(appraisal_result ~ 1 + (1|study_id) + (1|appraiser_id),
                  grname = c("study_id", "appraiser_id"),
                  data = .x))


# save icc_list as rds

saveRDS(icc_list, here("ICC", "icc_list.rds"))

# the order (could have changed above)
# item_1 item_10 item_11 item_12 item_13 item_14 item_2 item_3 item_4 item_5 item_6 item_7 ... item_9
# getting a vector of the ICCs - $ R  

icc <- icc_list %>%
  map_dbl(~ .$R$study_id[2])


# fit lmer model binary 
# 
# fit <- glmer(appraisal_result ~ 1 + (1|study_id), data = dat_list[[2]], 
#             family = "binomial")


####### My kappa test with simulated data to see when the Kappa was 1 or NaN #################

# Create a confusion matrix of the raters' assessments
# Assume we have two raters, Rater A and Rater B
# Rater A: 1, 0, 1, 1, 0, 1, 0, 0
# Rater B: 1, 1, 1, 0, 0, 1, 0, 0

rater_a <- c(1, 1, 1, 1, 1, 1, 1, 1)
rater_b <- c(1, 1, 1, 1, 1, 1, 1, 1)

# Create a table of the raters' assessments
conf_matrix <- table(rater_a, rater_b)

# Print the confusion matrix
print(conf_matrix)

# Calculate the number of observations
n <- sum(conf_matrix)

# Calculate the observed agreement
p0 <- sum(diag(conf_matrix)) / n

# Calculate the expected agreement by chance
p_e <- sum(rowSums(conf_matrix) * colSums(conf_matrix)) / (n^2)

# Calculate Cohen's kappa
kappa <- (p0 - p_e) / (1 - p_e)

# Print Cohen's kappa
print(kappa)