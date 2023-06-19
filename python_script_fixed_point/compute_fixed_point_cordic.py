"""
    Calcula el numero binario en formato de punto fijo para el cómputo 
    de seno y coseno usando algoritmo coordic 
    formato 2:entero - 16 decimal
    Returns:
        _type_: _description_
"""
import math 
ITERACIONES = 10 
z0 = math.atan(2**-2) 
y0 = 0 
x0 = 1 




def compute_coordic(x0,y0,z0):
    """_summary_

    Args:
        x0 (_type_): FLOAT
        y0 (_type_): FLOAT
        z0 (_type_): FLOAT

    Returns:
        _type_: FIXED POINT TO TESTBENCH VHDL 
    """
    number_binary_x = "0"
    number_binary_y = "0"
    number_binary_z = "0"
    list_binary = []
    ca2x  = False 
    ca2y = False 
    ca2z  = False 
    if (x0<0):
        ca2x = True
    if (y0<0):
        ca2y = True
    if (z0<0):
        ca2z = True
    
    decimalx = abs(x0 - int(x0))
    decimaly = abs(y0 - int(y0))
    decimalz = abs(z0 - int(z0))
    parte_entera_x = int(x0)
    parte_entera_y = int(y0)
    parte_entera_z = int(z0)
    if (parte_entera_x == 0):
        number_binary_x = number_binary_x+'0'
    else:  
        number_binary_x = number_binary_x+'1'
    if (parte_entera_y == 0):
        number_binary_y = number_binary_y+'0'
    else:  
        number_binary_y = number_binary_y+'1'

    if (parte_entera_z == 0):
        number_binary_z = number_binary_z+'0'
    else:  
        number_binary_z = number_binary_z+'1'


    for i in range(0,16):
        decimalx = decimalx*2
        decimaly = decimaly*2
        decimalz = decimalz*2
        if (int(decimalx) == 1):
            number_binary_x = number_binary_x+'1'
        else:
           number_binary_x = number_binary_x+'0'
        if (int(decimaly) == 1):
            number_binary_y = number_binary_y+'1'
        else:
           number_binary_y = number_binary_y+'0'
        if (int(decimalz) == 1):
            number_binary_z = number_binary_z+'1'
        else:
           number_binary_z = number_binary_z+'0'
        decimalx = decimalx - int(decimalx)
        decimaly = decimaly - int(decimaly)
        decimalz = decimalz - int(decimalz)

    binario_puro_x= int(number_binary_x,2)  
    binario_puro_y= int(number_binary_y,2)  
    binario_puro_z= int(number_binary_z,2)  

    if (ca2x == True):
        binario_puro_x = binario_puro_x^0x3FFFF
        binario_puro_x = binario_puro_x +1 ; 
        number_binary_x = bin(binario_puro_x)[2:]


    if (ca2y == True):
        binario_puro_y = binario_puro_y^0x3FFFF
        binario_puro_y = binario_puro_y +1 ; 
        number_binary_y = bin(binario_puro_y)[2:]


    if (ca2z == True):
        binario_puro_z = binario_puro_z^0x3FFFF
        binario_puro_z = binario_puro_z +1 ; 
        number_binary_z = bin(binario_puro_z)[2:]


    list_binary.append((number_binary_x)) 
    list_binary.append((number_binary_y)) 
    list_binary.append((number_binary_z)) 

    return list_binary 



for i in range(0,ITERACIONES):
    x0 =  x0*math.sqrt(1+2**(-2*i)) 
    #print (x0) 

print (1/x0)
l1 = compute_coordic(1/x0,y0,z0)

print (f'{l1}')



print(len(l1[0]))  
print(len(l1[1]))  
print(len(l1[2]))  

index_count = 1 ;
inverse_transform = 0 ; 
inverse_transform_y = 0 ; 
inverse_transform_z = 0 ; 
# stringxbin = "000011101011001011" # 0AAFD  
                    
# stringybin = "000111000001000000" 
             
#print (len(stringxbin))
#print (len(stringybin))


for i in l1[0]: 
    inverse_transform = inverse_transform + int(i)*2**index_count 
#    print(f'cuenta: i*2**{index_count}:={inverse_transform}')
    index_count = index_count -1 

index_count = 1 
for i in l1[1]: 
    inverse_transform_y = inverse_transform_y + int(i)*2**index_count 
    index_count = index_count -1 


index_count = 1 
for i in l1[2]: 
    inverse_transform_z = inverse_transform_z + int(i)*2**index_count 
    index_count = index_count -1 




# xn result 001100100100001111 
# yn result 001100100100001111 
# zn result 001100100100001111
print (f'binario decx = {inverse_transform}')
print (f'binario decy = {inverse_transform_y}')
print (f'binario decz = {inverse_transform_z}')
# 011100111101101011 ->xn 
# 010010111111110101 ->yn 
