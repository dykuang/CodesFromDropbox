function [W1,W2] = initial_NN(d,h,c,mode)
%[W1,W2] = initial_NN(d,h,c) is used to initiate the weight for neuro net.
%W1 is the weight from input to hidden
%W2 is the weight from hidden to output
%W1 and W2 will be saved as m-files under the current directory.
%d is the dimension of features, h is the number of hidden units, c is the
%number of categories.
%mode is used to select different initiallization method. (Currently only have one)

r1=1/sqrt(d+1);
r2=1/sqrt(h+1);

%clear possible variable with the same name.
if mode==1
clear W1;
clear W2;

W1 = unifrnd(-r1,r1,d+1,h);
W2 = unifrnd(-r2,r2,h+1,c);

% save('W1.mat','W1');
% save('W2.mat','W2');

%other methods.


end;
end