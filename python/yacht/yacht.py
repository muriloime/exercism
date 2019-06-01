# Category    Score                   Example
# Ones            1 × number of ones      1 1 1 4 5 scores 3
# Twos            2 × number of twos      2 2 3 4 5 scores 4
# Threes          3 × number of threes    3 3 3 3 3 scores 15
# Fours           4 × number of fours     1 2 3 3 5 scores 0
# Fives           5 × number of fives     5 1 5 2 5 scores 15
# Sixes           6 × number of sixes     2 3 4 5 6 scores 6
# Full House      Total of the dice       3 3 3 5 5 scores 19
# Four of a Kind  Total of the four dice  4 4 4 4 6 scores 16
# Little Straight 30 points               1 2 3 4 5 scores 30
# Big Straight    30 points               2 3 4 5 6 scores 30
# Choice          Sum of the dice         2 3 3 4 6 scores 18
# Yacht           50 points               4 4 4 4 4 scores 50

# Score categories
# Change the values as you see fit

from collections import Counter

def same(dice, number): 
  return number * len([die for die in dice if die == number])

def full_house(dice):
  counter = Counter(dice).most_common(2)
  if len(counter) < 2 or not(counter[0][1] == 3 and counter[1][1] == 2):
    return 0
  return sum(dice)

def four_of_a_kind(dice):
  counter = Counter(dice).most_common(1)
  if not(counter[0][1] >= 4):
    return 0
  return 4 * counter[0][0]

def straight(dice, little):
  if len(dice) != len(set(dice)):
    return 0
  if little:
    return 30 * (sorted(dice) == [1,2,3,4,5])
  else:
    return 30 * (sorted(dice) == [2,3,4,5,6])

def yacht(dice):
  return 50 * (min(dice) == max(dice))


YACHT = lambda dice: yacht(dice) 
ONES = lambda dice: same(dice,1) 
TWOS = lambda dice: same(dice,2)
THREES = lambda dice: same(dice,3)
FOURS = lambda dice: same(dice,4)
FIVES = lambda dice: same(dice,5)
SIXES = lambda dice: same(dice,6)
FULL_HOUSE = lambda dice: full_house(dice)
FOUR_OF_A_KIND = lambda dice: four_of_a_kind(dice)
LITTLE_STRAIGHT = lambda dice: straight(dice, True)
BIG_STRAIGHT = lambda dice: straight(dice, False)
CHOICE = lambda dice: sum(dice)


def score(dice, category):
    return category(dice)
