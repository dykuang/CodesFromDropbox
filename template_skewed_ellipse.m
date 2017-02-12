function I = template_skewed_ellipse(N)
% generate template: a rotated and shifted ellipse
I=zeros(N,2);
theta=zeros(N,1);
%implemet I0
for i=1:N
    theta(i,1) = (i-1)*2.0*pi/N;
end;
%     I0(:,1)=4*real(cos(theta));
%     I0(:,2)=real(sin(theta));
% % rotation
%     R=[cos(pi/4),-sin(pi/4);
%        sin(pi/4),cos(pi/4)];
%     I0=I0*R;
% % shift
%     I0(:,1) = I0(:,1) +1;

theta=theta+pi/2;

I(:,1)=4*real(cos(theta))*cos(pi/4.)+sin(pi/4.)*sin(theta)+1;
I(:,2)=real(sin(theta))*cos(pi/4.)-4*sin(pi/4.)*cos(theta);


% 
% hold on
% for i=1:N
%  plot(I(i,1),I(i,2),'*');
% 
% text(I(i,1),I(i,2),(num2str(i)));
% 
% end;
% hold off


end