function [Ik,P,count,t,H,error]=shooting1(N,eps,alpha2)
% function [P,H]=shooting1(N,eps,alpha2) shooting algorithm between two
% template loaded in the function body. infty error.


n=100; %should be choosen so that ndt=1 in function Flow;
%N=64;
tol=1.0e-3;
%eps=1.1; %matters when come to stablility. smaller when deformation is larger.
count=0;
% I=template0(N);
% I=importdata('MwingAN1.mat');
I=2*template3(N);
I0=I;

% I1=template0(N);
% I1=importdata('MwingAN2.mat');
I1=template_skewed_ellipse(N);
% I1(:,2)=I1(:,2)-8/3/pi; % centering for irregular shape

V=zeros(N,2);
error=1;

P=zeros(N,2);
% G=zeros(N,N);
% d=zeros(N,N);

 
d=Dist(I0,N); 
G=G_nu_0(1.5,alpha2,d);%kernel
Ginv = pinv(G);
tic;
while error>tol %&& count<500
%     d1=Dist(I,N);
%     eps=G_nu_0(2.,d1)*0.01;
    
    V = V + eps*V_corr(I,I1);
    %P = VtoP(I0,V,N);
    %P = G\V;
    P = Ginv*V;      %find others
    I = Flow(I0,P,N,n,alpha2); % exact flow
    
    %I = Flow_inexact(I0,P,N,n,alpha2); % inexact flow
    
    error=max(max(abs(V_corr(I,I1))));
    count=count+1;
end;
t=toc;
H=P(:,1)'*G*P(:,1)+P(:,2)'*G*P(:,2);
%clear
 Ik=I0;p=P;
 for i=1:6
figure(i+2)
plot([Ik(:,1);Ik(1,1)],[Ik(:,2);Ik(1,2)]);
[Ik,p]=Flow(Ik,p,N,20,alpha2);
%[Ik,p]=Flow_inexact(Ik,p,N,20,alpha2);
% axis([-6 6 -6 6]);
axis equal;
end;
hold on;
plot(I1(:,1),I1(:,2),'*');
text(I1(:,1),I1(:,2),num2str((1:N)'));
ih=quiver(I1(:,1),I1(:,2),p(:,1),p(:,2),'k');
set(ih,'LineWidth',1.2);
set(ih,'MaxHeadSize',0.35);
set(ih,'ShowArrowHead', 'on');
plot(I0(:,1),I0(:,2),'+');
text(I0(:,1),I0(:,2),num2str((1:N)'));
quiver(I0(:,1),I0(:,2),P(:,1),P(:,2));
hold off;
end
