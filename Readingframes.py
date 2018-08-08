import string
from sys import argv
infile = open('seq.fasta.txt', 'r')
while True:
    lines = infile.readlines()
    text = '\t'.join([line.strip() for line in lines]) 
    text = text.upper()
    if text == '':
        break
    seq = ""
    for ch in text:
        if 'A' <= ch <= 'Z':
            seq += ch
           
gencode = {
      'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
      'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
      'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
      'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
      'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
      'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
      'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
      'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
      'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
      'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
      'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
      'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
      'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
      'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
      'TAC':'Y', 'TAT':'Y', 'TAA':'-', 'TAG':'-',
      'TGC':'C', 'TGT':'C', 'TGA':'-', 'TGG':'W'}

basepairs = {'A':'T', 'C':'G', 'G':'C', 'T':'A'}

def translate(sequence):
    translate = ''
    for i in range(0,len(sequence)-(len(sequence)%3),3):
        translate += gencode.get(sequence[i:i+3])
    return translate

def translate_in_frame(sequence, framenum):
    return translate(sequence[framenum-1:])

def print_translate_in_frame(sequence, framenum, prefix):
    print prefix, framenum, ' ' * framenum, translate_in_frame(sequence, framenum)

def print_translate(sequence,prefix=''):
    for framenum in range(1,4):
        print_translate_in_frame(sequence, framenum, prefix)

def reverse_dna(sequence):
    re_seq = (sequence[::-1])
    re_seq = ''.join([basepairs.get(re_seq[i], 'X') for i in range(len(re_seq))])
    return re_seq
        
print_translate(seq) #5'3' 
print_translate(reverse_dna(seq)) #3'5'

infile.close()
