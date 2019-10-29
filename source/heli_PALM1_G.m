clc
clear all

load helicopter_inOut;
dataset=[heli_in heli_in heli_out];

[N1,N2]=size(dataset);
Data=zeros(N1,N2);
for i=1:N1
    if i==1
        Data(i,:)=[dataset(i,2) 0 dataset(i,3)];
    else
        Data(i,:)=[dataset(i,2) dataset(i-1,3) dataset(i,3)];
    end
end
a=max(Data);
b=min(Data);
c=mean(Data);
normalized_dataset=zeros(N1,N2);
for i=1:N1
    for j=1:N2
        normalized_dataset(i,j)=(Data(i,j)-c(j))/(a(j)-b(j));
    end
end
ninput=2;

eta = 65.9;

b1=0.001;
b2=0.002;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;

fix_the_model=round(0.6*N1);             

[y,Weight,rule,time,error,NDEI_validation]=PALM1_G(Data,ninput,fix_the_model,parameters,eta);

