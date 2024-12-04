def coppia(A: list, delta: int) -> list:
    l = []
    l.append([A[0], A[0] + delta])

    for i in range(1, len(A)):
        if l[i - 1][1] > A[i]:
            #se arriva un cliente mentre lavoro aspetta
            l.append([l[i - 1][1], l[i - 1][1] + delta])
        else:
            l.append([A[i], A[i] + delta])

    return l


def cerca_delta_primo(A: list, delta1: int, delta2: int, M: int) -> int:
    if delta1 > delta2:
        return delta2

    d = (delta1 + delta2) // 2

    C = coppia(A, d)
    if C[len(A)-1][1] <= M:
        #se ho ancora tempo posso cercare tra d+1 e delta2
        return cerca_delta_primo(A, d + 1, delta2, M)
    else:
        #se ho sforato M cerco tra delta1 e d-1
        return cerca_delta_primo(A, delta1, d - 1, M)


def max_delta_primo(A: list, delta: int, M: int) -> int:
    delta_primo = delta
    delta_secondo = M - A[-1]

    return cerca_delta_primo(A, delta_primo, delta_secondo, M)

x = [1, 2, 5, 6]
print(max_delta_primo(x, 2, 15))
