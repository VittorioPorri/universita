def tabulation(l : list) -> int:
    n = len(l)
    
    opt = [[0]*n for _ in range(n)]

    for d in range(1,n):
        for i in range(n-d):
            j = i+d
            if(d == 1):
                opt[i][j] = l[i]*l[j]
            else:
                opt[i][j] = min(opt[i][j-1] + l[j] * massimo(l,i,j-1),
                                opt[i][j-2] + l[j]*l[j-1] + max(l[j],l[j-1])*massimo(l,i,j-2),
                                opt[i+1][j] + l[i] * massimo(l,i+1,j),
                                opt[i+2][j] + l[i]*l[i+1] + max(l[i],l[i+1])*massimo(l,i+2,j),
                                )

    return opt[0][n-1]

def massimo(l : list, i : int, j : int) -> int :
    m = 0
    for c in range(i,j+1):
        if l[c] > m:
            m =l[c]

    return m

x = [1,5,4,2,7,8]
print(tabulation(x))
