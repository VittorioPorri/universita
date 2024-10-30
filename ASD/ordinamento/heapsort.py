def sin(i : int):
    return (2*i)+1

        
def des(i : int):
    return (2*i)+2
   
    
def fixHeap(l : list, i : int):
    s = sin(i)
    d = des(i)

    m = i

    if s < len(l) and l[s]> l[m]:
        m = s
    elif d < len(l) and l[d] > l[m]:
        m = d
    if m != i:
        l[i], l[m] = l[m], l[i]
        fixHeap(l,m)


def heapify(l : list , i : int):
    ...

def heapSort(l :list):
    ...


x =[2,5,6,1,7,8]
heapify(x,0)
print(x)