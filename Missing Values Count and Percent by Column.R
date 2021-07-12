
  
  

# Function that iterates through all columns of a dataframe and returns a dataframe 
# containing: 1) the names of the input columns 2) Sum of NA's by column 3) percentage of observations missing
# by column 

  calc_NA <- function(df) {
    
    col_names <- vector("integer", ncol(df)) 
    missing_percent <- vector("double", ncol(df))
    missing_sum <- vector("character", ncol(df))
    for (i in seq_along(df)) {            
      col_names[i] <- colnames(df)[i] 
      missing_percent[i] <- sum(is.na(df[,i])) / (sum(is.na(df[,i])) + sum(!is.na(df[,i]))) * 100
      missing_sum[i] <- sum(is.na(df[,i]))
    }
    output4 <- data.frame(col_names, missing_percent, missing_sum) 
    print(output4)
    }

# Using function on publically available data

# url of data set 
  url <- "http://peopleanalytics-regression-book.org/data/salespeople.csv"
  
# load the data set and store it as a dataframe called salespeople
  salespeople <- read.csv(url)
  
# Examining dataset with calc_NA()
  
calc_NA(salespeople)
