import coda as C

def visitaBFS(L):
    Coda = []
    current  = 0
    C.enqueue(Coda,0)
    while(not C.isEmpty(Coda)):
        u = C.first(Coda,current)
        Coda, _, current = C.dequeue(Coda,current)
        if u != None:
            L[u][1] = True
            print(f"Visito nodo: {L[u][0]}")

            left = 2*u + 1
            right = 2*u + 2
            
            if right < len(L):
                C.enqueue(Coda,2*u+1)
            if left < len(L):
                C.enqueue(Coda,2*u+2)
    return L

l = [[0, False], [1, False], [2, False], [3, False], [4, False], [5, False], [6, False], [7, False], [8, False]]
visitaBFS(l)