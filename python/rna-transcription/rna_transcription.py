RNA_MAPPING =   {'G' : 'C',
                'C' : 'G',
                'T' : 'A',
                'A' : 'U'}

def to_rna(dna_strand):
  return ''.join([ RNA_MAPPING[nucleotide]  for nucleotide in dna_strand])
