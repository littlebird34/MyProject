# -*- coding: utf-8 -*-
#Ploypun Narindrarangkura
#Modified from https://en.wikipedia.org/wiki/Viterbi_algorithm

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
    """ The Viterbi Algorithm is a dynamic programming algorithm for
    finding the most likely sequence of hidden states – called the
    Viterbi path – that results in a sequence of observed events,
    especially in the context of Markov information sources and
    hidden Markov models.

    :param obs: observation
    :param states: hidden states
    :param start_p: initial probability
    :param trans_p: transition probability
    :param emit_p: emisssion probability
    :type obs: string
    :type states: string
    :type start_p: dictionary
    :type trans_p: dictionary
    :type emit_p: dictionary

    output is the best path with highest probability
    
    """
    #First columns intial x emission
    V = [{}]
    for st in states:
        if not start_p[st] == 0:
            start_log = math.log(start_p[st])
        else:
            start_log = -999      
        if not emit_p[st][obs[0]] == 0:
            emit_log = math.log(emit_p[st][obs[0]])
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
                else:
                    trans_log = -999
                if not emit_p[st][obs[t]] == 0:
                    emiss_log = math.log(emit_p[st][obs[t]])
                else:
                    emiss_log = -999
                    
                prob_list.append(V[t-1][prev_st]["prob"] + trans_log)
                max_tr_prob = max(prob_list)
                for prev_st in states:
                    if V[t-1][prev_st]["prob"] + trans_log == max_tr_prob:
                        max_prob = max_tr_prob + emiss_log
                        V[t][st] = {"prob": max_prob, "prev": prev_st}
                        break
                    
    opt = []
    max_prob = max(value["prob"] for value in V[-1].values())
    previous = None
    for st, data in V[-1].items():
        if data["prob"] == max_prob:
            opt.append(st)
            previous = st
            break
    for t in range(len(V) - 2, -1, -1):
        opt.insert(0, V[t + 1][previous]["prev"])
        previous = V[t + 1][previous]["prev"]
    
    print 'The steps of states are ' + ' '.join(opt) + ' with highest probability of %s' % max_prob

def result():
    return viterbi(observations, states, start_probability,
                   transition_probability, emission_probability)
            
if __name__=='__main__':
    states = ('S1', 'S2', 'S3')
    myfile = argv[1]
    observations = textfile(myfile)
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
    result()
