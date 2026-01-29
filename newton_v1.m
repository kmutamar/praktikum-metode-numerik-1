% Hati-hati, diasumsikan anda sudah menginstall latex
% LaTeX digunakan disini untuk membuat label sumbu-x dan sumbu-y lebih bagus

clear all;
close all;
clc;
% nilai parameter
init=5;
itmax=1e3;
tolmax=1e-3;

% Realokasi
x=zeros(itmax+1,1);
f=zeros(itmax+1,1);
df=zeros(itmax+1,1);

% metode Newton tanpa procedure
x(1)=init;
for i=1:itmax
	f(i)=x(i)^2-5*x(i)+6;
	df(i)=2*x(i)-5;
	x(i+1)=x(i)-f(i)/df(i);
	% cek stopping kriteria
	f(i+1)= x(i)^2-5*x(i)+6;
	df(i+1)=2*x(i+1)-5;
	fprintf('%2d %3.5f %3.5f %3.5f \n',i,x(i+1),f(i+1),df(i+1))
	if abs(f(i+1)<tolmax) || abs(df(i+1))<tolmax
		break;
	end;
end

% kurva dinamik
X=linspace(1,5,1e5);
F=X.^2-5*X+6;

figure(1)
plot(X,F,'r-','linewidth',1)
hold on
plot(x(1:i+1),f(1:i+1),'bo',...
    'linewidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','r')
xlabel('$x$','interpreter','latex','fontsize',18)
ylabel('$f(x)$','interpreter','latex','fontsize',18)
legend({'$f(x)$','$x_i$'},...
    'interpreter','latex',...
    'fontsize',16,...
    'location','best')

