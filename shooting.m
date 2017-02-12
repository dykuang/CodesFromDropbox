function P = shooting()
% The very prototype of "shooting" function
n=100; %should be choosen so that ndt=1 in function Flow;
N=36;
tol=1.0e-2;
eps=1;
count=0;
I=template0(N);
I1=template1(N);
%V=zeros(N,2);
%P=zeros(N,2);
error=1;
tic;

while error>tol
    V = V_corr(I,I1,eps);
    P = VtoP(I,V,N);
    I = Flow(I,P,N,n);
    error=max(max(abs(V_corr(I,I1,eps))));
    count=count+1;
    figure(count);
    plot(I(:,1),I(:,2));
    axis([-4 4 -6 6]);
end;
toc

end