function [P,count,t,Ep,error]=shooting1_inexact(N,eps,alpha2,sigma2)
% Inexact shooting between two templates. 
% square error. stop if criterion does not change much

n=100; %should be choosen so that ndt=1 in function Flow;
%N=64;
tol=0.01;
%tol=sigma;
%eps=1.1; %matters when come to stablility. smaller when deformation is larger.
count=0;
I=template0(N);
I0=I;
%I0=importdata('temp2.mat');
I1=template1(N);
%I1=importdata('temp3.mat');
V=zeros(N,2);
%error=1;
diff=1;
En=0;
Ep=0;

P=zeros(N,2);
% G=zeros(N,N);
% d=zeros(N,N);

 
d=Dist(I0,N); 
G=G_nu_0(1.5,alpha2,d);%kernel

tic;
%while error>tol && count<500
while diff>tol && count<500  %Thinking about when to stop?
%     d1=Dist(I,N);
%     eps=G_nu_0(2.,d1)*0.01;
    
    V = V + eps*V_corr(I,I1);
    %P = VtoP(I0,V,N);
    %P = G\V;
    P = pinv(G)*V;      %find others
    %I = Flow(I0,P,N,n,alpha2); % exact flow
    
    I = Flow_inexact(I0,P,N,n,alpha2,sigma2); % inexact flow
    
    error=norm(V_corr(I,I1))^2;
    
    Ep=P(:,1)'*G*P(:,1)+P(:,2)'*G*P(:,2)+error/sigma2;
    
    diff=Ep-En;
    En=Ep;
    count=count+1;
end;
t=toc;
%clear
 Ik=I0;p=P;
 for i=1:6
figure(i)
plot([Ik(:,1);Ik(1,1)],[Ik(:,2);Ik(1,2)]);
%[Ik,p]=Flow(Ik,p,N,20,alpha2);
[Ik,p]=Flow_inexact(Ik,p,N,20,alpha2,sigma2);
axis([-6 6 -6 6]);
axis square;
end;
hold on;
plot(I1(:,1),I1(:,2),'.');
%plot(I(:,1),I(:,2));
hold off
end
