clc
clear all


Data=load_mg;
[N1,N2]=size(Data);
ninput=4;

b1=0.02;
b2=0.01;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;

fix_the_model=3000;

eta = 2.1;

[y,Weight,rule,time,error,NDEI_validation]=PALM1_L(Data,ninput,fix_the_model,parameters,eta);
