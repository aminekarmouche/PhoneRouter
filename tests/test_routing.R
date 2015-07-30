#testing the routing.R functions
# - cheapestRoute
# - callRoute

source('R/functions.R')
source('R/routing.R')
source('R/dataFactory.R')

test.cheapestRoute <- function(){  
  #input number and finding cpuntry and area
  number <- "4673123456"
  
  checkEquals("B", cheapestRoute(number, operatorsList)$operator)
  checkEquals(1, cheapestRoute(number, operatorsList)$rate)
  
  #number with +44 prefix +462  (cheapest prefix is 4620 with 0 KR./min)
  number <- "462123456"
  checkEquals("A", cheapestRoute(number, operatorsList)$operator)
  checkEquals(0, cheapestRoute(number, operatorsList)$rate)
  
  #number from the US
  number <- "1123456"
  checkEquals("A", cheapestRoute(number, operatorsList)$operator)
  checkEquals(0.9, cheapestRoute(number, operatorsList)$rate)

  #another example of dialled number +26
  number <- "26123456"
  checkEquals("A", cheapestRoute(number, operatorsList)$operator)
  checkEquals(5.1, cheapestRoute(number, operatorsList)$rate)
   
  #number with +44 prefix
  number <- "44123456"
  checkEquals("B", cheapestRoute(number, operatorsList)$operator)
  checkEquals(0.5, cheapestRoute(number, operatorsList)$rate)
  
  #number with no prefix
  number <- "123456"
  checkEquals(NULL, cheapestRoute(number, operatorsList))
  checkEquals(NULL, cheapestRoute(number, operatorsList)$operator)
  checkEquals(NULL, cheapestRoute(number, operatorsList)$rate)

}

test.callRoute <- function(){
  
  #number with +44 prefix
  number <- "4673123456"
  checkEquals(1.1, callRoute(number, operatorA)$rate)
  checkEquals(1.0, callRoute(number, operatorB)$rate)
  
  
  #number with +44 prefix
  number <- "44123456"
  checkEquals(NULL, callRoute(number, operatorA)$rate)
  checkEquals(0.5, callRoute(number, operatorB)$rate)
  
  
  #number with no prefix
  number <- "123456"
  checkEquals(NULL, callRoute(number, operatorA)$rate)
  checkEquals(NULL, callRoute(number, operatorB)$rate)  
  
}

test.deactivation <- function(){
  DEACTIVATED('Deactivating this test function')
}
