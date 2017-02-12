function I = template6(N)
% generate template half circle/ half ellipse

I=zeros(N,2);
theta=zeros(N,1);
%implemet I0
for i=1:N/2
    theta(i) = (i-1)*2.0*pi/N;
    I(i,1)=3.*cos(theta(i));
    I(i,2)=3.*sin(theta(i))-1;
end;  
for i=(N/2+1):N
    theta(i,1) = (i-1)*2.0*pi/N;
    I(i,1)=3.*cos(theta(i));
    I(i,2)=sin(theta(i))-1;
end; 
    plot([I(:,1);I(1,1)],[I(:,2);I(1,2)]);
    axis ([-5 5 -5 5]);
    axis square;
end