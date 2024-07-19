
def tabulation(s : str) ->int :
    n =len(s)
    M = [[0]*n for _ in range(n)]
    
    for i in range(n):
        M[i][i] = 1

    for d in range(1,n):
        for i in range(n-d):
            j = i+d
            if s[i] == s[j]:
                M[i][j] = 2 + M[i+1][j-1]
            else:
                M[i][j] = max(M[i+1][j],M[i][j-1])
    
    return M[0][n-1]

# facciamo caching per ottimizzare meglio lo spazio
def memorization(s : str, i : int , j :int , cache : dict = dict()) -> int:
    if (i,j ) in cache:
        return cache [i,j]
    
    if i>j:
        cache[i,j] = 0
    elif i == j:
        cache[i,j] = 1
    else:
        if s[i] == s[j]:
            cache[i,j] = 2 + memorization(s,i+1,j-1,cache)
        else:
           cache[i,j] = max(memorization(s,i+1,j,cache), memorization(s,i,j-1,cache))

    return cache[i,j]

def solution(s : str, i : int , j :int , cache : dict = dict()) -> str:    
    if i>j:
        return ""
    elif i == j:
        return s[i]
    else:
        if s[i] == s[j]:
            return s[i]+ solution(s,i+1,j-1,cache)+ s[j]
        else:
            if cache[i+1,j] > cache[i,j-1]:
                solution(s,i+1,j,cache)
            else:    
                solution(s,i,j-1,cache)




