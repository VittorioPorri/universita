#Da decimale a Base_
def base2(n):
    b=''

    while n>0:
        if n%2==0:
            b='0'+b
        else:
            b='1'+b

        n=int(n/2)
    return b

def base3(n):
    solv=''
    
    while n>0:
        resto=n%3
        n=int((n-resto)/3)
        solv=str(resto)+solv

    print("Numero in base 3: " +str(solv))

def base4(n):
    solv=''
    
    while n>0:
        resto=n%4
        n=int((n-resto)/4)
        solv=str(resto)+solv

    print("Numero in base 4: " +str(solv))

def base5(n):
    solv=''
    
    while n>0:
        resto=n%5
        n=int((n-resto)/5)
        solv=str(resto)+solv

    print("Numero in base 5: " +str(solv))

def base6(n):
    solv=''
    
    while n>0:
        resto=n%6
        n=int((n-resto)/6)
        solv=str(resto)+solv

    print("Numero in base 6: " +str(solv))

def base7(n):
    solv=''
    
    while n>0:
        resto=n%7
        n=int((n-resto)/7)
        solv=str(resto)+solv

    print("Numero in base 7: " +str(solv))

def base8(n):
    solv=''
    
    while n>0:
        resto=n%8
        n=int((n-resto)/8)
        solv=str(resto)+solv

    print("Numero in base 8: " +str(solv))

def base9(n):
    solv=''
    
    while n>0:
        resto=n%9
        n=int((n-resto)/9)
        solv=str(resto)+solv

    print("Numero in base 9: " +str(solv))

def base10(n):
    #gli viene passato un numero binario
    solv=0
    
    for i in range(len(n)):
        if n[i] == '1':
            solv += 2**(len(n)-1-i)

    return solv

def base16(n):
    #gli viene passato un numero binario
    solv=''

    d = {
        '0000': '0', '0001': '1', '0010': '2', '0011': '3',
        '0100': '4', '0101': '5', '0110': '6', '0111': '7',
        '1000': '8', '1001': '9', '1010': 'A', '1011': 'B',
        '1100': 'C', '1101': 'D', '1110': 'E', '1111': 'F'
    }

    while len(n)%4 != 0:
        n = "0"+n
    
    for i in range(0,len(n),4):
        key = ''
        for j in range(4):
            key = key + n[j+i]

        solv = solv + d[key]
    print("Numero in base 16: " +str(solv))

#da base qualsiasi a base 10

def basek_to_base2(n,k):
    solv = 0

    for i in range(len(n)):
        solv = solv + int(n[i])*(k**(len(n)-1-i))

    solv = base2(solv)

    return solv


def base16_to_base2(x):
    solv =''
    
    d = {'0': '0000', '1': '0001', '2': '0010', '3': '0011',
         '4': '0100', '5': '0101', '6': '0110', '7': '0111',
         '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
         'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'}
    
    for i in range(len(x)):
        solv = solv + d[x[i]]

    return solv

def converter(x):
    print()
    print("Numero in base 2: " +str(x))
    d = base10(x)
    base3(d)
    base4(d)
    base5(d)
    base6(d)
    base7(d)
    base8(d)
    base9(d)
    print("Numero in base 10: " +str(d))
    base16(x)

#seleziona il numero binario
b = input("Inserisci un numero:  ")
k = int(input("Digita la base: "))

if k == 16:
    b = base16_to_base2(b)

elif(k!=2):
    b = basek_to_base2(b,k)

converter(b)
