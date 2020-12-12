Fs = 1000;
T = 1/Fs;
L = 1500;
t = (0:L-1)*T;

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));

figure(4);
%plot(1000*t(1:50), X(1:50))

Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2 + 1);
P1(2:end - 1) = 2*P1(2:end - 1);

 f = Fs*(0:(L/2))/L;
 
 plot(f, P1);
 
 Y = fft(test);
 P2 = abs(Y/length(test));
 P1 = P2(1:length(test)/2+1);
 P1(2:end-1) = 2*P1(2:end-1);
 
 f = 100*(0:(length(test)/2))/length(test);
 plot(f, P1);
