def get_unique_list_f(lst):
    
    unique_lst = set(lst)
    list_new = list(unique_lst)
    return list_new

def count_case_f(string):
    upper_count=0
    lower_count=0
    for i in string:
        
        if i.isupper():
            upper_count +=1
            
        elif i.islower():
            lower_count +=1
    
    return (upper_count,lower_count)

import string

def remove_punctuation_f(sentence):
    new_sentence = sentence.translate(str.maketrans("", "", string.punctuation))
    
    return new_sentence

def word_count_f(sentence):
    x = remove_punctuation_f(sentence)
    lily = x.split()
    
    return len(lily)