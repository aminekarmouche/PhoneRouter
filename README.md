# Programming exercise - Routing of telephone calls
The purpose is to find the cheapest operator for a certain dialled phone number thereby routing it to the cheapest operator
## Assumptions
- the number format is "68123456789" where the country code is composed of 6 digits and the prefix of 5 digits
- take the longest prefix in case of multiple prefix matches
- disregard a certain operator if it doesn't handle a certain prefix

## Data 
The input data is a collection of price lists corresponding to different operator pricing lists.

You can add more data frames in R/dataFactory.R

Operators A and B respectively:

|Prefix   |Rate   |   |Prefix   |Rate   |
|---|---|---|---|---|
| 1  | 0.9  |   | 1  | 0.92  |
|  268 | 5.1  |   | 44   | 0.5  |
|46   | 0.17  |   | 46 |  0.2 |
|4620   | 0.0  |   | 46   | 1.0  |
|468   | 0.15  |   |  48 | 1.2   |
|4631  |0.15  |   |   |   |
|4673   | 0.9  |   |   |   |
|46732   | 1.1  |   |   |   |

## Approach
### Language
I used R, which has various Perl-based implementations of BSTs, hash tables, and other useful data structures.

### Data structure
In order to make the search efficient for huge datasets, I used dataframes as R supports thel and provides a search using a binary search tree with a complexity of O(log(n)). Other data structures can be used such as hash tables. All these data strutures are similar to their implementation in PERL. 

Using the grep function for matching prefix the patterns also enhances the performance of the algorithm. 

Here's the approach, for each list: 
- compare the prefix of the dialled number with the prefixes on the list
- find the longest matching prefix using regex
- if no match replace the regex pattern with the it's substring less the last character
- if not match at all return null


##Testing
Tests are includes in the "tests" folder and contain several test cases for the different helper functions and routing functions. Different dialled numbers scenarios are included.
In order to perform unit test, please run tests/runTests.R

##Demo
A demo is available by running demo.R for a sample dialled number using the format in the assignment.

## License
This work is private and will remain so as it is part of an internship selection process. 