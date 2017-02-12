function[Mwing_Proc]= Procrustes(Mwing)
% performs Procrustes fit to data.

% Mwing=importdata('Mwing.mat');
Mwing_Proc=zeros(size(Mwing));
for i=1:size(Mwing,3)
    shift=sum(Mwing(:,:,i));
    Mwing(:,:,i)=Mwing(:,:,i)-ones(size(Mwing,1),1)*shift; %mode shift
    Mwing(:,:,i)=Mwing(:,:,i)/norm(Mwing(:,:,i)); % mode scalar
    
    %mode rotation
    [U,S,V]=svd(Mwing(:,:,1)'*Mwing(:,:,i));
    Mwing_Proc(:,:,i)=Mwing(:,:,i)*(V*sign(S)*U');
    
end;

end