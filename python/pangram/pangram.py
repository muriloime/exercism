from string import ascii_lowercase

def is_pangram(sentence):
    lower = sentence.lower()
    return all( char in lower for char in ascii_lowercase) 
