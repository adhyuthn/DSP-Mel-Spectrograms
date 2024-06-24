hold on
% N= 1:30
x1= zeros(1,30)
x2= zeros(1,30)
% x1l = length(x1);
% 
% x1l = length(x1);
for i = 5:12
    x1(i)= 1
end
for i = 5:12
    x2(i)= 1
end

stem(N,x1)
stem(N,x2)
convo1 = conv(x1, x2);

stem(N,convo1)
% 
% function convo = manual_convo(x1, x2)
%     m = length(x1)
%     n= length(x2)
%     o= m+n-1
%     for i = 1:o
%         y(i)=0: 
%         for j= 1:m
%             if i+j-1=0 
        