#Ploypun Narindrarangkura

#1
# NB: You may NOT use the repetition operator (*): code this yourself.
def repeatList(lst, n):
    """
    Returns a new list that is equivalent to lst * n, where * is
    the repetition operator. Assumes n is a positive integer.
    Examples:
    >>> repeatList([1,2,3], 0)
    []
    >>> repeatList([1,2,3], 1)
    [1, 2, 3]
    >>> repeatList([1,2,3], 2)
    [1, 2, 3, 1, 2, 3]
    >>> repeatList([1,2,3], 3)
    [1, 2, 3, 1, 2, 3, 1, 2, 3]
    >>> repeatList([1,2,3,4,5,6,7,8,9,10], 2)
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> repeatList([1,2,3,4], 5)
    [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
    >>> repeatList([], 5)
    []
    >>> repeatList([], 0)
    []
    """
    new_lst = []
    i = 0
    while i < n:
        new_lst += lst
        i +=1
    return new_lst

#2
def replace(lst, pos, item):
    """
    Modifies list lst so that its element at pos is replaced with item.
    Does not modify lst if pos is negative or pos >= length of lst.
    Assumes n is an integer.
    Nothing is returned.
    Examples:
    >>> mylist = [1,2,3]
    >>> replace(mylist, 2, 'z')
    >>> mylist
    [1, 2, 'z']
    >>> mylist = [6,1,4,2,3]
    >>> replace(mylist, 5, 'z')
    >>> mylist
    [6, 1, 4, 2, 3]
    >>> mylist = [6,1,4,2,3]
    >>> replace(mylist, -1, 'z')
    >>> mylist
    [6, 1, 4, 2, 3]
    >>> mylist = ['apple', 'banana', 'cherry']
    >>> replace(mylist, 0, 'pineapple')
    >>> mylist
    ['pineapple', 'banana', 'cherry']
    >>> mylist = ['apple', 'banana', 'cherry', 'strawberry']
    >>> replace(mylist, 4, 'pineapple')
    >>> mylist
    ['apple', 'banana', 'cherry', 'strawberry']
    >>> replace(mylist, -1, 'pineapple')
    >>> mylist
    ['apple', 'banana', 'cherry', 'strawberry']
    >>> mylist = [[1,2,3], [1], [2], [3]]
    >>> replace(mylist, 1, [4])
    >>> mylist
    [[1, 2, 3], [4], [2], [3]]
    >>> mylist = [[1,2,3], [1], [2], [3]]
    >>> replace(mylist, 3, [4])
    >>> mylist
    [[1, 2, 3], [1], [2], [4]]
    >>> mylist = [[1,2,3], [1], [2], [3]]
    >>> replace(mylist, 3, [4])
    >>> mylist
    [[1, 2, 3], [1], [2], [4]]
    >>> mylist = [[1,2,3], [1], [2], [3]]
    >>> replace(mylist, -2, [4])
    >>> mylist
    [[1, 2, 3], [1], [2], [3]]
    """
    if 0 <= pos < len(lst):
        lst[pos] = item
        
#3
def countElem(lst, elem):
    """
    Returns the number of occurrences of element elem in list lst
    Examples:
    >>> countElem(['w', 'owl', 'w', 'awesome'], 'w')
    2
    >>> countElem(['w', 'w', 'w', 'awesome'], 'w')
    3
    >>> countElem(['w', 'w', 'w', 'w'], 'w')
    4
    >>> countElem(['a', 'b', 'ww', 'w'], 'w')
    1
    >>> countElem(['ww', 'ww', 'ww', 'ww'], 'w')
    0
    >>> countElem(['abc', 'abab', 'ab', 'baba'], 'ab')
    1
    >>> countElem(['awkward', 'ok', 'k', 'k', 'supperk', 'K'], 'k')
    2
    >>> countElem([1, 1, 1, 2, 7, 4], 1)
    3
    >>> countElem([1, 1, 1, 2, 7, 4], 5)
    0
    >>> countElem([1, 1, 1, 2, 7, 4], 7)
    1
    >>> countElem([[1], [1,2], [1], [2], ['a','b','c'], 4], [1])
    2
    >>> countElem([[1], [1,2], [1], [2], ['a','b','c'], 4], ['a'])
    0
    >>> countElem([[1], [1,2], [1], [2], ['a','b','c'], 4], 4)
    1
    """
    i = 0
    count = 0
    for x in lst:
        if x == elem:
            count = count + 1
        i += 1
    return count

#4
def findLast(lst, elem) :
    """
    Returns the index of the last occurrence of element elem in list
    lst or -1 if elem does not occur in lst.
    Examples:
    >>> findLast(['w', 'owl', 'w', 'awesome'], 'w')
    2
    >>> findLast(['w', 'w', 'owl', 'awesome'], 'w')
    1
    >>> findLast(['w', 'owl', 'w', 'w'], 'w')
    3
    >>> findLast(['w', 'owl', 'w', 'w'], 'a')
    -1
    >>> findLast(['w', 'w', 'w', 'w'], 'w')
    3
    >>> findLast(['a', 'b', 'ww', 'w'], 'w')
    3
    >>> findLast(['ww', 'ww', 'ww', 'ww'], 'w')
    -1
    >>> findLast(['abc', 'abab', 'ab', 'baba'], 'ab')
    2
    >>> findLast(['awkward', 'ok', 'k', 'k', 'supperk', 'K'], 'k')
    3
    >>> findLast([1, 1, 1, 2, 7, 4], 1)
    2
    >>> findLast([1, 1, 1, 2, 7, 4], 5)
    -1
    >>> findLast([1, 1, 1, 2, 7, 4], 7)
    4
    >>> findLast([[1], [1,2], [1], [2], ['a','b','c'], 4], [1])
    2
    >>> findLast([[1], [1,2], [1], [2], ['a','b','c'], 4], ['a'])
    -1
    >>> findLast([[1], [1,2], [1], [2], ['a','b','c'], 4], 4)
    5
    """
    i = 0
    new_lst = []
    while i < len(lst):
        if lst[i] == elem:
            new_lst += [i]
        else:
            new_lst = new_lst
        i += 1
    if new_lst != []:
        return new_lst[-1]
    else:
        return -1

#5
# NB: You may not use built-in typecasting: code this yourself.
def string2list(s):
    """
    Returns a list whose elements are each of the characters in string s
    as ordered in s
    Examples:
    >>> string2list ('cat')
    ['c', 'a', 't']
    >>> string2list ('horse')
    ['h', 'o', 'r', 's', 'e']
    >>> string2list ('1234567890')
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    >>> string2list ('applepinepineapple')
    ['a', 'p', 'p', 'l', 'e', 'p', 'i', 'n', 'e', 'p', 'i', 'n', 'e', 'a', 'p', 'p', 'l', 'e']
    >>> string2list ('nokie')
    ['n', 'o', 'k', 'i', 'e']
    >>> string2list ('python')
    ['p', 'y', 't', 'h', 'o', 'n']
    >>> string2list ('stimulation')
    ['s', 't', 'i', 'm', 'u', 'l', 'a', 't', 'i', 'o', 'n']
    >>> string2list ('abcd1234efgh')
    ['a', 'b', 'c', 'd', '1', '2', '3', '4', 'e', 'f', 'g', 'h']
    """
    i = 0
    new_lst = []
    while i < len(s):
        new_lst += [s[i]]
        i += 1
    return new_lst

#6
def lastOccurMostFreqElem(lst):
    """
    Returns the index of the last occurence of the element that most frequently occurs
    in list lst or -1 if lst is empty. If elements occur with equal frequency,
    returns index of the last of these.
    Examples:
    >>> lastOccurMostFreqElem([0,0,2,2,0,2])
    5
    >>> lastOccurMostFreqElem([3,2,2,3])
    3
    >>> lastOccurMostFreqElem([])
    -1
    >>> lastOccurMostFreqElem([0,0,2,2,0,2])
    5
    >>> lastOccurMostFreqElem([3,2,2,3])
    3
    >>> lastOccurMostFreqElem([2,2,2,3,3])
    2
    >>> lastOccurMostFreqElem([2,2,3,3,2])
    4
    >>> lastOccurMostFreqElem([2,2,3,3,2,4])
    4
    >>> lastOccurMostFreqElem([2,1,3,3,1,2,4,5])
    5
    >>> lastOccurMostFreqElem([1,1,3,3,2,2,4,4,5,1])
    9
    >>> lastOccurMostFreqElem([6,6,6,2,2,2,4,4,4,1,1,1])
    11
    """
    result = 0
    result2 = 0
    if lst != []:
        for i in range(len(lst)):
            count = 0
            for elem in lst:
                if elem == lst[i]:
                    count += 1
            if count >= result2:
                result = i
                result2 = count
        return result
    else:
        return -1

#7
# NB: You may not use built-in slices: code this yourself.
def insert(s1, s2, pos):
    """
    Returns a new string that is equivalent to string s1 with string s2
    inserted at index pos. Returns empty string if pos is negative or
    pos > length of s1. Assumes n is an integer.
    Examples:
    >>> insert('', 'world!', 0)
    'world!'
    >>> insert('world', 's', 1)
    'wsorld'
    >>> insert('world', 's', 2)
    'wosrld'
    >>> insert('world', 's', 3)
    'worsld'
    >>> insert('world', 's', 4)
    'worlsd'
    >>> insert('world', 's', 5)
    'worlds'
    >>> insert('world', 's', 6)
    ''
    >>> insert('world', '', 3)
    'world'
    >>> insert('sentence', 'x', -1)
    ''
    >>> insert('sentence', 'x', 0)
    'xsentence'
    >>> insert('sentence', 'x', 1)
    'sxentence'
    >>> insert('sentence', 'x', 7)
    'sentencxe'
    >>> insert('sentence', 'x', 8)
    'sentencex'
    """
    new_s = ""
    if 0 < pos < len(s1):
        for i in range(len(s1)):
            if i != pos:
                new_s += s1[i]
            elif i == pos:
                new_s += s2 + s1[i]
        return new_s
    elif pos == 0:
        new_s = s2 + s1
        return new_s
    elif pos == len(s1):
        new_s = s1 + s2
        return new_s
    else:
        return new_s

#8
# NB: You may not use built-in slices: code this yourself.   
def substring(s, pos1, pos2):
    """
    Returns a new string consisting of the characters of string s from pos1 to
    pos2-1 inclusive. Returns the empty string if there is no valid substring
    beginning at pos1 and ending at pos2-1.Assumes both pos1 and pos2 are
    integers.
    Examples:
    >>> substring('cat', 1, 3)
    'at'
    >>> substring('happy', 1, 3)
    'ap'
    >>> substring('hopeful', 3, 6)
    'efu'
    >>> substring('hopeful', 0, 9)
    ''
    >>> substring('ridiculous', 1, 6)
    'idicu'
    >>> substring('ridiculous', 0, 5)
    'ridic'
    >>> substring('ridiculous', 0, 10)
    'ridiculous'
    >>> substring('ridiculous', 0, 11)
    ''
    """
    sub_s = ""
    i = 0
    while i < len(s):
        if pos1 >= 0 and pos2 <= len(s):
            if pos1 <= i <= (pos2-1):
                sub_s += s[i]
        elif pos1 < 0 or pos2 > len(s):
            return sub_s
        i += 1
    return sub_s

#9
# NB: You may not use built-in typecasting: code this yourself.
def str2int(s):
    """
    Returns an integer that is the integer equivalent of the string s.
    Assumes that s is the string version of a valid integer.
    Examples:
    >>> str2int('-1000092')
    -1000092
    >>> str2int('1000092')
    1000092
    >>> str2int('0003801')
    3801
    >>> str2int('-0003801')
    -3801
    >>> str2int('12345678')
    12345678
    >>> str2int('-12345678')
    -12345678
    >>> str2int('1000000')
    1000000
    >>> str2int('-1000000')
    -1000000
    >>> str2int('0987654321')
    987654321
    >>> str2int('-0987654321')
    -987654321
    """
    if s[0] == '-':
        sign = -1
        i = 1
    else:
        sign = 1
        i = 0
    result = 0
    while i < len(s):
        num = ord(s[i]) - ord('0')
        result = result * 10 + num
        i += 1
    return sign * result
    
#10
# NB: You may not use built-in str() or string template. Code this yourself.
def int2str(i):
    """
    Returns a string that is the string equivalent of valid integer i
    Examples:
    >>> int2str(-1000092)
    '-1000092'
    >>> int2str(1000092)
    '1000092'
    >>> int2str(1234)
    '1234'
    >>> int2str(-1234)
    '-1234'
    >>> int2str(1000092)
    '1000092'
    >>> int2str(-1000092)
    '-1000092'
    >>> int2str(3800000)
    '3800000'
    >>> int2str(-3800000)
    '-3800000'
    """
    strng = ''
    result = ''
    if i < 0:
        result = '-'
        i = -i
    while i != 0:
        num = i % 10
        strng = chr(ord('0') + num) + strng
        i = i / 10
    strng = result + strng
    return strng

if __name__ == '__main__':
    import doctest
    doctest.testmod()
