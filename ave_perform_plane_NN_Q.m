function [error,CM]= ave_perform_plane_NN_Q(k,m,n)
% function [train_std,test_std]= ave_perform_plane_NN_P(k,m,n)
% randomly form training and test set of fix size used for evaluating 
% the performance of extracted feature: Euler PCA of momentum P.
% k is the number of  truncated terms, m is the numer of independent runs forming random train and test set, 
% n is the number of independent runs with fixed train and test set.

% addpath('D:\life\Google\P&Oclassification\EE2015\EE5650_Project\Project3');
% Data = importdata('H_plane_feature.mat');  % import the raw data
% Data = importdata('P_plane_feature.mat');
% Data = importdata('feature_Q.mat');
Data = importdata('feature_HP1.mat');


%% NN structure
d= k; 
h= 10;
c= 4;

error = zeros(m,c+1,n);
conf = zeros(m,c,n,c);

c1=1:10;
c2=11:20;
c3=21:30;
c4=31:40;

% adding class label
Data(1:30,end+1)=1;
Data(31:60,end)=2;
Data(61:90,end)=3;
Data(91:120,end)=4;

for i =1 :m
%% Forming training and testing data
ind_a = randsample(1:30,10)'; 
ind_b = randsample(31:60,10)';
ind_c = randsample(61:90,10)';
ind_d = randsample(91:120,10)';
% 
% ind_a = (21:30)'; 
% ind_b = (51:60)'; 
% ind_c = (81:90)'; 
% ind_d = (111:120)'; 

ind_test = [ind_a;ind_b;ind_c;ind_d];
ind_train = setdiff((1:120)',ind_test);


%% PCA
[train_base,train_score]=pca(Data(ind_train,1:end-1));

% size(Data(ind_test,1:end-1))
% size(ones(size(ind_test,1),1)*mean(Data(ind_train,1:end-1),1))

test_score = (Data(ind_test,1:end-1)-ones(size(ind_test,1),1)*mean(Data(ind_train,1:end-1),1))*train_base;

train = [train_score(:,1:k),Data(ind_train,end)];
test = [test_score(:,1:k),Data(ind_test,end)];



% validate = train;  

%% Standarlization
m=mean(train(:,1:end-1));
S = cov(train(:,1:end-1));

train_std = [std_data(train(:,1:end-1),m,S),train(:,end)];
% validate_std = [std_data(validate(:,1:end-1),m,S),validate(:,end)];
test_std = [std_data(test(:,1:end-1),m,S),test(:,end)];

for j=1:n
%% NN classification
[W1,W2]=initial_NN(d,h,c,1);                      % initialization

[label,W1,W2]=NeuroNet_H1(train_std,c,2,W1,W2); %learning weights, mode = 2
label=NeuroNet_H1(test_std(:,1:end-1),c,0,W1,W2);  %test 

error(j,5,i) = sum(label~=test_std(:,end))/size(test_std,1);


error(j,1,i)=sum(label(c1)~=test_std(c1,end))/size(c1,2);
error(j,2,i)=sum(label(c2)~=test_std(c2,end))/size(c2,2);
error(j,3,i)=sum(label(c3)~=test_std(c3,end))/size(c3,2);
error(j,4,i)=sum(label(c4)~=test_std(c4,end))/size(c4,2);


% calculating the confusion matrix
conf(j,1,i,1)= sum(label(c1)==test_std(c1,end))/size(c1,2);
conf(j,2,i,1)= sum(label(c1)==test_std(c2,end))/size(c2,2);
conf(j,3,i,1)= sum(label(c1)==test_std(c3,end))/size(c3,2);
conf(j,4,i,1)= sum(label(c1)==test_std(c4,end))/size(c4,2);

conf(j,1,i,2)= sum(label(c2)==test_std(c1,end))/size(c1,2);
conf(j,2,i,2)= sum(label(c2)==test_std(c2,end))/size(c2,2);
conf(j,3,i,2)= sum(label(c2)==test_std(c3,end))/size(c3,2);
conf(j,4,i,2)= sum(label(c2)==test_std(c4,end))/size(c4,2);

conf(j,1,i,3)= sum(label(c3)==test_std(c1,end))/size(c1,2);
conf(j,2,i,3)= sum(label(c3)==test_std(c2,end))/size(c2,2);
conf(j,3,i,3)= sum(label(c3)==test_std(c3,end))/size(c3,2);
conf(j,4,i,3)= sum(label(c3)==test_std(c4,end))/size(c4,2);

conf(j,1,i,4)= sum(label(c4)==test_std(c1,end))/size(c1,2);
conf(j,2,i,4)= sum(label(c4)==test_std(c2,end))/size(c2,2);
conf(j,3,i,4)= sum(label(c4)==test_std(c3,end))/size(c3,2);
conf(j,4,i,4)= sum(label(c4)==test_std(c4,end))/size(c4,2);


end;  
end;



CM = [mean(mean(conf(:,:,:,1),3));
      mean(mean(conf(:,:,:,2),3));
      mean(mean(conf(:,:,:,3),3));
      mean(mean(conf(:,:,:,4),3));
      ];

% err_ave = mean(error) % last column is the overall error.

% N=int8(m*n);
% figure()
% for i=1:4
%   subplot(2,2,i)
%   histogram(reshape(error(:,i,:),N,1));
% end;
% 
% figure()
% histogram(reshape(error(:,5,:),N,1));
end