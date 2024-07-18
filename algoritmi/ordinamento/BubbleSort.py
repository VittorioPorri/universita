def BubbleSort(l : list)-> list:
    n = len(l)

    for i in range(n-1):
        for j in range(n-1):
            if(l[j]>l[j+1]):
                l[j],l[j+1] =l[j+1],l[j]

    return l

x = [7,2,4,5,3,1]
print(BubbleSort(x))
