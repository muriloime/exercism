# Game status categories
# Change the values as you see fit
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"
INITIAL_GUESSES = 9
PLACEHOLDER_CHAR = '_'

class Hangman(object):
    def __init__(self, word):
        self.word = word
        self.guesses = []
        self.remaining_guesses = INITIAL_GUESSES

    def guess(self, char):
        if self.get_status() == STATUS_ONGOING:
            if not self.correct(char) or self.used(char):
                self.remaining_guesses -= 1
            self.guesses.append(char)
        else:
            raise ValueError(".+")


    def correct(self, char):
        return char in self.word

    def used(self, char):
        return char in self.guesses

    def get_masked_word(self):
        return ''.join([ char if self.used(char) else PLACEHOLDER_CHAR for char in self.word] )

    def get_status(self):
        if PLACEHOLDER_CHAR not in self.get_masked_word():
            return STATUS_WIN
        if self.remaining_guesses >= 0:
            return STATUS_ONGOING
        else:
            return STATUS_LOSE

