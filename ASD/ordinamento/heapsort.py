def sin(i : int):
    return (2*i)+1

        
def des(i : int):
    return (2*i)+2
   
    
def fixHeap(l : list, i : int, f : int):
    s = sin(i)
    d = des(i)

    m = i

    if s < f and l[s]> l[m]:
        m = s
    if d < f and l[d] > l[m]:
        m = d
    if m != i:
        l[i], l[m] = l[m], l[i]
        fixHeap(l,m,f)


def heapify(l : list , i : int):
    if (sin(i)< len(l)):
        heapify(l,sin(i))
        heapify(l,des(i))
        fixHeap(l,i,len(l))

def heapSort(l :list):
    heapify(l,0)
    heapsize = len(l)

    for i in range(len(l)-1,0,-1):
        l[0], l[heapsize-1] = l[heapsize-1], l[0]
        heapsize -= 1
        fixHeap(l,0,heapsize)


x =[2,5,6,1,7,8]
heapSort(x)
print(x)