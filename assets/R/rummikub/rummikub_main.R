# rummikub_main.R
# rules :https://tesera.ru/images/items/784463/Rummikub_Rules.pdf
# -------------------------------------------------------------
# What are the chances of going out first go in Rummikub?
# https://boardgames.stackexchange.com/questions/58589/what-are-the-chances-of-going-out-first-go-in-rummikub
# Generate a random set of numbers with replacement
# -------------------------------------------------------------
library(dplyr)
# -------------------------------------------------------------
n <- 14  # Set the size of the random set
population <- c(0:52, 0:52)  # Set the range of numbers 1:13 * 4 + 2 jokers
random_set <- sample(population, size = n, replace = FALSE)
# -------------------------------------------------------------
# Print the result
# print(random_set)
# -------------------------------------------------------------
numbers <- (random_set %% 13) + 1
# print(numbers)
color <- floor(random_set / 13) + 1
# print(color)
# -------------------------------------------------------------
# set 0 = joker ==============
# -------------------------------------------------------------
setti <- data.frame(number = numbers, color = color, r = random_set)
setti$number[setti$r == 52] <- 0 # joker
setti$color[setti$r == 52] <- 0  # joker
print((setti))
# -------------------------------------------------------------

# -------------------------------------------------------------
setti2 <- setti %>% dplyr::arrange(number, color)
print((setti2))
# -------------------------------------------------------------
# A group is a set of either three or four tiles of the
# same number in different colors.
# A run is a set of three or more consecutive numbers,
# all in the same color. The number 1 is always played
# as the lowest number; it cannot follow the number 13
# -------------------------------------------------------------
# Check if any number-color combination has more than 3 occurrences
df <- setti2
ta1 <- base::table(df$number, df$color)
print(ta1)

# Calculate row sums
row_sums <- rowSums(ta1)

r2 <- data.frame(row_sums)
r2$row_sums[r2$row_sums<3] <- 0 
r2$group <- r2$row_sums * as.numeric(rownames(r2))

print(r2)

print(sum(r2$group))






