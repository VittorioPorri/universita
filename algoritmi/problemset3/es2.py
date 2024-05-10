def tabulation(M : list) -> int:
    n = len(M[0])+2
    opt = [[0]*n for _ in range(5)]

    for j in range(len(M[0])-1,-1, -1):
        opt[0][j] = M[0][j]+ max(opt[1][j+1],opt[2][j+1],opt[4][j+2])
        opt[1][j] = M[1][j]+ max(opt[0][j+1],opt[2][j+1],opt[3][j+1],opt[4][j+2]) 
        opt[2][j] = M[2][j]+ max(opt[0][j+1],opt[1][j+1],opt[4][j+2]) 
        opt[3][j] = M[0][j] + M[2][j] + max(opt[1][j+1],opt[4][j+2])
        opt[4][j] = max(opt[0][j],opt[1][j],opt[2][j],opt[3][j])

    return opt

M = [
        [3,10,10,15,6,5,30,2,1],
        [7,2,10,1,1,2,1,3,1000],
        [1,5,8,12,30,6,30,4,1],
    ]

M1 = [
        [100,1,1,1],
        [1,10,100,100],
        [10,100,1,1]
    ]
print(tabulation(M))


