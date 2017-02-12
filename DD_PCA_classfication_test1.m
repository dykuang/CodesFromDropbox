function [rankH,rankP,rankd, Hrank,d] = DD_PCA_classfication_test1(k,test)
% Test the performance of the PCA procedure in classifying basic shapes.
% test contains shapes to be classied to training categories
N=size(test,1);

I0=template2(N);     % store the base shape as reference for procrustes

%% Training procedure is just by calculating "average"
size_train = 11;
train = zeros(N,2,size_train);

Rep =zeros(N,2,size_train); % representaion after procruste fit to each training template

train(:,:,1) = template1(N);                     % heart
train(:,:,2) = template2(N);                     % circle
train(:,:,3) = template3(N);                     % smaller circle/square
train(:,:,4) = template4(N);                     % standing ellipse
train(:,:,5) = template7(N);                     % square/diamond
train(:,:,6) = template6(N);                     % half ellipse/half circle
train(:,:,7) = template0(N);                     % lying ellipse
train(:,:,8) = importdata('hand_sample.mat');    % hand
train(:,:,9) = importdata('key28.mat');            % key
train(:,:,10) = importdata('hand_sample2.mat');
train(:,:,11) = importdata('key2.mat'); 

%% Extract momentum information in PCA representation.
% w=1;  %weight between different distance
feature = zeros(k,1);
dist = zeros(size_train,1);
Hrank = zeros(size_train,1);

% procrustes fit test data to reference
[D,test_pro] =  procrustes(I0,test); 

for i=1:size_train
%      [d,Rep(:,:,i)]=procrustes(train(:,:,i),I0); % procruste fit I0 to each training pattern
     [d(i),Rep(:,:,i)]=procrustes(I0,train(:,:,i));
    [PV,V,P_major,H_piece_sorted,H_piece_index, H_major,H]= DD_PCA(test_pro,Rep(:,:,i),k,0);
%     [PV,V,P_major,H_piece_sorted,H_piece_index, H_major,H]= DD_PCA(Rep(:,:,i),test_pro,k,0);
    for j=1:k
        feature(j)=trace(P_major(:,:,j)'*P_major(:,:,j));
    end;
   % figure(i)
   % stem(feature);
    dist(i) = trace(sum(P_major,3)'*sum(P_major,3));
%     Hrank(i) = H_major;
    Hrank(i) = H;
end;

[z, result] = sort(dist,'ascend');
[zH, Hresult] = sort(Hrank,'ascend');

rankP=[z,result];
rankH=[zH,Hresult];
% fprintf('the ranking is\n');

%% Dengrogram Plot
 Hrank = Hrank./sum(Hrank); %normalize the distance
 d=d./sum(d);

figure()
% D = pdist(Hrank);
tree = linkage(Hrank,'average');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Hamiltonian metric, average method');

figure()
tree = linkage(Hrank,'single');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Hamiltonian metric, nearest neighbor method');

figure()
tree = linkage(Hrank,'weighted');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Hamiltonian metric, weighted average method');


%% Compare with just procrustes fit/put dendrogram
[zd,dresult] = sort(d,'ascend');
rankd=[zd',dresult'];

figure()
tree = linkage(d','average');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Procrustes metric, average method');

figure()
tree = linkage(d','single');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Procrustes metric, nearest neighbor method');

figure()
tree = linkage(d','weighted');
% leafOrder = optimalleaforder(tree,D);
% dendrogram(tree,'Reorder',leafOrder);
dendrogram(tree);
title('Procrustes metric, weighted average method');


end