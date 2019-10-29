clc
clear all


load sp500full;

reverse='y';


if reverse=='y'
    Data1=zeros(size(sp500,1),size(sp500,2));
    for i=1:size(sp500,1)-1
        Data1(i,:)=sp500(end-i,:);
    end
    Data2=[sp500;Data1];
    disp(sprintf('original and reverse market values'));
elseif reverse=='n'
    disp(sprintf('original market values'));
end
ninput=5;

eta = 100;
wamp=0.4;

b1=0.00032;  
b2=0.01;
c1=0.01;
c2=0.01;

parameters(1)=b1;
parameters(2)=b2;
parameters(3)=c1;
parameters(4)=c2;

fix_the_model=14893;

[y,Weight,rule,time,error,NDEI_validation]=rPALM1_G(Data2,ninput,fix_the_model,parameters,eta,wamp);
