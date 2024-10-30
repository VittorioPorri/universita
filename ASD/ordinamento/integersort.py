def integerSort(l : list, k : int):
    y = [0] * (k+1)

    for i in range(len(l)):
        y[x[i]]+=1
    
    j = 0
    for i in range(k):
        while(y[i] > 0):
            x[j] = i
            j+=1
            y[i]-=1

x = [2,5,6,1,7,8]
integerSort(x, 8)
print(x)
