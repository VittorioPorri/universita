def InsertionSort(l:list)->list:
    n = len(l)

    for i in range(1,n):
        m = i
        for j in range(i-1,-1,-1):
            if(l[m]<l[j]):
                l[j],l[m] = l[m],l[j]
                m = m-1
                
    return l
x = [7,2,4,5,3,1]
print(InsertionSort(x))
