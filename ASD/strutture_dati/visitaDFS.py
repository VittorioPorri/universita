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

def visitaBFS_ricorsiva(L, i):
    if i < len(L):
        L[i][1] = True
        print(f"Visito nodo : {L[i][0]}")

        left = 2*i+ 1
        right = 2*i + 2
        
        if left < len(L):
            visitaBFS_ricorsiva(L, left)
        if right < len(L):
            visitaBFS_ricorsiva(L, right)
a = [[0, False], [1, False], [2, False], [3, False], [4, False], [5, False], [6, False], [7, False], [8, False]]
b = [[0, False], [1, False], [2, False], [3, False], [4, False], [5, False], [6, False], [7, False], [8, False]]

print("Visita DFS implementata con pila: ")
visitaBFS(a)
print("\nVisita DFS implementata con ricorsione: ")
visitaBFS_ricorsiva(b,0)

