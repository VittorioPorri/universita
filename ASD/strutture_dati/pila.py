def isEmpty(P,len_P):
    return len_P == 0

def push(P, len_P, elem):
    if len_P < len(P):
        P[len_P] = elem        
    else:
        P.append(elem)
    len_P += 1    
    return len_P

def pop(P, len_P):
    if isEmpty(P,len_P):
        return None, len_P

    e = P[len_P - 1]
    P[len_P - 1] = None
    len_P -= 1

    if len_P < len(P)/2:
            new_P  = []
            for i in range(len_P):
                new_P.append(P[i])
            P = new_P

    return P, e , len_P

def top(P, len_P):
    if isEmpty(P,len_P):
        return None
    
    return P[len_P - 1]

P  = []
len_P = len(P)
print(f"La lista è vuota -> {isEmpty(P, len_P)}")
for i in range(10):
    len_P = push(P, len_P, i)

print(f"Lista dopo gli inserimento -> {P}")
print(f"La lista è vuota -> {isEmpty(P, len_P)}")

for i in range(7):
    P, e, len_P = pop(P,len_P)
    print(f"Ho eliminato l'elemento -> {e}") 

print(f"Lista dopo le cancellazione -> {P}")

push(P, len_P, 10)
print(f"Lista dopo l'ultimo inserimento -> {P}")

print(f"L'elemento in cima è -> {top(P,len_P)}")
