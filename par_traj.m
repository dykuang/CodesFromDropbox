function [Q_tra]= par_traj(m)
% show the trajactory of two particle dynamics

% Q1=zeros(1,2);
% Q2=[0, 0.15];
% 
% P1= [15 0];
% P2 = P1;


Q1=[-0.4 ,-0.125];
Q2=-Q1;

P1=[20, 0];
P2=-P1;

Q=[Q1;Q2];
P=[P1;P2];

N=size(Q,1);

Q_tra=zeros(m+1,2,2);
Q_tra(1,:,1)=Q1;
Q_tra(1,:,2)=Q2;
for i=1:m
   [Q,P] = Flow(Q,P,N,1,1.0);
   Q_tra(i+1,:,1)=Q(1,:);
   Q_tra(i+1,:,2)=Q(2,:);
end

figure()
plot(Q_tra(:,1,1),Q_tra(:,2,1),'r');
hold on
plot(Q_tra(:,1,2),Q_tra(:,2,2),'k');
hold off
end