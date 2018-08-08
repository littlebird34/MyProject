#Ploypun Narindrarangkura

#Huntington’s disease is a genetic disorder that leads to degeneration of brain cells.
#In the mutant form of HTT that causes Huntington’s disease there are too many repeats
#of the codon CAG. This project will analyze DNA sequence from patients by counting
#repeats of CAG and interpret results of classification and disease status.
#This is a simple program for give results of DNA analysis to counselor in one visit.

def get_input():
    """
    This function is get input data from user.
    parameter: empty, makes user enters the data 
    return string n = first name, s = surname, dna = DNA sequence
    """
    n = raw_input("Please enter patient first name:")   
    s = raw_input("Please enter patient last name:")
    dna = raw_input("Please enter DNA sequence:")
    return n, s, dna                                    

def countCAG(dna):                                      
    """
    This fuction is for counting a number of "CAG" repeats and stop counting if DNA sequence
    is interupted with other sequences.
    parameter: dna (DNA sequence, type string)
    return: the number of CAG repeats
    Place your function description here.
    Examples:
    >>> countCAG("C")
    0
    >>> countCAG("CAGCA")
    1
    >>> countCAG("CAGCATCAGCAGCAG")
    1
    >>> countCAG("CAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCA")
    41
    """
    count = 0
    i = 0
    while i < len(dna):                                 
        if dna[i:i+3] == 'CAG':                         
            count = count + 1
        else:
            return count
        i += 3
    return count

def prediction(numCAG):                                 
    """
    This function is prediction result of DNA analysis by classification and disease status.
    Parameter: A number of CAG repeats
    Return: Classification and disease status by categories of number of CAG repeats
    Place your function description here.
    Examples:
    >>> prediction(27)
    ('Normal', 'Unaffected')
    >>> prediction(35)
    ('Intermediate', 'Unaffected')
    >>> prediction(42)
    ('Reduced Penetrance', 'Somewhat Affected')
    >>> prediction(45)
    ('Full Penetrance', 'Affected')
    """
    if numCAG < 28:
        return "Normal", "Unaffected"
    elif numCAG >= 28 and numCAG <= 36:
        return "Intermediate", "Unaffected"
    elif numCAG >= 37 and numCAG <= 42:
        return "Reduced Penetrance", "Somewhat Affected"
    else:
        return "Full Penetrance", "Affected"
    
(n, s, dna) = get_input()
DNA = dna
numCAG = countCAG(DNA)
print "First name is", str(n) + "."
print "Last name is", str(s) + "."
print "DNA sequence is", str(dna) 
print "The number of CAG repeats is", str(countCAG(DNA)) + "."
print "Classification is", str(prediction(countCAG(DNA))[0]) + "."
print "Disease status is", str(prediction(countCAG(DNA))[1]) + "."
                
if __name__ == '__main__':
    import doctest
    doctest.testmod()
    
