function P = VtoP(I,V,N)
% convert tanget vector to momemtum vector

 P=zeros(N,2);
 G=zeros(N,N);
 d=zeros(N,N);

 
 d=Dist(I,N); 
 G=G_nu_0(2.,d);
     
 P = G\V;
 
end