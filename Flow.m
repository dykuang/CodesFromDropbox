function [Q,P] = Flow(Q,P,N,n,alpha2)
% [Q,P] = Flow(Q,P,N,n,alpha2)
% update the current state Q, P during evolvement of the particle system
% N is the number of landmarks, n represents the number of time steps 

  dt=0.01; % time scale of observation
  Nu=1.5; % kernel parameter
  
%   u=zeros(N,2);
%   Q1=zeros(N,2);
  P1=zeros(N,2);
%   Gx1=zeros(N,N);
%   Gx2=zeros(N,N);
%   d1=zeros(N,N);
%   d2=zeros(N,N);
%   d=zeros(N,N);
%   Diff_G=zeros(N,N);
%   G=zeros(N,N);
  
%   diffP1=zeros(N,1);
%   diffP2=zeros(N,1);
 
%   i=0;

% tic
  %Iteration in Lagrange Coordinate.
  for i=1:n
      
    [d,d1,d2]=Dist(Q,N);
    G=G_nu_0(Nu,alpha2,d);
    Diff_G=Partial_G_0(Nu,alpha2,d);
    Gx1=d1.*Diff_G;
    Gx2=d2.*Diff_G;
    
    %first step
    Q1= Q+0.5*dt*(G*P);
    
    diffP1 = P(:,1).*(Gx1*P(:,1))+P(:,2).*(Gx1*P(:,2));
    diffP2 = P(:,1).*(Gx2*P(:,1))+P(:,2).*(Gx2*P(:,2));
    
    P1(:,1)= P(:,1)- 0.5*dt.*diffP1;
    P1(:,2)= P(:,2)- 0.5*dt.*diffP2;
    
    %second step
    [d,d1,d2]=Dist(Q1,N);
    G=G_nu_0(Nu,alpha2,d);
    Diff_G=Partial_G_0(Nu,alpha2,d);
    
    Gx1=d1.*Diff_G;
    Gx2=d2.*Diff_G;
    
    Q= Q+ dt.*(G*P1);
    
    diffP1 = P1(:,1).*(Gx1*P1(:,1))+P1(:,2).*(Gx1*P1(:,2));
    diffP2 = P1(:,1).*(Gx2*P1(:,1))+P1(:,2).*(Gx2*P1(:,2));
    
    P(:,1)= P(:,1)- dt.*diffP1;
    P(:,2)= P(:,2)- dt.*diffP2;
    

  end;
% time=toc
end
  
