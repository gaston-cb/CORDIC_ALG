
clear all;
close all ; 

f1=fopen('cosFunc32_min.r') ; 
f2=fopen('senFunc32_min.r') ; 
[cosine,count] = fread(f1,"float64") ; 
[sine,count] = fread(f2,"float64") ; 


plot(cosine); hold on ; plot(sine) ; 