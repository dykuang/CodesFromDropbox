function [P,t,H,error,exitflag,output,jacobian]=shooting1_solver(N,eps,alpha2)
% use the MatLab fsolve for the initial momentum

n=100; %should be choosen so that ndt=1 in function Flow;
%N=64;
%tol=1.0e-3;
%eps=1.1; %matters when come to stablility. smaller when deformation is larger.
%count=0;
I=2*template3(N);
I0=I;
I1=template_skewed_ellipse(N);
%I1=importdata('heart2.mat');
V=eps*(I1-I0);
%err=zeros(N,2);
%error=1;

% P=zeros(N,2);
% G=zeros(N,N);
% d=zeros(N,N);

 
d=Dist(I0,N); 
G=G_nu_0(1.5,alpha2,d);%kernel
 
tic;
%options.TolCon = 1e-3;
[P,err,exitflag,output,jacobian] = fsolve(@(P) I1-Flow(I0,P,N,n,alpha2), V);
%options = optimoptions('fsolve','Jacobian','on');

t=toc;

H=P(:,1)'*G*P(:,1)+P(:,2)'*G*P(:,2);
error=norm(err,2);
%clear
 Ik=I0;p=P;
 for i=1:6
figure(i)
plot([Ik(:,1);Ik(1,1)],[Ik(:,2);Ik(1,2)]);
[Ik,p]=Flow(Ik,p,N,20,alpha2);
axis([-6 6 -6 6]);
axis square;
end;
hold on;
plot(I1(:,1),I1(:,2),'*');
%plot(I(:,1),I(:,2));
end
