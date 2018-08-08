import string
import math
from sys import argv

##def textfile(filename):
##    infile = open(filename, 'r')
##    while True:
##        lines = infile.readlines()
##        text = '\t'.join([line.strip() for line in lines])
##        text = text.upper()
##        if text == '':
##            break
##        seq = ''
##        for ch in text:
##            if 'A' <= ch <= 'Z':
##                seq += ch
##        return seq
##    infile.close()

def viterbi(obs, states, start_p, trans_p, emit_p):
    #First columns intial x emission
    V = [{}]
    for st in states:
        if not start_p[st] == 0:
            start_log = math.log(start_p[st])
##            start_log = math.log(start_p[st],2)
        else:
            start_log = -999      
        if not emit_p[st][obs[0]] == 0:
            emit_log = math.log(emit_p[st][obs[0]])
##            emit_log = math.log(emit_p[st][obs[0]],2)
        else:
            emit_log = -999
        V[0][st] = {"prob": start_log + emit_log, "prev": None}

    #Find Max probability
    for t in range(1, len(obs)):
        V.append({})
        prob_list = []
        for st in states:
            for prev_st in states:
                if not trans_p[prev_st][st] == 0:
                    trans_log = math.log(trans_p[prev_st][st])
##                    trans_log = math.log(trans_p[prev_st][st],2)
                else:
                    trans_log = -999
                if not emit_p[st][obs[t]] == 0:
                    emiss_log = math.log(emit_p[st][obs[t]])
##                    emiss_log = math.log(emit_p[st][obs[t]],2)
                else:
                    emiss_log = -999
                    
                prob_list.append(V[t-1][prev_st]["prob"] + trans_log)
                max_tr_prob = max(prob_list)
                for prev_st in states:
                    if V[t-1][prev_st]["prob"] + trans_log == max_tr_prob:
                        max_prob = max_tr_prob + emiss_log
                        V[t][st] = {"prob": max_prob, "prev": prev_st}
                        break
    for st in states:
        for i in range(len(V)):
            max_value = max(value["prob"] for value in V[i].values())
            if V[i].values() == max_value:
                print V[i][st]["prev"]
    
    for line in dptable(V):
        print line

    opt = []
    max_prob = max(value["prob"] for value in V[-1].values()) 
    previous = None
    
    #Backtrace
    for st, data in V[-1].items():
        if data["prob"] == max_prob:
            opt.append(st)
            previous = st
            break
    print previous
    for t in range(len(V) - 2, -1, -1):
        opt.insert(0, V[t + 1][previous]["prev"])
        previous = V[t + 1][previous]["prev"]

    print 'The steps of states are ' + ' '.join(opt) + ' with highest probability of %s' % max_prob

def dptable(V):
    #Print a table of steps from dictionary
    yield " ".join(("%12d" % i) for i in range(len(V)))
    for state in V[0]:
        yield "%.7s: " % state + " ".join("%.7s" % ("%f" % v[state]["prob"]) for v in V)


def result():
    return viterbi(observations,
                   states,
                   start_probability,
                   transition_probability,
                   emission_probability)
            
if __name__=='__main__':
    states = ('S1', 'S2', 'S3')
##    myfile = argv[1]
##    observations = textfile(myfile)
##    observations = textfile("test_seq.fasta.txt")
    observations = "CAATGATTAA"
    start_probability = {'S1': 0.3,'S2': 0.2,'S3': 0.5}
    transition_probability = {
    'S1' : {'S1': 0.5,'S2':0,'S3':0.5},
    'S2' : {'S1': 0.25,'S2':0.5,'S3':0.25},
    'S3' : {'S1': 0.1,'S2':0.4,'S3':0.5},
    }
    emission_probability = {
    'S1' : {'A': 0.3,'C':0.1,'T':0.4, 'G':0.2},
    'S2' : {'A': 0.1,'C':0.5,'T':0.1, 'G':0.3},
    'S3' : {'A': 0.25,'C':0.25,'T':0.25, 'G':0.25},
    }

##    start_probability = {'S1': 0.25,'S2': 0.5,'S3': 0.25}
##    transition_probability = {
##    'S1' : {'S1': 0.25,'S2':0.5,'S3':0.25},
##    'S2' : {'S1': 0.25,'S2':0.25,'S3':0.5},
##    'S3' : {'S1': 0.5,'S2':0.5,'S3':0},
##    }
##    emission_probability = {
##    'S1' : {'A': 1,'C':0,'T':0, 'G':0},
##    'S2' : {'A': 0.25,'C':0.5,'T':0, 'G':0.25},
##    'S3' : {'A': 0.25,'C':0.25,'T':0.25, 'G':0.25},
##    }
    result()


