loader <- function(path) {
  #read the dataset with csv format
  retail <- read.csv(path)
  
  #return the dataset
  retail
}

cleaner <- function(path) {
  #load the dataset
  retail <- loader(path)
  
  #drop the unimportant column
  retail <- retail[,-c(1, 2, 6, 8)]
  #subset the row with negative profit
  retail <- retail[retail$Profit < 0,]
  
  #return the dataset
  retail
}

convertToDate <- function(dataset) {
  #cast order and ship date from character to date
  dataset$Order.Date <- as.Date(dataset$Order.Date, "%m/%d/%y")
  dataset$Ship.Date <- as.Date(dataset$Ship.Date, "%m/%d/%y")
  
  #return the dataset
  dataset
}