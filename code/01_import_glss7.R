#-------------------------------------------------------
# current file: 01_import_glss7.R 
# purpose: is to *import* all the glss7 dataset
#-------------------------------------------------------
# loading important packages
#-------------------------------------------------------
# package for cleaning, transforming and visualizing data
library(tidyverse)

#package for reading Stata (.dta files)
library(haven)

#package for cleaning variable names and inspecting datasets easily
library(janitor)

# -------------------------------------------------------------
# where to find relevant dataset to this study
# -------------------------------------------------------------
# 1. part A of the dataset is found in the data/raw/g7PartA_upd
ds_pathA <- "data/raw/g7PartA_upd"

# list all the .dta files in this folder and assign it to partA_files
partA_files <- list.files(
  path = ds_pathA,
  pattern = "\\.dta$",
  full.names = TRUE
)
# list file names without the folder path
basename(partA_files)

# check my current working dir
getwd()

# G7sec8g.dta	contains data on Processing Agricultural Produce: most important file for this research
# its located in data/raw/g7PartB/g7sec8g.dta
# import it into r and assign it to partB_sec8g
partB_sec8g <- read_dta("data/raw/g7PartB/g7sec8g.dta")

# lets see what it contains
dim(partB_sec8g) # size: it contains 16844 rows (households) and 28 columns
head(partB_sec8g) # view first few rows
names(partB_sec8g) # names of all the variables (household ID, etc)
glimpse(partB_sec8g) # view the strcuture of all the variables including data types, sample values, etc

# since most variable names start with code names like s8g (section 8 part g),
# lets look for all of them
names(partB_sec8g) |> str_subset("s8g") # |> assigns whats on the left to the right unlike <-

# now lets see the descriptions of the s8g variable names
# load package to do that
install.packages("labelled")
library(labelled)
# now give the human understandable desc of the s8g variable names
look_for(partB_sec8g)

# view the dataset as a table
view(partB_sec8g)

# look for missing values. nb: structural missing values occur based on answers to previous questions
partB_sec8g |>
  summarise(across(everything(), ~sum(is.na(.))))

#-----------------------------relating to research questions------------
# how many households processed agricultural products
partB_sec8g |>
  count(s8gq1)

#
val_labels(partB_sec8g$s8gq1)
