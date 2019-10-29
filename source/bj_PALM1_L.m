clc
clear all


Data=load_bj;
[N1,N2]=size(Data);
ninput=2;


b1=0.01;
b2=0.05;  
c1=0.01;  
c2=0.01;  
parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;

fix_the_model=200;

eta=5.8;

[y,Weight,rule,time,RMSE_validation,NDEI_validation]=PALM1_L(Data,ninput,fix_the_model,parameters,eta);
