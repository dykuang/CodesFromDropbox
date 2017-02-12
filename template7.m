function I = template7(N)
%generate template: diamond

side_point = N/4;
space = 2/side_point;

% I = zeros(N,2);

    I(1:side_point,:)=[2:-space:space; 2-(2:-space:space)]';
    I((side_point+1):2*side_point,:) = [0:-space:(-2+space); 2+(0:-space:(-2+space))]';
    I((2*side_point+1):3*side_point,:) = [-2:space:-space; -2-(-2:space:-space)]';
    I((3*side_point+1):N,:) = [0:space:(2-space); (0:space:(2-space))-2]';

% plot(I(:,1),I(:,2));
end