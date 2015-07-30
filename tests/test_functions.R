#testing the functions.R helper functions
# - getPrefix
# - getCountry
# - getArea

source('R/functions.R')
source('R/dataFactory.R')

test.getPrefix <- function(){
  number <- "4673123456"
  prefix <- getPrefix(number)
  #testing getPrefix
  checkEquals("4673", getPrefix("4673123456"))
  checkEquals("4673", getPrefix("4673123456"))
  checkEquals("46",getPrefix("46123456"))
  checkEquals("473",getPrefix("473123456"))
  checkEquals(NULL,getPrefix("12345"))
}
test.getCountry <- function(){
  checkEquals("46", getCountry("46125"))
  checkEquals("46", getCountry("4612"))
  checkEquals("46", getCountry("46"))
  checkEquals("4", getCountry("4"))
  checkEquals(NULL, getCountry(""))
  }
  
test.getArea <- function(){ 
  checkEquals("73", getArea("4673"))
  checkEquals("7", getArea("467"))
  checkEquals("", getArea("46"))
  checkEquals(NULL, getArea(""))  
}

test.deactivation <- function(){
  DEACTIVATED('Deactivating this test function')
}


