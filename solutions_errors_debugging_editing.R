# Errors, Debugging and Editing - Solution Sheet

# Setup Execution 
## This will use the function "source()" to run the separate R File "setup.R"
## The "setup.R" file includes information such as: which packages to install, 
## and to check the working directory is correctly set. 
source("setup.R", local = FALSE)

# Package Loading 
library(tidyverse)

# Section 1: Common Errors 

## Exercise 1: For each of the Chunks, involving the read.csv() function
##             Run the line of code, interpret the error and fix the problem

## Chunk 1.0: The Correct Method 
data <- read.csv(file = "data/data_wales_education.csv")

## Chunk 1.1: Undefined Location 
data <- read.csv(file = )
# Expected Error: 
# Error in read.csv(file = ) : argument "file" is missing, with no default

# Solution: 
data <- read.csv(file = "data/data_wales_education.csv")

## Chunk 1.2: Incomplete or unmatched parenthesis (brackets)
data <- read.csv(file = "data/data_wales_education"))
# Expected Error: 
# Error: unexpected ')' in "data <- read.csv(file = "data/data_wales_education"))"

# Solution: 
data <- read.csv(file = "data/data_wales_education.csv")


## Chunk 1.3: Incorrect Location 
data <- read.csv(file = "data_wales_education")
# Expected Error: 
# Error: Error in file(file, "rt") : cannot open the connection
# In addition: Warning message:
# In file(file, "rt") :
# cannot open file 'data_wales_education': No such file or directory

# Solution: 
data <- read.csv(file = "data/data_wales_education.csv")


## Exercise 2: For each of the Chunks, involving various different functions, 
##             Solve them using the data we have already loaded in! 

## Chunk 2.1: 
summary()
# Expected Error: 
# Error in summary.default() : 
# argument "object" is missing, with no default

# Solution 
summary(data)

## Chunk 2.2: 
if (ncol(data) > ) {
  print("Has more than 10 columns")
}
# Expected Error: 
# Error: unexpected ')' in "if (ncol(data) > )"

# Solution 
if (ncol(data) > 10) {
  print("Has more than 10 columns")
}

## Chunk 2.3: 
ncol(data 
# Expected Error: 
# `>`
# Error: unexpected symbol in:....

# Solution 
ncol(data)


## Exercise 3: Using your knowledge from last session, solve these errors

## Chunk 3.1: 
chr_cols <- sapply(data, is-character)
# Expected Error: 
# Error in is - character : non-numeric argument to binary operator

# Solution 
chr_cols <- sapply(data, is.character)

## Chunk 3.2: 
data[chr-cols] <- lapply(data[chr_cols], as,factor)

# Expected Error 1: 
# Error in class2Def@className : no applicable method for `@` applied to an object of class "function"

# Expected Error 2: 
# Error: object 'chr' not found

# Solution 
data[chr_cols] <- lapply(data[chr_cols], as.factor)

## Chunk 3.3:
data_list_year >- split(data. data£Academic.year)

# Multiple Errors.... 
# Expected Error 1: 
# Error: unexpected symbol in "data_list_year >- split(data. data"

# Expected Error 2: 
# Error: unexpected input in "data_list_year >- split(data, data£"

# Expected Error 3: 
# Error: object 'data_list_year' not found

# Solution
data_list_year <- split(data, data$Academic.year)


# Section 2: Finding Solutions to Errors 

# Exercise 1: Tackling simple problems

# Using the ggplot2 helper page, website (https://ggplot2.tidyverse.org/) or other sources
# Solve the following problems (on your own or in teams)

# These problems will use the Palmer Penguins dataset (loaded below)
penguins_data <- penguins

# Chunk 1.1: 
# Create a visualisation which plots Bill Length against Bill Depth in a scatterplot


# Solution 
ggplot(data = penguins_data, 
       mapping = aes(x = bill_len, 
                     y = bill_dep)) + 
  geom_point()


# Chunk 1.2: 
# Developing the plot from Chunk 1.1, group Penguin species by colour 

# Solution 
ggplot(data = penguins_data, 
       mapping = aes(x = bill_len, 
                     y = bill_dep,
                     colour = species)) + 
  geom_point()

# Chunk 1.3:
# Developing the plot from 1.2, add a shape variable defining penguin sex. 

# Solution 
ggplot(data = penguins_data, 
       mapping = aes(x = bill_len, 
                     y = bill_dep,
                     colour = species,
                     shape = sex)) + 
  geom_point()


# Exercise 2: Conducting independent Research 

# Using similar or different sources (your choice), solve the following:

# Chunk 2.1: 
# Create an faceted visualisation, creating a 3x3 visualisation, which groups: 
  # Penguin Sex, and species separately. 
  # With the overall aim to show individually penguins Bill Length and Depth by sex and species. 

# Solution 
ggplot(data = penguins_data, 
       mapping = aes(x = bill_len, 
                     y = bill_dep)) + 
  geom_point() + 
  facet_grid(sex ~ species)


# Chunk 2.2: 
# Create a visualisation, plotting body mass by flipper length, grouped by species
# But also including a line of best fit (linear) - this should automatically be produced for the groups. 

# Solution 
ggplot(data = penguins_data, 
       mapping = aes(x = body_mass, 
                     y = flipper_len,
                     colour = species)) + 
  geom_point() + 
  geom_smooth(formula = y ~ x, method = "lm")

