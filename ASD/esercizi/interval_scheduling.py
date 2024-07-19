def interval_scheduling(x : list) -> list:
    n = len(x)
    sort_x = sort(x,n)
    solution = []
    j = 0

    solution.append(sort_x[0])

    for i in range(1,n):
        if sort_x[i][0] >= solution[j][1]:  
            solution.append(sort_x[i])
            j+=1
           
    return solution 

def sort(x : list, n : int ) -> list:
    j = 0

    while j < n:
        for i in range(n-1):
            if x[i][1] > x[i+1][1]:
                x[i],x[i+1] = x[i+1],x[i]
        j+=1
    return x

a = [[0,6],[1,4],[3,5],[3,8],[4,7],[5,9],[6,10],[8,11]]
print(interval_scheduling(a))

