clc
clear all


Data=load_mg;
[N1,N2]=size(Data);
ninput=4;

b1=0.02;
b2=0.07;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;


fix_the_model=3000;


eta=10.8;
wi_low=1.28;
wi_up=1.38;


[y,Weight_lower,Weight_upper,rule,time,RMSE_validation,NDEI_validation]=rPALM2_L(Data,ninput,fix_the_model,parameters,eta,wi_low,wi_up);
