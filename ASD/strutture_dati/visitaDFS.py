import pila as P

def visitaBFS(L):
    Pila = []
    len_P = 0
    len_P = P.push(Pila,len_P,0)
    while(not P.isEmpty(Pila,len_P)):
        u = P.top(Pila, len_P)
        Pila, _, len_P = P.pop(Pila,len_P)
        if u != None:
            L[u][1] = True
            print(f"Visito nodo: {L[u][0]}")

            left = 2*u + 1
            right = 2*u + 2
            
            if left < len(L):
                len_P = P.push(Pila,len_P,2*u+2)
            if right < len(L):
                len_P = P.push(Pila,len_P,2*u+1)
    return L

def visitaBFS_ricorsiva():
    ...


l = [[0, False], [1, False], [2, False], [3, False], [4, False], [5, False], [6, False], [7, False], [8, False]]
visitaBFS(l)

