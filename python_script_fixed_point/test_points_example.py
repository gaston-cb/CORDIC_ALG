from support_functions import bin2real 
from support_functions import real2bin 
import math 

list_points = [-math.pi/2, -1.5,-1,-0.707,0,0.707,1,1.5,math.pi/2,(math.pi/4)]  


for i in list_points:
    print(f'{i}: bin: {real2bin(i)}')

