def SelectionSort(l : list):
    n = len(l)

    for i in range(n-2):
        m = i+1
        for j in range(i+2,n):
            if(l[j] < l[m]):
                m = j
        l[i],l[m] = l[m],l[i]
    return l

x =[7,2,4,5,3,1]
print(SelectionSort(x))


