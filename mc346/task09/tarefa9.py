# Giovanne RA173317
# Paradigmas de Programacao
# Tarefa 9

def most_frequent_element(list_):
    """
    Found the most frequent element in the given list.

    In case of tie, returns the first.
    """
    return max(set(list_), key=list_.count)
