def ricercaBinaria(n : int, l : list, i : int, f : int) -> int:
    if i <= f:
        m = (i+f)//2

        if l[m] == n:
            return m
        elif l[m] > n:
            return ricercaBinaria(n, l, i, m-1)
        else:
            return ricercaBinaria(n, l, m+1, f)

x = [0,2,3,4,5,7,8]
print(ricercaBinaria(5,x,0,len(x)-1))
