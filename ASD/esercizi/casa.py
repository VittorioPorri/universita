price = [
            [7,3,16],  #casa 1
            [99,5,99],  #casa 2 
            [7,2,99],   #casa 3 
            [2,22,4],  #casa 4
            [9,12,5],  #casa 5
            [20,8,7]  #casa 6
        ]

def best_solution(l):
    opt = []

    #soluzione ottimale per la prima cella
    value = l[0][0] 
    color = "rosso"
    sum = l[0][0] + l[1][1]  
    for i in range(3):
        new_value = l[0][i]  
        for j in range(3):
            new_sum = l[0][i] + l[1][j] 
            if i != j and new_sum < sum:
                value = new_value
                sum = new_sum
                if i == 0:
                    color = "rosso"
                elif i == 1:
                    color = "verde"
                else:
                    color = "blu"
        
    opt.append([value,color])

    #soluzione ottimale per le case da 1 a j
    for i in range(1,len(l)):
        min_1 = [l[i][0],"rosso"]
        min_2 = [l[i][1],"verde"]
        if min_1[0] > min_2[0]:
            min_1, min_2 = min_2, min_1

        
        new_value = l[i][2]
        if new_value < min_1[0]:
            min_2 = min_1
            if j == 0:
                color = "rosso"
            elif j == 1:
                    color = "verde"
            else:
                    color = "blu"
            min_1 = [l[i][2],color]
        elif new_value < min_2[0]:
            if j == 0:
                color = "rosso"
            elif j == 1:
                color = "verde"
            else:
                color = "blu"
            min_2 = [l[i][2],color]

        if(min_1[1] != opt[i-1][1]):
            opt.append(min_1)
        else:
            opt.append(min_2)
    return opt

print(best_solution(price))

