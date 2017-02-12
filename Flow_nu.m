function [Q,P,H] = Flow_nu(Q,P,N,n,alpha2)
% test if using special structure of nu =1.5 will be faster. Yes, a little!
% this version is not suitable for other nu.

  dt=0.01; % time scale of observation
  hdt=0.5*dt;
  Nu=1.5; % kernel parameter
  
  shift = 1.0e-8;
  P1=zeros(N,2);
  
  H = zeros(100,1);
% tic;
  %% Iteration in Lagrange Coordinate.
  for i=1:n
      
    [d,d1,d2]=Dist(Q,N);
    G=G_nu_0(Nu,alpha2,d);
%     Diff_G=Partial_G_0(Nu,alpha2,d);
    
    ds=d+shift*(d==0);  

    r1 = -d1./ds;
    r2 = -d2./ds;
    Gx1=r1.*G;
%     /sqrt(alpha2);
    Gx2=r2.*G;
%     /sqrt(alpha2);
%     

    
    %% first step
%     GP1 = G.*repmat(P(:,1)',N,1);
%     GP2 = G.*repmat(P(:,2)',N,1);
    
    Q1 = Q + hdt*(G*P);
%      Q1(:,1) = Q(:,1) + hdt*(sum(GP1,2));
%      Q1(:,2) = Q(:,2) + hdt*(sum(GP2,2));
% %     PP = P*P';
    
%     diffP1 = sum(PP.*Gx1,2);
%     diffP2 = sum(PP.*Gx2,2);
     
%      diffP1 = sum(r1.*GP1,2);
%      diffP2 = sum(r2.*GP2,2);
 
    diffP1 = sum(P.*(Gx1*P),2);
    diffP2 = sum(P.*(Gx2*P),2);

%     diffP1 = P(:,1).*(Gx1*P(:,1))+P(:,2).*(Gx1*P(:,2));
%     diffP2 = P(:,1).*(Gx2*P(:,1))+P(:,2).*(Gx2*P(:,2));

    P1(:,1)= P(:,1)- hdt.*diffP1;
    P1(:,2)= P(:,2)- hdt.*diffP2;
    
    
    %% second step
    [d,d1,d2]=Dist(Q1,N);
    G=G_nu_0(Nu,alpha2,d);
%     Diff_G=Partial_G_0(Nu,alpha2,d);
 
    ds=d+shift*(d==0);
    r1 = -d1./ds;
    r2 = -d2./ds;
    Gx1=r1.*G;
%     /sqrt(alpha2);
    Gx2=r2.*G;
%     /sqrt(alpha2);
    
   Q = Q + dt*(G*P1);
   
%    Q(:,1) = Q(:,1) + hdt*(sum(GP1,2));
%    Q(:,2) = Q(:,2) + hdt*(sum(GP2,2));
  
    diffP1 = sum(P1.*(Gx1*P1),2);
    diffP2 = sum(P1.*(Gx2*P1),2);
    
%     diffP1 = P1(:,1).*(Gx1*P1(:,1))+P1(:,2).*(Gx1*P1(:,2));
%     diffP2 = P1(:,1).*(Gx2*P1(:,1))+P1(:,2).*(Gx2*P1(:,2));
    
    P(:,1)= P(:,1)- dt.*diffP1;
    P(:,2)= P(:,2)- dt.*diffP2;
    
    H(i)=0.5*P(:,1)'*G*P(:,1)+0.5*P(:,2)'*G*P(:,2);
  end;
% time_eig=toc
  %% check the conservation of Hamiltonian
% H=0.5*P(:,1)'*G*P(:,1)+0.5*P(:,2)'*G*P(:,2);
% fprintf('H by the end of time is %.4f\n', H);
end
  
