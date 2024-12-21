def isEmpty(C):
    return len(C) == 0

def enqueue(C, elem):
    C.append(elem)

def dequeue(C, current):
    if isEmpty(C):
        return None, current
    
    e = C[current]
    C[current] = None
    current+=1

    if current > len(C)/2:
        new_C = []
        for i in range(current,len(C)):
            new_C.append(C[i])
        C = new_C
        current = 0
    
    return C, e, current

def first(C, current):
    if isEmpty(C):
        return None
        
    return C[current]

#C = []
#current = 0
#
#print(f"La coda è vuota -> {isEmpty(C)}")
#for i in range(10):
#    len_P = enqueue(C,i)
#
#print(f"Coda dopo gli inserimento -> {C}")
#print(f"La coda è vuota -> {isEmpty(C)}")
#
#for i in range(7):
#    C, e, current = dequeue(C, current)
#    print(f"Ho eliminato l'elemento -> {e}") 
#
#print(f"Coda dopo le cancellazione -> {C}")
#
#enqueue(C,10)
#print(f"Coda dopo l'ultimo inserimento -> {C}")
#
#print(f"L'elemento in cima è -> {first(C,current)}")


