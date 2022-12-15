%NOT MY SHIT

clc; clear;
close all;

Fs = 100;
T = 1/Fs;
N0 = 90
nfft = 128;

%%% Q1 %%%
t = 0:T:0.9;

x1 = cos (4*pi*t);
x2 = cos (20*pi*t);
x3 = cos (40*pi*t);

f1 = x1/3+x2/3+x3/3;
X1 = fft(f1, nfft)/N0;
X_1 = X1(1:nfft/2);

mx1 = abs(X_1);
f_1 = (0:nfft/2-1)*Fs/nfft;


figure(1)
plot(t,f1)
hold on
stem(t, f1)
title('f1(t) Wave Signal for 100 Hz sampling frequency')
xlabel('Time (s)')
ylabel('Amplitude')

figure(2)
plot(f_1, mx1)
hold on
stem(f_1, mx1)
title('Spectrum of f1(t) Wave for 100 Hz sampling frequency')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

%%% Q2 %%%
t2_1 = 0:T:0.3;
t2_2 = 0.3:T:0.6;
t2_3 = 0.6:T:0.9;

x1 = cos (4*pi*t2_1);
x2 = cos (20*pi*t2_2);
x3 = cos (40*pi*t2_3);

X2 = x1+x2+x3;
X2= fft(X2, nfft)/N0;
X2 = X2(1:nfft/2);
mx2 = abs(X2);
f2 = (0:nfft/2-1)*Fs/nfft;


% X2_1= fft(x1, nfft);
% X2_1 = X2_1(1:nfft/2);
% mx2_1 = abs(X2_1);
% f2_1 = (0:nfft/2-1)*Fs/nfft;
% 
% X2_2= fft(x2, nfft);
% X2_2 = X2_2(1:nfft/2);
% mx2_2 = abs(X2_2);
% f2_2 = (0:nfft/2-1)*Fs/nfft;
% 
% X2_3= fft(x3, nfft);
% X2_3 = X2_3(1:nfft/2);
% mx2_3 = abs(X2_3);
% f2_3 = (0:nfft/2-1)*Fs/nfft;
% 
% f2 = f2_1+f2_2+f2_3;
% mx2 = mx2_1+mx2_2+mx2_3;


figure(3)
plot(t2_1,x1)
hold on
stem(t2_1, x1)
hold on
plot(t2_2,x2)
hold on
stem(t2_2, x2)
hold on
plot(t2_3,x3)
hold on
stem(t2_3, x3)

title('f2(t) Wave Signal for 100 Hz sampling frequency')
xlabel('Time (s)')
ylabel('Amplitude')

figure(4)
plot(f2, mx2)
hold on
stem(f2, mx2)

title('Spectrum of f2(t) Wave for 100 Hz sampling frequency')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

%%% Q3 %%%
t3_1 = 0:T:0.3;
t3_2 = 0.3:T:0.6;
t3_3 = 0.6:T:0.9;

x1 = cos (4*pi*t3_3);
x2 = cos (20*pi*t3_2);
x3 = cos (40*pi*t3_1);

X3 = x1+x2+x3;
X3= fft(X3, nfft)/N0;
X3 = X3(1:nfft/2);
mx3 = abs(X3);
f3 = (0:nfft/2-1)*Fs/nfft;

% X3_1= fft(x1, nfft);
% X3_1 = X3_1(1:nfft/2);
% mx3_1 = abs(X3_1);
% f3_1 = (0:nfft/2-1)*Fs/nfft;
% 
% X3_2= fft(x2, nfft);
% X3_2 = X3_2(1:nfft/2);
% mx3_2 = abs(X3_2);
% f3_2 = (0:nfft/2-1)*Fs/nfft;
% 
% X3_3= fft(x3, nfft);
% X3_3 = X3_3(1:nfft/2);
% mx3_3 = abs(X3_3);
% f3_3 = (0:nfft/2-1)*Fs/nfft;
% 
% f3 = f3_1+f3_2+f3_3;
% mx3 = mx3_1+mx3_2+mx3_3;


figure(5)
plot(t3_3,x1)
hold on
stem(t3_3, x1)
hold on
plot(t3_2,x2)
hold on
stem(t3_2, x2)
hold on
plot(t3_1,x3)
hold on
stem(t3_1, x3)

title('f3(t) Wave Signal for 100 Hz sampling frequency')
xlabel('Time (s)')
ylabel('Amplitude')

figure(6)
plot(f3, mx3)
hold on
stem(f3, mx3)

title('Spectrum of f3(t) Wave for 100 Hz sampling frequency')
xlabel('Frequency (Hz)')
ylabel('Amplitude')


