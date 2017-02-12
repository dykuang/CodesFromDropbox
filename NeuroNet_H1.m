function [label,W1,W2] = NeuroNet_H1(Data,c,mode,W1,W2)
%[label,W1,W2] = NeuroNet_H1(Data,c,mode), handles details of the neuro net for learning and
%classification. The output depends on the mode argument.

%Data is the data after preprocess, i.e. standarlized.
%mode =1: learning, Data (after standarization, last column should contain class information.)
%is used for training having. A validation set is used to stop learning. label will contain labeling for
%validation set. W1, W2 are learned weights

%mode =2: learning, Data (after standarization, last column is label column)
% is used for training, use a threshold to stop learning. Label will
% be the label culumn of Data.

%mode =0: classification, Data is used as test, no label column.
% c is the number of categories. label is the classification result for
% Data.

%Copyright @ Dongyang Kuang & Zeng Li

% get data size
  N =size(Data,1);
  d =size(Data,2)-1;
  
% Load saved weights.
%     W1=importdata('W1.mat');
%     W2=importdata('W2.mat');

% STDdata = std_data(Data(:,1:d)); %standarlize data

%% Classification Mode
if mode==0
%    disp('Classification mode on')
%    disp('Classifcation in progress......')
  emit=feedforward(Data,W1,W2);
  %dealing with emit, assigning label
  [m_emit, label] = max(emit,[],2); 
%   save('label.mat','label');
%   label
%    disp('Classification complete')
 %% Stop training using validate set.
elseif mode==1
    
    %disp('Learning mode on, use validation set for stop')
    %disp('Learning in progress......')
    
    flag=0;   
    Validate=importdata('Validate_std.mat'); %load validate set for training 
    
    emit=feedforward(Validate(:,1:end-1),W1,W2);
    [m_emit, label] = max(emit,[],2);
    
    %calculate correction suc_pre
    suc_pre = sum(label==Validate(:,end))/size(Validate,1);   
    
    count=0;   %count the number of iterations/epochs
    while flag~=1
      %randomly choose a training data;
      count=count+1;
      ind=randi(N);
      sample=Data(ind,:);
      %set target value
      target=-ones(1,c);
      target(Data(ind,end))=target(Data(ind,end)) + 2;
      %update weights
     [W1p,W2p] = backpropagate(target,sample(1:d),W1,W2);
      %test on validation set
     emit=feedforward(Validate(:,1:d),W1p,W2p);
     [m_emit, label] = max(emit,[],2);
      %calculate correction suc
     suc = sum(label==Validate(:,d+1))/size(Validate,1);   
     if (suc<=suc_pre) && (suc>.90)
         flag=1;
         %fprintf('First local maxium of success rate %.4f encountered for validation set\n',suc_pre);
     else
        suc_pre=suc;
        W1=W1p;
        W2=W2p;
     end;
    end;   
    %disp('Learning complete! Weights saved.')
   % fprintf('%d training points have been used\n',count);
%     save('W1.mat','W1');
%     save('W2.mat','W2');
    
    %% Stop learning using a threshold.
elseif mode==2 
    dJ=1;
    stop=0.02; %set threshold 
    label=Data(:,end);
%     disp('Learning mode on, use a threshold for stop')
%     disp('Learning in progress......')
    count=0;
    while(dJ>stop)
        count=count+1;
        ind=randi(N);
        sample=Data(ind,:);
        target=-ones(1,c);
        target(Data(ind,end))=target(Data(ind,end)) + 2;
%         target=Data(ind,d+1); %used for dichotomizer
        [W1,W2,emit] = backpropagate(target,sample(1:d),W1,W2);
        dJ = norm(target-emit);
    end;  
%     disp('Learning complete! Weights saved.')
%     fprintf('%d training data have been used\n', count)
%     save('W1.mat','W1');
%     save('W2.mat','W2');
    
%% Deal with the wrong input
else
    fprintf('Mode %d not supported. Please choose the right mode:\n',mode);
    fprintf('0 for classifcation\n');
    fprintf('1 for learning with a validation set\n'); 
    fprintf('2 for learning stopped by a threshold\n');
        
end

end