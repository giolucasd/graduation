def selection_sort(array):
    for i in range(len(array)):
        min_i = i
 
        for j in range(i + 1, len(array)):
            if array[j] < array[min_i]:
                min_i = j
         
        array[i], array[min_i] = array[min_i], array[i]
