clc
clear all


Data=load_bj;
[N1,N2]=size(Data);
ninput=2;

b1=0.01;
b2=0.055;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;


fix_the_model=200;


eta=1.9;
wi_low=0.28; 
wi_up=0.38; 

[y,Weight_lower,Weight_upper,rule,time,RMSE_validation,NDEI_validation]=PALM2_L(Data,ninput,fix_the_model,parameters,eta,wi_low,wi_up);



