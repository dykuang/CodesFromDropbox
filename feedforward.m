function [emit,Yh,netJ,netK]=feedforward(data,W1,W2)
%[emit,Yh,netJ,netK]=feedforward(data,W1,W2) conducts the feedforward
%process of the neuro net work.

%emit is the value of activate function on each category
%Yh is the emit value from hidden units;
%netJ is the net value fed to hidden units;
%netK is the net value fed to output units

%data must be after standarization.
%W1: (d+1) by h matrix, contains weights from input to hidden
%W2 (1+h) by c matrix, contains weights from hidden to output

netJ = [ones(size(data,1),1),data]*W1;

Yh = activate(netJ);

netK= [ones(size(Yh,1),1),Yh]*W2;

emit=activate(netK); % watch out for dimensions

end