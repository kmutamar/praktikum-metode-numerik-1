clear all;
close all;
clc;
% nilai parameter
itmax=1e3;
tolmax=1e-5;

% nilai interval pilihan
a=3;
b=7;

% Realokasi
% x terdiri atas a,b,c
% f terdiri atas f(a),f(b),f(c)
x=zeros(itmax+1,3);
f=zeros(itmax+1,3);

% metode bisection tanpa procedure
iter=0;
while true
    iter=iter+1;
    c=0.5*(a+b);
    % nilai fungsi
    fa=a^2-6*a+8;
    fb=b^2-6*b+8;
    fc=c^2-6*c+8;
    x(iter,:)=[a,b,c];
    f(iter,:)=[fa,fb,fc];
    fprintf('%3d %3.5f %3.5f %3.5f \n',iter,x(iter,:))
    
    % update interval
    if (fc<0)
        a=c;
    else
        b=c;
    end
    % periksa stopping
    if abs(b-a)<tolmax
        break;
    end
end


% kurva dinamik
X=linspace(1,7,1e3);
F=X.^2-6*X+8;

figure(1)
plot(X,F,'r-','linewidth',1)
hold on
plot(x(1:iter,1),f(1:iter,1),'bo',...
    'linewidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','y')
plot(x(1:iter,2),f(1:iter,2),'bo',...
    'linewidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','r')
xlabel('$x$','interpreter','latex','fontsize',18)
ylabel('$f(x)$','interpreter','latex','fontsize',18)
legend({'$f(x)$','$a_i$','$b_i$'},...
    'interpreter','latex',...
    'fontsize',16,...
    'location','best')
axis([1 7 -1 20])
