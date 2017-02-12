function [P,V,H,count,error,t]=shooting_be(N,eps,alpha2,I0,I1)
%This function calculates P for which Flow(I0;P)=I1;
%H is Hamiltonian during the evolution.
%N is the number of landmarks, eps is the step size
%alpha2 is the paramter in Yukawa operator.

n=100; %should be choosen so that ndt=1 in function Flow;
%N=64;
tol=1.0e-3; %
nu=1.5;
%eps=1.1; %matters when come to stablility. smaller when deformation is larger.
count=0;
%[I0,I,AVE]=Rtemplate0(N);
I=I0;
%I0=importdata('temp2.mat');
%I1=template1(N);
%I1=importdata('temp3.mat');
V=zeros(N,2);
error=1;

P=zeros(N,2);
% G=zeros(N,N);
% d=zeros(N,N);

tic; 
d=Dist(I0,N); 
G=G_nu_0(nu,alpha2,d);%kernel

% tic;
G_inv = pinv(G);
while ((error>tol) & (count<500))
%     d1=Dist(I,N);
%     eps=G_nu_0(2.,d1)*0.01;
    
    V = V + eps*V_corr(I,I1);
    %P = VtoP(I0,V,N);
    %P = G\V;
%     P=pinv(G)*V;
    P = G_inv*V;      % find others
%     I = Flow_nu(I0,P,N,n,alpha2); % exact flow
    I = Flow_nu(I0,P,N,n,alpha2);
%     I = Flow_nu_leapfrog(I0,P,N,n,alpha2); % exact flow
%     I = Flow_nu_leapfrog_P(I0,P,N,n,alpha2); % exact flow
    %I = Flow_inexact(I0,P,N,n,alpha2,0.05); % inexact flow
    
    error=norm(I-I1,2);
%     error=max(max(abs(V_corr(I,I1)))); %L_inf norm
%     error = median(abs(V_corr(I,I1)));   %L_inf norm, median
%     error=max(max(abs(G_inv*V_corr(I,I1))));
    count=count+1;
    
end;

% count
if (count>500)
    fprintf('No convergence, you may change the update step!\n');
end;
% t=toc
% u=G*P;
 H= 0.5*sum(P(:,1).*V(:,1))+0.5*sum(P(:,2).*V(:,2));
% H=0.5*P(:,1)'*G*P(:,1)+0.5*P(:,2)'*G*P(:,2); %proportional
t=toc;
% count
% P=G*P;
%clear
%  Ik=I0;p=P;
%  for i=1:6
% figure(i)
% plot([Ik(:,1);Ik(1,1)],[Ik(:,2);Ik(1,2)]);
% [Ik,p]=Flow(Ik,p,N,20,alpha2);
% %[Ik,p]=Flow_inexact(Ik,p,N,20,alpha2);
% axis([-6 6 -6 6]);
% axis square;
% end;
% hold on;
% plot(I1(:,1),I1(:,2),'*');
% plot(I(:,1),I(:,2));
end
