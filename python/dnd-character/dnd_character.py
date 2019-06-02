import random
import math

def modifier(constitution):
    return math.floor((constitution - 10)/2)

class Character:
    def __init__(self):
         self.strength = self.ability()
         self.dexterity = self.ability()
         self.constitution = self.ability()
         self.intelligence = self.ability()
         self.wisdom = self.ability()
         self.charisma = self.ability()
         self.hitpoints = 10 + modifier(self.constitution)

    def ability(self):
        dice = [random.choice(range(1,7)) for _ in range(4) ]
        dice = sorted(dice)[1:]
        return sum(dice)
