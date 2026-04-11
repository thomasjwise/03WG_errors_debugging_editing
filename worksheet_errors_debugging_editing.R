# Errors, Debugging and Editing - Worksheet 

# Setup Execution 
## This will use the function "source()" to run the separate R File "setup.R"
## The "setup.R" file includes information such as: which packages to install, 
## and to check the working directory is correctly set. 
source("setup.R", local = FALSE)

# Package Loading 
library(tidyverse)

# Section 1: Common Errors 

## Example 0: The Correct Method 
data <- read.csv(file = "data/data_wales_education.csv")

## Example 1: Undefined Location 

data <- read.csv(file = )
  # Expected Error: 
    # Error in read.csv(file = ) : argument "file" is missing, with no default

## Example 2: Incomplete or unmatched parenthesis (brackets)

data <- read.csv(file = "data/data_wales_education"))
  # Expected Error: 
    # Error: unexpected ')' in "data <- read.csv(file = "data/data_wales_education"))"

## Example 3: Incorrect Location 

data <- read.csv(file = "data_wales_education")
  # Expected Error: 
    # Error: Error in file(file, "rt") : cannot open the connection
              # In addition: Warning message:
              # In file(file, "rt") :
              # cannot open file 'data_wales_education': No such file or directory