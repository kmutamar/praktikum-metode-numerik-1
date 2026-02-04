clear all;
close all;
clc;

% interval integral
a=2;
b=7;
n=4;
h=(b-a)/n;

% realokasi
x=zeros(n+1,1);
f=zeros(n+1,1);

% jumlahan awal
x(1)=a;
x(n+1)=b;
f(1)=x(1)^2-6*x(1)+8;
f(n+1)=x(n+1)^2-6*x(n+1)+8;
jumlah=f(1)+f(n+1);

% jumlahan final
% ingat untuk memeriksa indeks suku
for i=2:n
    x(i)=a+(i-1)*h;
    f(i)=x(i)^2-6*x(i)+8;
    if mod(i,2)==0
        jumlah=jumlah+4*f(i);
    else
        jumlah=jumlah+2*f(i);
    end
    
end
hasil=jumlah*h/3;
disp(['Hasil integral = ',num2str(hasil,10)])





