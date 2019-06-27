def anagram(candidate, word):
  candidate = candidate.lower() 
  word = word.lower()
  return candidate != word and sorted(candidate) == sorted(word)

def find_anagrams(word, candidates):
  return( [candidate for candidate in candidates if anagram(candidate, word) ] ) 
