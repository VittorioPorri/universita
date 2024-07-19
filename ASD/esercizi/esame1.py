def esame1 (l : list ) ->int:
    
    n = len(l)
    Opt = [[0]*n for _ in range(n)]
    
    for d in range(n):
        for i in range(n-d):
            j = i+d
            
            if(j-i == 0):
                Opt[i][j] = l[i]
            elif(j-i == 1 or j-i == 2):
                Opt[i][j] = max(l[i],l[j])
            else:
                Opt[i][j] = max(l[i]+Opt[i+2][j-1],l[j]+Opt[i+1][j-2])

    return Opt[0][n-1]

x = [2,4,1,2,5,6,7]
print(esame1(x))
