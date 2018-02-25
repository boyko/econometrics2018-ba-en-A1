###########################
# Assignment 1, Problem 2 #
###########################

winnings <- c(50, 80, 32.4, 21, 70)
losses <- c(30, 90, 12, 21, 60)
dayNames <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')

#1)

totalWinnings <- sum(winnings)
totalLosses <- sum(losses)

#2)

avgWinnings <- totalWinnings/length(winnings)
avgLosses <- mean(losses)

#3)

profit <- winnings - losses
summary(profit)

#4)

names(winnings) <- dayNames
winnings
names(losses) <- dayNames
losses

#5)

dayNames[profit > 0]

#6)

avgLossBeginning <- mean(losses[c('Mon', 'Tue')])
avgLossEnd <- mean(losses[c('Thu', 'Fri')])

avgLossBeginning > avgLossEnd

#7) 

# This code relies on the order of the vector. Alternatively, you can use
# The day names as in 6).
sum(profit[1:2]) > sum(profit[4:5])

#8)

pokerData <- data.frame(
  winnins = winnings, 
  losses = losses,
  profit = profit
)
pokerData

#9)

exchangeRate <- c(1.683, 1.679, 1.684, 1.678, 1.655)

pokerData <- within(pokerData, {
  profitBGN <- profit * exchangeRate
})
pokerData

#10)

write.csv(pokerData, file='gambling.csv')

