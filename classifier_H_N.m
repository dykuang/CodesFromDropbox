function result = classifier_H_N()
% Classifier using Hamiltonian distance
% based on stat explanation on manifold, treat H as M-distance
% use cal_schi data


% a partition of training data

Nave = importdata('Nave.mat');
NP=importdata('Ndata_ave.mat');
SP=importdata('Sdata_ave.mat');


aven = mean(NP,3);
aves = mean(SP,3);

G=G_nu_0(1.5,1.,Dist(Nave,13));


g_n=zeros(2,14);
g_s=zeros(2,14);

for i=1:14
%N-N
g_n(1,i) = aven(:,1)'*(G*NP(:,1,i))+aven(:,2)'*(G*NP(:,2,i))-.5*(aven(:,1)'*(G*aven(:,1))+aven(:,2)'*(G*aven(:,2)));
%N-S
g_s(1,i) = aves(:,1)'*(G*NP(:,1,i))+aves(:,2)'*(G*NP(:,2,i))-.5*(aves(:,1)'*(G*aves(:,1))+aves(:,2)'*(G*aves(:,2)));
%S-N
g_n(2,i) = aven(:,1)'*(G*SP(:,1,i))+aven(:,2)'*(G*SP(:,2,i))-.5*(aven(:,1)'*(G*aven(:,1))+aven(:,2)'*(G*aven(:,2)));
%S-S
g_s(2,i) = aves(:,1)'*(G*SP(:,1,i))+aves(:,2)'*(G*SP(:,2,i))-.5*(aves(:,1)'*(G*aves(:,1))+aves(:,2)'*(G*aves(:,2)));
end;

result(1,:)=(g_n(1,:)>g_s(1,:));  %whether or not is a N;
result(2,:)=(g_s(2,:)>g_n(2,:));  %whether or not is a S;




end