function [tsp,p,E,BE,Q,M1] = show_deformation()
% this function shows the grid deformation caused by landmark matching.
% thin plate spline is used.

N=28;
eps=0.3;
alpha2=.3;

% I=importdata('Cal_sch.mat');
% I0=I(:,:,1);
% I1=I(:,:,15);
% N=size(I0,1);
I0 = template2(N);
% I1 = template1(N);
% I1 = template_skewed_ellipse(N);
I1 = importdata('hand_sample.mat');
[d,I1] = procrustes(I0,I1);

%  I1(6,:)=I1(6,:)+[0,1];  %outlier landmark  ?how to compare difference?

% Add background noise
% noise_scale = I1/20;
% Noise = -noise_scale  + 2*noise_scale.*rand(N,2);
% I1 = I1+Noise;

% [Xq,Yq] = meshgrid(-4:0.2:4);

time=100;

P =shooting_be(N,eps,alpha2,I0,I1);

Q=zeros(N,2,time+1);
Q(:,:,1)=I0;

%calculate the kernel matrix

D=dist(I0');
K=2*D.^2.*log(D);
for i=1:N
    K(i,i)=0;
end;


for i=1:time
  [Q(:,:,i+1),P] = Flow_nu(Q(:,:,i),P,N,1,alpha2);




%scatteredInterpolant/interp2/griddedInterpolant/...
% Vqx = griddata(I0(:,1),I0(:,2),I1(:,1),Xq,Yq);
% Vqy = griddata(I0(:,1),I0(:,2),I1(:,2),Xq,Yq);

%use natural spline interpolation and extrapolation
% Fx = scatteredInterpolant(I0(:,1),I0(:,2),Q(:,1,i+1),'natural');
% Fy = scatteredInterpolant(I0(:,1),I0(:,2),Q(:,2,i+1),'natural');
% Vqx=Fx(Xq,Yq);
% Vqy=Fy(Xq,Yq);
% 
% figure(1)
% plot(Q(:,1,i),Q(:,2,i),'^-');
% %     axis([-4 4 -4 4])
% hold on
% for j=1:size(Vqx,1)
% plot(Vqx(j,:),Vqy(j,:),'k');
% end;
% for j=1:size(Vqx,2)
% plot(Vqx(:,j),Vqy(:,j),'k');
% end;
% axis equal
% axis([-4 4 -4 4])
% hold off
%     M(i) = getframe();
    
%use thin-spline-interpolation
[tsp,p] = tpaps(I0',Q(:,:,i+1)');
figure(2)
fnplt(tsp,{[-4,4],[-4,4]});

hold on;
plot(Q(:,1,i),Q(:,2,i),'^-');
axis([-4 4 -4 4])
hold off;
M1(i)=getframe();
end;
% figure
% movie(M,1);
figure
movie(M1,1);

%calculate bending and criterion value
W  = tsp.coefs(:,1:end-3);
BE = trace(W*K*W');

%calculate displacements
L=[K,I0,ones(N,1)]; %coeficient arrangements in Matlab

Fx=L*tsp.coefs(1,:)';
Fy=L*tsp.coefs(2,:)';

% plot(Fx,Fy,'*',I1(:,1),I1(:,2),'^');

E=p*BE+ norm(I1-[Fx,Fy]);

% figure(2)
% plot(I0(:,1),I0(:,2),'*');
% hold on
% for i=1:size(Xq,1)
% plot(Xq(i,:),Yq(i,:),'k');
% end;
% for i=1:size(Yq,2)
% plot(Xq(:,i),Yq(:,i),'k');
% end;
% hold off
% axis equal
% axis([-4 4 -4 4])
% 
% figure(3)
% plot(I1(:,1),I1(:,2),'*');
% hold on
% for i=1:size(Vqx,1)
% plot(Vqx(i,:),Vqy(i,:),'k');
% end;
% for i=1:size(Vqx,2)
% plot(Vqx(:,i),Vqy(:,i),'k');
% end;
% axis equal
% axis([-4 4 -4 4])
% hold off
end