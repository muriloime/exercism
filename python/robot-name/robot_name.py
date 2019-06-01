import random 
import string 

class Robot(object):
    names = []

    def __init__(self):
        self.reset()

    def reset(self):
        self.name = 2 * random.choice(string.ascii_uppercase) + 3*random.choice(string.digits)
        if self.name not in Robot.names:
            Robot.names.append(self.name)
        else:
            self.reset()
