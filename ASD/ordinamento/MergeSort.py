def Merge(l : list, i : int, m : int, f : int) -> list:
    n = 0
    X = []
    k1 = i
    k2 = m+1
  
    while(k1 <= m and k2 <= f):
        if(l[k1]<l[k2]):
            X.append(l[k1])
            k1+=1
        else:
            X.append(l[k2])
            k2+=1
        n+=1

    if(k1 <= m):
        for j in range(k1,m+1):
            X.append(l[j])
    else:
        for j in range(k2,f+1):
            X.append(l[j])
    

    y = 0
    for j in range(i,f+1):
        l[j] = X[y]
        y+=1

    return l

def MergeSort(l : list, i : int, f : int) -> list:
    if(i < f):
        m = (i+f)//2
        MergeSort(l,i,m)
        MergeSort(l,m+1,f)
        Merge(l,i,m,f)

    return l

x = [7,2,4,5,3,1,8,6]
print(MergeSort(x,0,len(x)-1))

