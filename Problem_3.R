###########################
# Assignment 1, Problem 2 #
###########################

winnings <- c(50, 80, 32.4, 21, 70)
losses <- c(30, 90, 12, 21, 60)
dayNames <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')

# Note that vectors can only hold values of a single type!\
# The following will coerce the numbers 1 and 2 to the _characters_ '1' and '2'!

# Vectors can only hold data of a single type.
c(1, 2, 'Wed', 'Thu', 'Fri')

# '1' (a character vector) is completely different from 1 (a numeric vector).
'1' + 1

# a) Calculate total winnings and total losses
winnings
totalWinnings <- sum(winnings)
totalWinnings
totalLosses <- sum(losses)

# b) Calculate average winnings and average losses

# length returns the number of elements of a vector (its length).
# length(winnings) here returns the number of elements in winnings

avgWinnings <- totalWinnings/length(winnings)
avgWinnings
avgLosses <- mean(losses)
avgLosses

# The value returned from the function mean is a numeric vector
# and can be used just like any other vector

# c)
## Define profit
## Note that the operation (here subtraction) is performed elementwise!
profit <- winnings - losses

## The summary function returns a 6 number summary
# min, max, median, 1st quartile, 3th quartile and the mean
summary(profit)


# d)
# Print the value of winnings before assigning names
# to see how it looks
winnings
str(winnings)

## Assign the names
names(winnings) <- dayNames

## And look at the vector again to see the difference
str(winnings)

## The same with the losses vector
names(losses) <- dayNames

## When elements in a vector have names
## those can be used to select the elements
## using the subsetting operator []

winnings[c('Tue', 'Mon')]

## Note: when trying to select a name that is NOT present,
## the default behaviour is to return NA (missing value)
losses[c('Monday', 'Tue')]

## Another way to select elements from a vector is to use indices

losses[1:2]

## return the first two elements of losses

losses[c(1, 3, 5)]

## returns the first, the third and the fifth element of losses

## Negative indices _exclude_ elements

losses[-c(1, 2)]

## returns all except the first two elements
## Note that 

-1:2

## does NOT return the vector c(-1, -2) but 
## return the vector c(-1, 0, 1, 2)
## If you want to use the shortcut, write it in paranthesis
## like this
-(1:2)

losses[-(1:2)]

## is the same as 
losses[c(-1, -2)]

## Note that you cannot mix positive and negative indices
## the following with throw an error

losses[c(0, -2, 0)]




# e) subsetting with a logical condition

## The following compares each element of profit
## with 0 and returns TRUE of profit > 0 and FALSE otherwise
profit > 0

## The rules of recycling apply, so the previous line is
## equivalent to this one:
profit > rep(0, length(profit))

## Store the result of the logical operation in a vector
positiveProfit <- profit == 0

## Print the vector to see its contents
positiveProfit

## The subsetting operator can accept a logical vector
## in that case it returns those elements of a vector
## where the condition is TRUE
## The following two lines are equivalent
dayNames[positiveProfit]
dayNames[profit > 0]

# f) This can be accomplished in several ways
## 1) Select the first days of the week by name
## from losses and compute the mean of the resulting
## vector
avgLossBeginning <- mean(losses[c('Mon', 'Tue')])
avgLossBeginning

## Select the first two elements of losses by index
## NOTE that this relies on the order of elements 
## in the vector!

mean(losses[1:2])

## The same with losses
avgLossEnd <- mean(losses[c('Thu', 'Fri')])
avgLossEnd

## The function mean returns a vector of length 1
## so it can be used as any other vector, for
## example we can test whether avgLossBeginning
## is greater than avgLossEnd
## by using a logical operator

avgLossBeginning > avgLossEnd


# g)
## This is similar to the previous part, only this time
## we apply sum after we subset the vector profit
## Here we select the elements by index but 
## if you have assigned names you can also 
## use those to select the appropriate subsets

sum(profit[1:2]) > sum(profit[4:5])

# h)
pokerData <- data.frame(
  df.dayNames = dayNames,
  df.winnings = winnings, 
  df.losses = losses,
  df.profit = profit
)
length(pokerData)
## As vectors have length, so do data.frames have dimensions
dim(pokerData)

## return the size of the first dimension (rows) and the size of the
## second dimension (columns)
## here dim(pokerdata) returns c(5, 4) because there are
## 5 rows (corresponding to the five days)
## and 4 columns

## NOTE that length(pokerData) does not raise an error
## but returns 4. This corresponds to the number of columns.

## Columns (variables) in a data.frame have names
## that can be obtained by calling 
names(pokerData)

## Rows also have names and can be obtained by
row.names(pokerData)

## Subsetting a data.frame works similarly to the way 
## we selected subset of vectors, only this time
## the index has two dimensions (rows and columns)

## To select the 3th and the 1st row (in that order!!)
## and ALL columns, run:
pokerData[c(3, 1), ]

## To select the first two rows and 
## the columns names df.daynames and df.losses,
## run
pokerData[c(1, 2), c('df.dayNames', 'df.losses')]


## To select all rows and the column df.losses, run
pokerData[, 'df.losses']

## or alternatively: 
pokerData$df.losses

## NOTE that the result is generally the same except
## when you try to select a column that does not exist
## in the data.frame. Look at the difference:

pokerData[, 'some_column_that_is_not_there']
pokerData$some_column_that_is_not_there


# i)

## You can create new columns of overwite existing ones
## by using the following syntax
exchangeRate <- c(1.683, 1.679, 1.684, 1.678, 1.655) #BGN/USD
pokerData$df.profitBGN <- pokerData$df.profit * exchangeRate

pokerData[, 'df.profitBGN'] <- pokerData[, 'df.profit'] * exchangeRate

## However, this tends to become rather cumbersome
## A more convinient way to work with data.frames
## is given by the within function
## Assignment within the code block in the curly braces
## is interpreted as assignment to columns in the data.frame
## Names used within the block are first looken up in
## as columns in the data.frame

pokerData <- within(pokerData, {
  profitBGN1 <- df.profit * exchangeRate
  profitBGN2 <- profitBGN1 + 1000
  profitBGN3 <- 50
})
pokerData
pokerData






pokerData
pokerData[3, 'df.winnins'] <- 60
pokerData
pokerData

df.winnins

pokerData
dim(pokerData)
pokerData[1:4, c('df.profit', 'profitBGN')]

# k)
write.csv(pokerData, file='gambling.csv')
