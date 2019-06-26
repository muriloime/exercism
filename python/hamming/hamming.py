def distance(strand_a, strand_b):
  if len(strand_a) != len(strand_b):
    raise ValueError("Strands should have equal size") 
  return ( len( [1 for codon_a, codon_b in  zip(strand_a, strand_b)  if codon_a != codon_b] )   )
