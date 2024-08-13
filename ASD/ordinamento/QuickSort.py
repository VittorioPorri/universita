
def Partition(l: list, i: int, f: int) -> int:
    x = l[i]
    inf = i
    sup = f + 1

    while (True):
        while (True):
            inf += 1
            if (inf >= f or l[inf] >= x):
                break

        while (True):
            sup -= 1
            if (sup <= i or l[sup] <= x):
                break

        if (inf >= sup):
            break

        l[inf], l[sup] = l[sup], l[inf]

    l[i], l[sup] = l[sup], l[i]

    return sup

def QuickSort(l: list, i: int, f: int) -> list:
    if i < f:
        m = Partition(l, i, f)
        QuickSort(l, i, m - 1)
        QuickSort(l, m + 1, f)
    
    return l

x = [7, 2, 4, 5, 3, 1, 8, 6]
print(QuickSort(x, 0, len(x) - 1))
