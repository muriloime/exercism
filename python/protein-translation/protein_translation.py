CODON_DICT = {'AUG' :	'Methionine',
              'UUU' : 'Phenylalanine',
              'UUC' : 'Phenylalanine',
              'UUA' : 'Leucine', 
              'UUG' : 'Leucine',
              'UCU' : 'Serine', 
              'UCC' : 'Serine',
              'UCA' : 'Serine',
              'UCG' : 'Serine',
              'UAU' : 'Tyrosine',
              'UAC' : 'Tyrosine',
              'UGU' : 'Cysteine',
              'UGC' : 'Cysteine',
              'UGG'	: 'Tryptophan',
              'UAA' :	'STOP', 
              'UAG' :	'STOP',
              'UGA' :	'STOP'} 

def proteins(strand):
    codons = [strand[k:k+3] for k in range(0, len(strand), 3)]
    translation = [CODON_DICT[codon] for codon in codons]
    try: 
      end = translation.index('STOP')
    except ValueError:
      end = None
    return translation[:end]
    
