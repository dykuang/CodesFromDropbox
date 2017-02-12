function [result] = G_nu_0(nu,alpha2,r)
% calculates the kernel


shift = 1e-30;
%scaler = shift.^(nu-1).*besselk(1-nu,shift)./(2*pi*gamma(nu));
%rn=length(r(1,:));
%cn=length(r(:,1));
%Zeros = zeros(rn,cn);

r = abs(r) + shift*(r==0); %sign

% if r==0
%     result= G_nu_0(nu,1e-20);
% else
%        result=r.^(nu-1).*besselk(nu-1,r/sqrt(alpha2))/(2^nu*pi*gamma(nu)*sqrt(alpha2)^(nu+1));
%    result= result*2*pi;
%  result= exp(-r.^2/alpha2);
 result=exp(-r/sqrt(alpha2));


 end

