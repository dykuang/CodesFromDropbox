function [P,P_major,H_piece_sorted,H_piece_index,H_major,H,H_piece]= DD_PCA_P(I0,I1,k,flag)
%A deformation decomposition based on PCA on H-matrix and P-representation of 
%target template. flag for supress the graph.

%Task: use this PCA for classification. Use different data (Hand, MWing...)
%for test after mode the affine effects.

% initialization of parameters
eps=0.3;
alpha2=.3;
nu=1.5;
n=100;

% loading templates 
N=size(I0,1);

% PCA with different kernels
 % calculate kernel

% [V,D]=eig(eye(N));

% L = D(1:N+1:end);

% extract info to P
[P,u,H] =shooting_be(N,eps,alpha2,I0,I1);

% Projection on major axis
% PV=P'*V;

% partition H into pieces in descending order according to major axis
H_piece = 0.5*(P(:,1).^2+P(:,2).^2);

[H_piece_sorted,H_piece_index] = sort(H_piece,'descend');

% select major parts
% major_part = H_piece_index(1:k);

P_major = zeros(N,2,k);

% Show each piece of major decompositions
% for i=1:k
% 
% ith_component = [P(1,major_part(i)),...
%     P(2,major_part(i))];
% 
% [Q1,P1a] = Flow_nu(I0,ith_component,N,n,alpha2);
% 
% P_major(:,:,i) = ith_component;
% if flag
%   figure(i)
%   plot(Q1(:,1),Q1(:,2),'*-');
%   axis equal
%   [tsp,p] = tpaps(I0',Q1');
%   hold on
%   fnplt(tsp,{[-4,4],[-4,4]});
%   axis([-5 5 -5 5])
% hold off
% end;
% end;


% Plot the truncated deformation
% [Q_major] = Flow_nu(I0,sum(P_major,3),N,n,alpha2);
H_major = sum(H_piece_sorted(1:k));
% 
% if flag
%   figure(k+1)
%   p1=plot(Q_major(:,1),Q_major(:,2),'*-'); %plot the landmark postion by major deformation
%   axis equal
%   [tsp,p] = tpaps(I0',Q_major');
%   hold on
%   fnplt(tsp,{[-4,4],[-4,4]});
%   axis([-5 5 -5 5])
%   p2=plot(I1(:,1),I1(:,2),'k^-');   %plot the true landmark position
%   hold off
%   legend([p1 p2],'approximated position','true position');
% % 0.5*trace(PV*D*PV')-H
%   
%   figure(k+2)
%   plot(I0(:,1),I0(:,2),'*-'); 
%   axis equal
%   [tsp,p] = tpaps(I0',I0');
%   hold on
%   fnplt(tsp,{[-4,4],[-4,4]});
%   axis([-5 5 -5 5]);
%   hold off;
%   
%   figure(k+3)
%   stem(H_piece_sorted);
% end;

% fprintf('The true H: %f\n', H);
% fprintf('The truncated H: %f\n', H_major);
end