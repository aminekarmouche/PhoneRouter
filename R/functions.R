# functions.R ---------------------------
#functions for: 
#     - input processing: processing the dialled number (getprefix(), getCountry(), getArea())   

getPrefix <- function(input){
  #getprefix from number assuming a 6 digit phone number with a prefix of a max of 5 digits  
  #
  #Args:
  # input: String of characters containing the phone number in the format “68123456789”
  #        contains a prefix composed of a country code and an area code
  #
  #Returns:
  # prefix: String of characters containing the prefix
  
  #the base number must be 6 digits long
  if(nchar(input) < 6){
    return(NULL)
  } else {
    #removing the base number and keeping the perfix
    prefix <- toString(substr(x = input,start = 1,stop = nchar(x = input, type = "chars")-6)) 
    return(prefix)           
  }
}

getCountry <- function(prefix){
  #get the country code from prefix
  #
  #Args:
  # prefix: String of characters containing prefix with a max of 5 digits
  #        including a country code and an area code
  #
  #Returns:
  # countryCode: String of characters containing the countrycode
  #checking invalid prefix
  if(is.null(prefix) == TRUE){
    return(NULL)
  } else if (nchar(prefix) == 0){
    return(NULL)
  } else {
    #country code is max. 2 digits long
    countryCode <- substr(x = prefix, start = 1, stop = 2)
    return(countryCode)   
  }
}

getArea <- function(prefix){
  #gets area code from prefix
  #
  #Args:
  # prefix: String of characters containing prefix with a max of 5 digits
  #        including a country code and an area code
  #
  #Returns:
  # areaCode: String of characters containing the area code
  #           if no area code is included "" is returned
  
  #checking invalid prefix
  if(is.null(prefix) == TRUE){
    return(NULL)
  } else if (nchar(prefix) == 0){
    return(NULL)
  } else {
    #areacode must be max. 5 digit long
    areaCode <- substr(x = prefix, start = 3, stop = 4)
    return(areaCode)  
  }
}