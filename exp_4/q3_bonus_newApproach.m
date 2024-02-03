x=audioread('./Support files/acoustic.wav');
h=audioread('./Support files/moosic.wav');
x=x';
h=h';
block_size=length(h);
h1=h;
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
    
    % covolving via conv choose this or the other
    disp('time taken via normal overlap and add : ')
    y1=conv(x1,h);
        
    % convolving via fft
    % disp('time taken via fft method convolving in overlap and add : ')
    % x1=[x1,zeros(1,length(h)-1)];
    % h1=[h,zeros(1,block_size-1)];
    % X=fft(x1);
    % H=fft(h1);
    % Y=X.*H;
    % y1=ifft(Y);

    y1=[y1,zeros(1,max_length-length(y1)-i+1)];
    
    % adding convolved solution by overlap and save
    
    y(i:end) = y(i:end) + y1(1:length(y)-i+1);

end
disp(toc)
y2=conv(x,h);
subplot(2,2,1)
stem(x,'k.-')
title('input signal')
xlabel('time (n)')
ylabel('Amplitude')
% xlim([-1,22])

subplot(2,2,2)
stem(h,'r.-')
title('impulse response')
xlabel('time (n)')
ylabel('Amplitude')
% xlim([-1,7])
% ylim([0,5.3])

subplot(2,2,3)
stem(y,'r.-')
title('convoluted signal using overlap and add')
xlabel('time (n)')
ylabel('Amplitude')
% xlim([-1,29])


subplot(2,2,4)
stem(y2,'k.-')
title('convoluted signal using direct convolution')
xlabel('time (n)')
ylabel('Amplitude')
% xlim([-1,29])


