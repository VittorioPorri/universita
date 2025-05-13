def mergeSort(l : list, i : int, f : int) -> None:
   if i < f:
    m = (i+f)//2

    mergeSort(l,i,m)
    mergeSort(l,m+1,f)
    merge(l,i,m,m+1,f)

def merge(l : list, i1 : int, f1 : int, i2 : int, f2 : int) :
    x = [0]*(f2-i1+1)
    h = 0

    i = i1
    j = i2

    while i <= f1 and j <= f2:
        if l[i] < l[j]:
            x[h] = l[i]
            i+=1
        else:
            x[h] = l[j]
            j+=1
        h+=1

    if i<=f1:
        for c in range(i,f1+1):
            x[h] = l[c]
            h+=1

    elif j<=f2:
        for c in range(j,f2+1):
            x[h] = l[c]
            h+=1
    
    h = 0
    for c in range(i1,f2+1):
        l[c] = x[h]
        h+=1


x =[2,5,6,1,7,8]
mergeSort(x,0,len(x)-1)
print(x)
