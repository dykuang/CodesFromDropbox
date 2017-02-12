function I1 = template1(N)
% generate template: heart
I1=zeros(N,2);
theta=zeros(N,1);
%implement I1
for i=1:N
    theta(i,1)=(i-1)*2*pi/N;
end;

% load data;
%I1=importdata('Q3.mat');


% a close circle
%  I1(:,1)=(2.1)*cos(theta);
%  I1(:,2)=(2.1)*sin(theta);

% a rotated ecllipse
%  I1(:,1)=1+4*cos(theta)*cos(pi/4)+sin(theta)*sin(pi/4);
%  I1(:,2)=sin(theta)*cos(pi/4)-4*cos(theta)*sin(pi/4);

% heart curve
% I1(:,1)=cos(theta).*(1-sin(theta));
% I1(:,2)=sin(theta).*(1-sin(theta));

%another heart curve
I1(:,2)= (16*sin(theta).^3)./5;
I1(:,1)= (13*cos(theta)-5*cos(2*theta)-2*cos(3*theta)-cos(4*theta))./5;


%plot([I1(:,1);I1(1,1)],[I1(:,2);I1(1,2)]);
end