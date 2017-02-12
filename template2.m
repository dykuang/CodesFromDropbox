function I = template2(N)
%generate template: a bigger circle
I=zeros(N,2);
theta=zeros(N,1);
%implemet I0
for i=1:N
    theta(i,1) = (i-1)*2.0*pi/N;
end;
    I(:,1)=3*real(cos(theta));
    I(:,2)=3*real(sin(theta));
    
%     plot([I(:,1);I(1,1)],[I(:,2);I(1,2)]);
%     axis ([-5 5 -5 5]);
%     axis square;
end