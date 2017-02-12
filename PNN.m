function result = PNN(N,S,T,h1)
% Probability neural network, use original data.
% h1 is a resolution parameter needed to determined by training set
% d is the dimension

size_n= size(N,2);
size_s= size(S,2);
size_T = size(T,2);


% normalize the data
for i=1:size_n
    N(:,i) = N(:,i)/norm(N(:,i));
end;
for i=1:size_s
    S(:,i) = S(:,i)/norm(S(:,i));
end;
for i=1:size_T
    T(:,i) = T(:,i)/norm(N(:,i));
end;

%training/setting weight
z_n=N'*T;
z_s=S'*T;


%classifier
g_n = exp((z_n-1)/h1);  % "inluence" functions can be changed. Say H.
g_s = exp((z_s-1)/h1); 

result = (sum(g_n)/size_n/sqrt(size_n) < sum(g_s)/size_s/sqrt(size_s))';

end