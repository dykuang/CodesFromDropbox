function [label,error]= DD_PCA_NN_H(train,Validate,Test,mode)
% Use a 3 layer neural network for classification
% The three input data sets (after standardlization) have to include a category label as the last
% column.

% Mode indicates the learning mode: 1: use validation set; 2: use stop
% criterion

% add path of NN folder
%  addpath('D:\life\Google\P&Oclassification\EE2015\EE5650_Project\Project3'); %office computer
%  addpath('E:\life\cloud drive\google drive\P&Oclassification\EE2015\EE5650_Project\Project3') %home computer
 
% [ellipse_feature,heart_feature] = generate(30,50,50);           % train
% [ellipse_feature_V,heart_feature_V] = generate(30,25,25);       % validate
% [ellipse_feature_T,heart_feature_T] = generate(30,50,50);       % test
% 
% train = [ellipse_feature;heart_feature];
% Validate = [ellipse_feature_V;heart_feature_V];
% Test = [ellipse_feature_T;heart_feature_T];
% 
% 
% 
% % adding category label
% train(1:50,end+1) = 1;
% train(51:100,end) = 2;
% Validate(1:25,end+1) = 1;
% Validate(26:50,end) = 2;
% Test(1:50,end+1) = 1;
% Test(51:100,end) = 2;
% 
% m=mean(train(:,1:end-1));
% S = cov(train(:,1:end-1));
% 
% %standarization 
% Train_std = std_data(train(:,1:end-1),m,S);
% Validate_std = [std_data(Validate(:,1:end-1),m,S),Validate(:,end)];
% Test_std = std_data(Test(:,1:end-1),m,S);
% 
% save('Validate_std.mat','Validate_std');


%% Neural Network Classification
% set architecture
d= 20; 
h= 27;
c= 4;


initial_NN(d,h,c,1);                      % initialization

NeuroNet_H1(train,c,mode); %learning weights
label=NeuroNet_H1(Test(:,1:end-1),c,0);  %test 

% error_total = sum(label~=Test(:,end))/size(Test,1);
% fprintf('The overall error is %.4f\n',error_total);

error = zeros(c,1);
% c1=1:50;   % index of ellilpse
% c2=51:100; % index of heart
% c3=101:116; %index of hand
% 
c1=1:10;
c2=11:20;
c3=21:30;
c4=31:40;

error(1)=sum(label(c1)~=Test(c1,end))/size(c1,2);
error(2)=sum(label(c2)~=Test(c2,end))/size(c2,2);
error(3)=sum(label(c3)~=Test(c3,end))/size(c3,2);
error(4)=sum(label(c4)~=Test(c4,end))/size(c4,2);


end