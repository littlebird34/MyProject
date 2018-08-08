import string
import math
from sys import argv

def textfile(filename):
    infile = open(filename, 'r')
    while True:
        lines = infile.readlines()
        text = '\t'.join([line.strip() for line in lines])
        text = text.upper()
        if text == '':
            break
        seq = ''
        for ch in text:
            if 'A' <= ch <= 'Z':
                seq += ch
        return seq
    infile.close()

def viterbi(obs, states, start_p, trans_p, emit_p):
    #First columns intial x emission
    V = [{}]
    for st in states:
        V[0][st] = {"prob": start_p[st] * emit_p[st][obs[0]], "prev": None}
    #Find Max probability   
    for t in range(1, len(obs)):
        V.append({})
        for st in states:
            max_tr_prob = max(V[t-1][prev_st]["prob"] * trans_p[prev_st][st] for prev_st in states)
            for prev_st in states:
                if V[t-1][prev_st]["prob"] * trans_p[prev_st][st] == max_tr_prob:
                    max_prob = max_tr_prob * emit_p[st][obs[t]]
                    V[t][st] = {"prob": max_prob, "prev": prev_st}
                    break

##    for line in dptable(V):
##        print line

    #The highest probability
    opt = []
    max_prob = max(value["prob"] for value in V[-1].values())
    previous = None
    for st, data in V[-1].items():
        if data["prob"] == max_prob:
            opt.append(st)
            previous = st
            break
    #Backtrace            
    for t in range(len(V) - 2, -1, -1):
        opt.insert(0, V[t + 1][previous]["prev"])
        previous = V[t + 1][previous]["prev"]
    
    print 'The steps of states are ' + ' '.join(opt) + ' with highest probability of %s' % max_prob

##def dptable(V):
##    #Print a table of steps from dictionary
##    yield " ".join(("%12d" % i) for i in range(len(V)))
##    for state in V[0]:
##        yield "%.7s: " % state + " ".join("%.7s" % ("%f" % v[state]["prob"]) for v in V)


def result():
    return viterbi(observations,
                   states,
                   start_probability,
                   transition_probability,
                   emission_probability)
            
if __name__=='__main__':
    states = ('S1', 'S2', 'S3')
    #myfile = argv[1]
    #observations = textfile(myfile)
    #observations = textfile("test_seq.fasta.txt")
    observations = ("CCTG")
    start_probability = {'S1': 0.3,'S2': 0.2,'S3': 0.5}
    transition_probability = {
    'S1' : {'S1': 0.5,'S2':0,'S3':0.5},
    'S2' : {'S1': 0.25,
            'S2':0.5,'S3':0.25},
    'S3' : {'S1': 0.1,'S2':0.4,'S3':0.5},
    }
    emission_probability = {
    'S1' : {'A': 0.3,'C':0.1,'T':0.4, 'G':0.2},
    'S2' : {'A': 0.1,'C':0.5,'T':0.1, 'G':0.3},
    'S3' : {'A': 0.25,'C':0.25,'T':0.25, 'G':0.25},
    }
    result()
