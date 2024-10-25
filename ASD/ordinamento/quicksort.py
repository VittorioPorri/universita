import random

def quickSort(l : list, i : int, f : int):
    if i < f:
        m = partition(l, i, f)
        quickSort(l, i, m-1)
        quickSort(l, m+1, f)

def partition(l : list, i : int, f : int):
    c = random.randint(i,f)
    l[i], l[c] = l[c], l[i]
    x = l[i]

    inf = i
    sup = f +1

    while(1):
        """
  
        Do inf+=1 
        while(l[inf]<=x)
  
        """
        while(1):
            inf +=1
            if(l[inf]>x or inf >= f):
               break 

        """
  
        Do sup-=1 
        while(l[sup]>x)
  
        """
            
        cond = True
        while(cond):
            sup-=1
            if(l[sup]<= x):
                break
        
        if(inf < sup):
            l[inf], l[sup] = l[sup], l[inf]
        else:
            break

    l[i],l[sup] = l[sup],l[i]
    
    return sup

x =[2,5,6,1,7,8]
quickSort(x,0,len(x)-1)
print(x)