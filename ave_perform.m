function [ave,overall]= ave_perform (Train,Validate,Test,m)

err = zeros(m,4);
for i=1:m
[label,err(i,:)] = DD_PCA_NN_H(Train,Validate,Test,2);

end;

for i =1 : 4
  subplot(2,2,i)
  histogram(err(:,i));
end;

  
ave = mean(err);
overall = sum(err,2)/4;


figure(2)
  histogram(overall);
end