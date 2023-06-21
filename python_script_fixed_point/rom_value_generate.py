from support_functions import real2bin
from support_functions import bin2real

import math 

#generate values for a memory rom and generate numbers in 
for i in range(0,15): 
    print(f'{i} => {real2bin(math.atan(2**-i))}') 

An = 1 
for i in range (0,11):
    An = An*math.sqrt(1+2**(-2*i)) 
print (real2bin(1/An)) 
print(real2bin(math.pi/4)) 




