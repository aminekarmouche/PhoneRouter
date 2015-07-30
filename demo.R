source('R/functions.R')
source('R/routing.R')


# ~~~~~~~~~~~~~~~~~~~~~~~~~~ SETUP START ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# The setup portion of this demo will execute steps would happen organically in
# the course this assignment.
# steps are:
#
# - get the price lists data in data frames
# - name the data frames according to the operator
# - aggregate the data frames in a list (operatorList)

# The test file would normally reside in "<packagedir>/tests/unitizer", 

#Operator A data
operatorA <- data.frame(prefix = c(1, 268, 46, 4620, 468, 4631, 4673, 46732), rate = c(0.9, 5.1, 0.17, 0.0, 0.15, 0.15,0.9, 1.1))
operatorA$operator <- c(rep("A", nrow(operatorA)))

#operator B data
operatorB <- data.frame(prefix = c(1, 44, 46, 467, 48), rate = c(0.92, 0.5, 0.2, 1.0, 1.2))
operatorB$operator <- c(rep("B", nrow(operatorB)))

#list of all price lists
operatorsList <- list(operatorA,operatorB)

# - The number is inputted in a format "68123456789" according to the assignment
# - The prefix, countryCode and areaCode are extracted using the helper fucntions in functions.R

#input number and finding country and area
input <- "4673123456"
#getting country and area codes


# The operator with the cheapest pricing is outputted in a string with the different details
output <- cheapestRoute(input, operatorsList)
operator <- output$operator
rate <- output$rate
paste("The cheapest operator for the number +", input, " is operator: ", operator, " with a rate of:", rate, " Kr./min", sep = "")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DEMO OVER :D ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~