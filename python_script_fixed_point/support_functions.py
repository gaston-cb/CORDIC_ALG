import math 

def coordic(x0,y0,z0,iter):
    xN = [] 
    yN = [] 
    zN = [] 
    xN.append(x0) 
    yN.append(y0) 
    zN.append(z0)
    di = 1 
    cuenta = 0 
    if (z0<0):
        di = -1  
    for i in range(0,iter):
        xN.append(xN[i]-di*yN[i]*2**-i)
        yN.append(yN[i]+di*xN[i]*2**-i) 
        cuenta = zN[i]-di*math.atan(2**-i)
        zN.append(cuenta) 
        if (cuenta <0):
            di = -1
        else: 
            di = 1         
    
    return xN,yN,zN 
    
    
    
    



def real2bin(realnumber):
    binary = "0"
    print(realnumber) 
    ca2 = False
    n_real = float(realnumber)
    if n_real <0: 
        ca2=True

    decimal = abs(n_real - int(n_real))
    parte_entera = int(n_real)
    if parte_entera ==0:
        binary = binary + '0'
    else: 
        binary = binary + '1'

    for i in range(0,16):
        decimal = decimal*2 
        if (int(decimal)==1):
            binary = binary + '1'
        else: 
            binary = binary + '0'
        decimal = decimal - int(decimal)
    
    binario_puro = int(binary,2) 
    if (ca2==True):
        binario_puro = binario_puro^0x3FFFF
        binario_puro = binario_puro +1 ; 
        binary = bin(binario_puro)[2:]
    return binary  


def bin2real(binnumber):
    bin_number = ""
    negative = False
    if int(binnumber[0]) == 1:
        negative = True
        for i in range(0,len(binnumber)):
            if (binnumber[i]=='0'):
                bin_number=bin_number+'1'
            else: 
                bin_number=bin_number+'0'
        binario_puro = int(bin_number,2) + 1 
        bin_number = '0'+bin(binario_puro)[2:]

    else:
        bin_number = binnumber 

    inverse_transform = 0 
    index_count = 1 
    for i in bin_number: 
        inverse_transform = inverse_transform + int(i)*2**index_count    
        index_count = index_count - 1; 

    print (inverse_transform)
    if (negative ==True): 
        inverse_transform = -1*inverse_transform
    return str(inverse_transform)  


