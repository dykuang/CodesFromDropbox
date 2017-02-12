function [result] = DD_PCA_classfication_test(k,method)
% Test the performance of the PCA procedure in classifying basic shapes.
N=24;
I0=template6(N);     % store the base shape as reference 

if (method ==1)
Data = zeros(N,2,4);  % store shapes waited to be classified


%% Go through a procrustes process or other preprocess

[d,Data(:,:,1)]=procrustes(I0,template1(N));
[d,Data(:,:,2)]=procrustes(I0,template0(N));
[d,Data(:,:,3)]=procrustes(I0,template3(N));
[d,Data(:,:,4)]=procrustes(I0,template4(N));
[d,Data(:,:,5)]=procrustes(I0,template5(N));
[d,Data(:,:,6)]=procrustes(I0,template6(N));


%% Extract momentum information in PCA representation. 
for i=1:6
    [PV,V,P_major,H_piece_sorted,H_piece_index, H_major, H]= DD_PCA(I0,Data(:,:,i),k,0);
    for j=1:k
        feature(j)=trace(P_major(:,:,j)'*P_major(:,:,j));
    end;
    figure(i)
    stem(feature);
end;
result = 1;
% a=Data(:,:,2);
% plot(a(:,1),a(:,2));


%% A different philosophy using training set i.e. deciding a coming template to which bin.
else
%% Training procedure is just by calculating "average"
train = zeros(N,2,6);

Rep =zeros(N,2,6); % representaion after procruste fit to each training template

train(:,:,1) = template1(N);
train(:,:,2) = template2(N);
train(:,:,3) = template3(N);
train(:,:,4) = template4(N);
train(:,:,5) = template5(N);
train(:,:,6) = template6(N);



%% Extract momentum information in PCA representation.
% w=1;  %weight between different distance
for i=1:6
%      [d,Rep(:,:,i)]=procrustes(train(:,:,i),I0); % procruste fit I0 to each training pattern
     [d,Rep(:,:,i)]=procrustes(I0,train(:,:,i));
    [PV,V,P_major,H_piece_sorted,H_piece_index, H_major, H]= DD_PCA(I0,Rep(:,:,i),k,0);
%     for j=1:k
%         feature(j)=trace(P_major(:,:,j)'*P_major(:,:,j));
%     end;
%     figure(i)
%     stem(feature);
    dist(i) = trace(sum(P_major,3)'*sum(P_major,3));
end;
[z, result] = sort(dist,'ascend');
fprintf('the ranking is\n');
result

end;


end