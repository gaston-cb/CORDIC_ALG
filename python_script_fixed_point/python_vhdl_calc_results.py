
              #"000011101011001011#
x_result_bin = "010101101001110111" #015a77 
y_result_bin = "001000100001101010"
z_result_bin = "100000000000101000"

inverse_transform = 0 
inverse_transform_y = 0 
inverse_transform_z = 0 
index_count = 1 
for i in x_result_bin: 
    inverse_transform = inverse_transform + int(i)*2**index_count 
#    print(f'cuenta: i*2**{index_count}:={inverse_transform}')
    index_count = index_count -1 

index_count = 1 
for i in y_result_bin: 
    inverse_transform_y = inverse_transform_y + int(i)*2**index_count 
    index_count = index_count -1 


index_count = 1 
for i in z_result_bin: 
    inverse_transform_z = inverse_transform_z + int(i)*2**index_count 
    index_count = index_count -1 

    
print (f'binario decx = {inverse_transform}')
print (f'binario decy = {inverse_transform_y}')
print (f'binario decz = {inverse_transform_z}')