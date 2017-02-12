function []=show_trajactory(eps,alpha2,I0,I1)
% visualize the trajactory in subspaces, n is the index of subspace wanted
% to projecte to.

N=size(I0,1);
time=100;

P =shooting_be(N,eps,alpha2,I0,I1);

Q=zeros(N,2,time+1);
Q(:,:,1)=I0;


% q=zeros(time,2,N);
for i=1:time
  [Q(:,:,i+1),P] = Flow_nu(Q(:,:,i),P,N,1,alpha2);
%   q(i,:,n)=Q(n,:);
end;

% away = sum(q(:,2)-(I1(n,2)-I0(n,2))/(I1(n,1)-I0(n,1))*(q(:,1)-I0(n,1))-I0(n,2))

figure(1)
hold on
for n=1:N
    q=reshape(Q(n,:,:),2,time+1)';
plot(q(:,1),q(:,2),'^-');
axis equal
end;
plot(I0(:,1),I0(:,2),'b',I1(:,1),I1(:,2),'r')
hold off
title('trajactory projected on 2d subspace');

figure(2)
 u = uicontrol('Style','slider','Position',[10 50 20 340],...
     'Min',1,'Max',101,'Value',1);
% M=movie
for k = 1:time
plot(Q(:,1,k),Q(:,2,k),'^-');
    axis([-4 4 -4 4])
    u.Value = k;
    M(k) = getframe(gcf);
end
figure
movie(M,1);
end