# dataFactory.R ---------------------------
#Creates the pricing lists for each operators  to be used for different tests :D

#Operator A data frame
operatorA <- data.frame(prefix = c(1, 268, 46, 4620, 468, 4631, 4673, 46732), rate = c(0.9, 5.1, 0.17, 0.0, 0.15, 0.15,0.9, 1.1))
#naming the operator
operatorA$operator <- c(rep("A", nrow(operatorA)))

#operator B data frame
operatorB <- data.frame(prefix = c(1, 44, 46, 467, 48), rate = c(0.92, 0.5, 0.2, 1.0, 1.2))
#naming the operator
operatorB$operator <- c(rep("B", nrow(operatorB)))

#list of all price lists as data frame
operatorsList <- list(operatorA,operatorB)


