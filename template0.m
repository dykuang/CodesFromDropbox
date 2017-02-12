function I0 = template0(N)
% generate template: a horizontal ellipse
I0=zeros(N,2);
theta=zeros(N,1);
%implemet I0
for i=1:N
    theta(i,1) = (i-1)*2.0*pi/N;
end;
    I0(:,1)=4*real(cos(theta));
    I0(:,2)=2*real(sin(theta));
%     
%     axis ([-5 5 -5 5]);
%     axis square;

end