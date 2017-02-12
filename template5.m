function I = template5(N)
%generate template: square

I=zeros(N,2);
h=16/N;
%implemet I0
for i=1:N/8
    I(i,1)= 2.;
    I(i,2)= (i-1)*h;
    
    I(i+N/8,1)= 2-(i-1)*h;
    I(i+N/8,2)= 2.;
    
    I(i+N/4,1)= -(i-1)*h;
    I(i+N/4,2)= 2.;
    
    I(i+3*N/8,1)= -2.;
    I(i+3*N/8,2)= 2.-(i-1)*h;
    
    I(i+N/2,1)= -2.;
    I(i+N/2,2)= -(i-1)*h;
    
    I(i+5*N/8,1)= -2.+(i-1)*h;
    I(i+5*N/8,2)= -2;
    
    I(i+6*N/8,1)= (i-1)*h;
    I(i+6*N/8,2)= -2;
    
    I(i+7*N/8,1)= 2.;
    I(i+7*N/8,2)= -2+(i-1)*h;
end;

    plot([I(:,1);I(1,1)],[I(:,2);I(1,2)]);
    axis ([-5 5 -5 5]);
    axis square;
end