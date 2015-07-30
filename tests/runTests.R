# runTests.R ---------------------------
#Running tests for : 
#     - functions.R
#     - Routing.R

library("RUnit")
library("testthat")

source('R/functions.R')
source('R/routing.R')


# -- Defining test suites and showing testresults
# testing functions.R
testSuite.functions <- defineTestSuite(name = "functions test suite", dirs = file.path("tests"),testFileRegexp = "test_functions.R")
testResult.functions <- runTestSuite(testSuite.functions)
printTextProtocol(testResult.functions)


#testing routing.R
testSuite.routing <- defineTestSuite(name = "routing test suite", dirs = file.path("tests"),testFileRegexp = "test_routing.R")
testResult.routing <- runTestSuite(testSuite.routing)
printTextProtocol(testResult.routing)
