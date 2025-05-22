class Nodo:
    def __init__(self, valore):
        self.valore = valore
        self.figli = []
    
    def child_append(self, node, peso):
        self.figli.append([node,peso])

        
def treeCutBetter(nodo : Nodo, W : int, count : int):
    if not nodo.figli:
        return 0 
    else:
        c = count
        for figlio in nodo.figli:
            c+=figlio[1]
        print("sono nel nodo: "+ nodo.valore + " con count : " + str(c))

        cut = 0
        if c >= W:
            cut = 1
            c= 0
            for figlio in nodo.figli:
                cut += treeCutBetter(figlio[0], W, figlio[1])
        else:
            for figlio in nodo.figli:
                cut += treeCutBetter(figlio[0], W, c)

        return cut
            
            

a = Nodo("A")
b = Nodo("B")
c = Nodo("C")
d = Nodo("D")
e = Nodo("E")
f = Nodo("F")
g = Nodo("G")
h = Nodo("H")
i = Nodo("I")
l = Nodo("L")
m = Nodo("M")
n = Nodo("N")
o = Nodo("O")
p = Nodo("P")
q = Nodo("Q")
r = Nodo("R")
s = Nodo("S")
t = Nodo("T")
u = Nodo("U")
v = Nodo("V")
z = Nodo("Z")



a.child_append(b, 3)
a.child_append(c, 2)

b.child_append(d, 2)
b.child_append(e, 1)
b.child_append(f, 5)
c.child_append(g, 1)
c.child_append(h, 1)

d.child_append(i, 2)
d.child_append(l, 3)
f.child_append(m, 1)
h.child_append(n, 2)
h.child_append(o, 2)

i.child_append(p, 3)
i.child_append(q, 2)
m.child_append(r, 2)
m.child_append(s, 5)
m.child_append(t, 1)
n.child_append(u, 1)
n.child_append(v, 2)
n.child_append(z, 1)

W = 10
print(treeCutBetter(a, W, 0))