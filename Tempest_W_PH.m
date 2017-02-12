function [Xp,P,H,weight,count]=Tempest_W_PH(sample_size,N,I,Ini) 
% average algorithm, weighting methods can be changed in the function body
%I0 and AVE are used just for comparison


tol=1.0e-3;% tune this when non-convergent, also affects speed
eps=0.6;% tune this when non-convergent, also affects speed
alpha2=1.;
n=100;
a=1;

% [I0,I,AVE]=Rtemplate0(sample_size,N);

H=zeros(sample_size,1);
P=zeros(N,2,sample_size);
P0=zeros(N,2);
weight=zeros(sample_size,1);
flag=1;
Xp=Ini; %initial guess
count=0;

while flag>tol && count<50
    

    parfor i=1:sample_size
      %log mapping
      [P(:,:,i),H(i)]=shooting_be(N,eps,alpha2,Xp,I(:,:,i)); 
      
      %setting average weights
%        weight(i)=1;
      weight(i)=1/sqrt(H(i));
%       weight(i)=exp(-H(i));
      
      P0=P0+P(:,:,i)*weight(i);

    end;

    P0=P0/sum(weight);

%     P0=sum(P,3);
    %weight=1./weight;
    %weighted_temp=bsxfun(@times,I,weight);
    %weighted_temp=bsxfun(@times,I,reshape(weight,[1 1 sample_size]));
    %weight_total=sum(weight);
    
    %exp mapping
    Xp=Flow(Xp,a*P0,N,n,alpha2);
%     Xp=Flow_inexact(Xp,P0,N,n,alpha2,0.05);
%     Xp=Xp-0.5*P0;

    flag=norm(P0);
    %Xp=X;
    
    count=count+1;
    
%      H=sqrt(H);  % which to minimize!!!
    
%      HXS=sum(H) % energy here may not be the measure appropriately
end;

%comparison
% figure(1)
% plot(Xp(:,1),Xp(:,2),'b',I0(:,1),I0(:,2),'r',AVE(:,1),AVE(:,2),'g');

end