clc
clear all

y=zeros(1,50200);
y(1)=0;
u(1)=0;

p(:,1)=[y(1),u(1)];
t(1)=sin(2*pi*1/100);
for k=2:50200
    y(k+1)=y(k)/(1+y(k).^2)+sin(2*pi*k/100).^3;
    x1(k)=y(k);
    x2(k)=sin(2*pi*k/100).^3;
    
    p=[x1;x2];
    t(k)=y(k+1);
end
P=p(:,1:50000)';
T=t(:,1:50000)';
tes=p(:,50001:50200)';
tes1=t(:,50001:50200)';
Data=[P T;tes tes1];
fix_the_model=50000;

b1=0.02;
b2=0.01;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;

eta = 5.5;
wi_low=1.28;
wi_up=1.38;

ninput=2;

[y,Weight_lower,Weight_upper,rule,time,RMSE_validation,NDEI_validation]=PALM2_L(Data,ninput,fix_the_model,parameters,eta,wi_low,wi_up);
