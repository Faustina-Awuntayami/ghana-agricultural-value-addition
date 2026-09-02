library(tidyverse)
library(haven)
library(janitor)

# Folder containing GLSS Part A files
partA_path <- "data/raw/g7PartA_upd"

# List all .dta files in Part A
partA_files <- list.files(
  partA_path,
  pattern = "\\.dta$",
  full.names = TRUE
)

# Print filenames
basename(partA_files)

# List only Stata files anywhere inside data/raw
list.files("data/raw", pattern = "\\.dta$", recursive = TRUE)
# ----------------------------------------------------
# List only the agriculture files in Part B
list.files("data/raw/g7PartB", pattern = "g7sec8", full.names = FALSE)
# Import the processing dataset from Part B
glss8g <- read_dta("data/raw/g7PartB/g7sec8g.dta")

# Number of rows and columns
dim(glss8g)

# First six rows
head(glss8g)

# Overview of variables
glimpse(glss8g)
# Show all variable names
names(glss8g)
