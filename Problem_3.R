###########################
# Assignment 1, Problem 2 #
###########################

winnings <- c(50, 80, 32.4, 21, 70)
losses <- c(30, 90, 12, 21, 60)
dayNames <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')

# a)
totalWinnings <- sum(winnings)
totalLosses <- sum(losses)

# b)
avgWinnings <- totalWinnings/length(winnings)
avgLosses <- mean(losses)

# c)
profit <- winnings - losses
summary(profit)

# d)
names(winnings) <- dayNames
winnings
names(losses) <- dayNames
losses

# e)
dayNames[profit > 0]

# f)
avgLossBeginning <- mean(losses[c('Mon', 'Tue')])
avgLossEnd <- mean(losses[c('Thu', 'Fri')])

avgLossBeginning > avgLossEnd

# g)

# This code relies on the order of the vector. Alternatively, you can use
# The day names as in 6).
sum(profit[1:2]) > sum(profit[4:5])

# h)
pokerData <- data.frame(
  dayNames = dayNames,
  winnins = winnings, 
  losses = losses,
  profit = profit
)
pokerData

# i)

exchangeRate <- c(1.683, 1.679, 1.684, 1.678, 1.655)
pokerData <- within(pokerData, {
  profitBGN <- profit * exchangeRate
})
pokerData


# k)
write.csv(pokerData, file='gambling.csv')

