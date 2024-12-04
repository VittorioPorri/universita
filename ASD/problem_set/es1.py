def bilanciamento(A : list) -> int:
    aperte = 0
    chiuse = 0

    for i in A:
        if i == '(':
            aperte += 1
        else:
            if aperte > 0:
                aperte -= 1
            else:
                chiuse += 1
    
    if aperte == chiuse:
        return chiuse
    else:
        return -1

x = ')())()(('
print(bilanciamento(x))