function result = PNN_H(N,S,T,h)
% Probability neural network, using H
% Input format is different()
% (h=0.05) is a resolution parameter needed to determined by training set
% d is the dimension


LN=13; % focused on landmarks 
size_n= size(N,3);
size_s= size(S,3);
size_T = size(T,3);


% % normalize the data
% for i=1:size_n
%     N(:,i) = N(:,i)/norm(N(:,i));
% end;
% for i=1:size_s
%     S(:,i) = S(:,i)/norm(S(:,i));
% end;
% for i=1:size_T
%     T(:,i) = T(:,i)/norm(N(:,i));
% end;

%training/setting weight [P,H]=shooting_be(N,eps,alpha2,I0,I1)
g_n=zeros(size_n,1);
g_s=zeros(size_s,1);
result=zeros(size_T,1);
for j=1:size_T
  for i=1:size_n
   [P,g_n(i)] = shooting_be(LN,.6, 1., N(:,:,i),T(:,:,j));   
  end;

  for i=1:size_s
   [P,g_s(i)] = shooting_be(LN,.6, 1., S(:,:,i),T(:,:,j)); 
  end;
%classifier
  result(j) = (sum(exp(-g_n/h))/size_n/sqrt(size_n) < sum(exp(-g_s/h))/size_s/sqrt(size_s))';
end;





end