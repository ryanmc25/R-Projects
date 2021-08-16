
# original function used to sub-divide dataframes into training and testing sets for model testing
 # proportion of data used for testing dataframe controlled by test.size argument (defaults to 70%)
 # training dataframe contains 70% of input dataframe's non-missing data (train)
 # testing dataframe contains 30% of input dataframe's non-missing data (test)
 # output is a list of the 2 above-mentioned dataframes (set)

train_test <- function(data, test.size=0.7) {
  
  dt <- sample(x=nrow(data), size=nrow(data)* test.size)
data_nm <- na.omit(data)
train<-data_nm[dt,]
test<- data_nm[-dt,]
set <- list(train, test)
names(set) <- c("train", "test")
return(set)
}

# using function on publicly available data

# url of data set 
url <- "http://peopleanalytics-regression-book.org/data/salespeople.csv"

# load the data set and store it as a dataframe called salespeople

salespeople <- read.csv(url)


set1 <- train_test(salespeople)

set2 <- train_test(salespeople, test.size = 0.5)



 
