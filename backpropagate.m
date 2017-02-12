function [W1,W2,emit] = backpropagate(target,data,W1,W2)
%[W1,W2,emit] = backpropagate(target,data,W1,W2) conducts the
%backpropagation of the neuro net.

%target is the desired output set for learning 
%data must be after standarization.
%W1: (d+1) by h matrix, contains current weights from input to hidden
%W2 (1+h) by c matrix, contains current weights from hidden to output

eta=.1; %update step length

[emit,Yh,netJ,netK]=feedforward(data,W1,W2);

delta_K = (target-emit).*activate_p1(netK);
delta_J = (delta_K*W2(2:end,:)').*activate_p1(netJ);


dW1=eta*[ones(1,size(data,1));data']*delta_J; % transpose of data may not be efficient depending stochastic/batch learning
dW2=eta*[ones(1,size(Yh,1));Yh']*delta_K;

W1=W1+dW1;
W2=W2+dW2;


end