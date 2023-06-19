from support_functions import coordic 
from support_functions import real2bin 
from support_functions import bin2real 
import math 


An = 1 
for i in range (0,10):
    An = An*math.sqrt(1+2**(-2*i)) 
print (An)
x0 = 1/An 
y0 = 0 
z0 = (math.pi/4) #45º  
PATH_FILE = '../coordic_recursivo/simulacion/coordic_tb_file.txt'
# x0, xn,y0,yn,z0,zn 

#read_file 
#x0 to bin 
def file_vhdl_read(name_file):
    vhdl_xn = [] 
    vhdl_yn = [] 
    vhdl_zn = [] 
    with open(name_file) as f:
        lines = f.readlines()
        count_lines = len(lines) 
        condador = 0 
        for i in lines[1:]: 
            x10,xN,y10,yN,z10,zN = i.split() 
            vhdl_xn.append(xN)
            vhdl_yn.append(yN)
            vhdl_zn.append(zN)
    return vhdl_xn,vhdl_yn,vhdl_zn


vhdlx,vhdly,vhdlz = file_vhdl_read(PATH_FILE) 

xn,yn,zn = coordic(x0,y0,z0,11)
print(xn)
print (f'inicial value: {x0},{y0},{z0}')
with open('compare_cordic_tb.txt','w') as c:
    for i in range(0,len(xn)): 
        c.write(f'{i}: {bin2real(vhdlx[i])}  {xn[i]} {bin2real(vhdly[i])}  {yn[i]}  {bin2real(vhdlz[i])}  {zn[i]} \n')
#     {bin2real(vhdly[i])} {bin2real(vhdlz[i])}
