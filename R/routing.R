# routing.R ---------------------------
#functions for: 
#     - routing: callRoute() and cheapestRoute() 

callRoute <- function(number, data){
  #routing calls
  #finds the route of the call based on the prefix (country + area code)  
  #
  #Args:
  # number: String of characters containing dialled number
  #
  #Returns:
  # route: data frame containing the operator route in case of a match
  # NULL: no route found ie. no match 
  
  #find the prefix, country, and area codes
  prefix <- getPrefix(number)
  country <- getCountry(prefix)
  area <- getArea(prefix)
  
  #check null input
  if((is.null(country) || is.null(area) || is.null(data)) == TRUE ){
    return(NULL)
  } else {
    #iterate over the area code
    for(i in 1:nchar(area)){ 
      # if no match found then reduce the area code
      area <- substr(area, 1, nchar(area)-(i-1))  
      #compose regex pattern
      pattern <-  paste('^', country, area, sep = "")
      #lookup using grep
      index <- grep(pattern, data$prefix, perl = T)
      if(nrow(data[index,])!=0){
        result <- data[index,]
        #keep longest prefix 
        route <- result[which(nchar(result$prefix, type = "chars") == max(nchar(result$prefix, type = "chars"))), ] 
        return(route)
      }
    }
    return(NULL)
  }
}

cheapestRoute <- function(number, list){
  #finds the cheapest operator route 
  #
  #Args:
  # number: String of characters containing dialled number
  # area: String of characters containing the area code
  # list: list of data frames containing the operator list for all operators
  #
  #Returns:
  # cheapest: data frame containing the operator route in case of a match
  
  #find the prefix, country, and area codes
  prefix <- getPrefix(number)
  country <- getCountry(prefix)
  area <- getArea(prefix)
  
  # NULL: no route found ie. no match 
  if((is.null(country) || is.null(area) || is.null(list)) == TRUE ){
    return(NULL)
  } else {
    
    #format data as data frame
    data <- data.frame()
    for(i in list){
      result <- callRoute(number, i)
      data <- as.data.frame(rbind(data,result))
    }
    
    #check if no match is made of any list
    if((is.null(data) == TRUE)) {
      print("No match!")
      return(NULL)
    } else {
      #keep the cheapest data frame
      cheapest <- data[which(data$rate == min(data$rate)), ]
      return(cheapest)
    }
  }  
}