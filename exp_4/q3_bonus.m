x=[1,2,3,4,5,6,7,8,9,2,3,4,1,2,3,5,1,78,4,3,6,93];
h=[1,2,3,4,2,5,1];
block_size=length(h);

n = length(h);
l = length(h);
max_length = length(x)+length(h)-1;

y=zeros(1,max_length);

tic
for i=1:block_size:length(x)

    % creating block sizes from x
    if i+block_size>length(x)
        x1=x(i:end);
        x1=[x1,zeros(1,block_size-length(x1))];
    else
        x1=x(i:i+block_size-1);
    end

    % convolving
    y1=conv(x1,h);
    y1=[y1,zeros(1,max_length-length(y1)-i+1)];
    
    % adding convolved solution by overlap and save
    if i==1
        y=y1;
    else
        for j=i:max_length
            y(j)=y(j)+y1(j+1-(i));
        end
    end

end

y2=conv(h,x);
if(y==y2) 
    disp('true');
end
disp(toc)