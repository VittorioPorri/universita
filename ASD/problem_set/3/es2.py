import math

def maxCFU(M : list[list], i : int, j: int, salti : int):
    ...


   
M = [[0,0,0],
     ["X","X",0],
     [4,0,0],
     [4,0,0],
     [1,2,0],
     [4,2,5],
     ["X",2,5],
     [0,2,5],
     [0,2,"X"],
     [2,0,3]]

print(maxCFU(M,0,0,1))