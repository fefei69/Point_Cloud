%FFT of a signal
%%
clc; clear;
close all;
freq = 100;
SR = 1/freq;
Y = linspace(0,0.3);
t_fourier = 0:1/(freq):1;
t1 = 0:1/freq:1-0.01;
x_fourier = cos(2*pi*2*t_fourier)+cos(2*pi*10*t_fourier)+cos(2*pi*20*t_fourier);
u = heaviside(t1+0.01)-heaviside(t1-0.4+0.01);
u1 = heaviside(t1-0.4+0.01)-heaviside(t1-0.7+0.01);
u2 = heaviside(t1-0.7+0.01)-heaviside(t1-1);
c1 = cos(2*pi*2*t1).*u;
c2 = cos(2*pi*10*t1).*u1;
c3 = cos(2*pi*20*t1).*u2;
f1 = c1+c2+c3;
h =  heaviside(t1+0.01)-heaviside(t1-0.3+0.01);
h1 =  heaviside(t1-0.3+0.01)-heaviside(t1-0.6+0.01);
h2 =  heaviside(t1-0.6+0.01)-heaviside(t1-1);
f2 = cos(2*pi*20*t1).*h + cos(2*pi*10*t1).*h1 + cos(2*pi*2*t1).*h2;
%s = cos(2*pi*10*t1);
%%
%Q1-1
plot(t_fourier,x_fourier,"b-");
xlabel('Time (s)'); ylabel('f_1(t)');
%saveas(gcf,'C:/Users/User/Desktop/q1-1.png')
%legend('SampleRate=100hz','SampleRate=1000hz');
%%
%Q1-2 
f = fft(x_fourier,100)/100;
f=f(1:freq/2);
[fangle, fmag] = cart2pol(real(f),imag(f));
k = 0:freq/2-1;k=k';
stem(k,fmag)
title("Amplitude spectrum")
xlabel('Frequency (Hz)'); ylabel('D_n');
saveas(gcf,'C:/Users/User/Desktop/q1-2.png')
%%
%Q2-1
plot(t1,f1,"b-");
title("f_1")
xlabel('Time (s)'); ylabel('f_1(t)');
%saveas(gcf,'C:/Users/User/Desktop/q2-1.png')
%%
%Q2-2
ff2 = fft(f1,100)/100;
ff2=ff2(1:freq/2);
[f2angle, f2mag] = cart2pol(real(ff2),imag(ff2));
k = 0:freq/2-1;k=k';
plot(k,f2mag)
hold on
stem(k,f2mag)
title("Amplitude spectrum")
xlabel('Frequency (Hz)'); ylabel('D_n');%%
saveas(gcf,"C:/Users/User/Desktop/q2-2.png")
%%
%Q3-1
plot(t1,f2,"b-");
title("f_2")
xlabel('Time (s)'); ylabel('f_2(t)');
%hold on 
%stem(t1,h1,"b-");
%測試三個接在一起的正確性
%subplot(211);
%plot(t1, cos(2*pi*2*t1),"r-",t1,h2,"b-");
%subplot(212);
%plot(t1, s,"r-",t1,h1,"b-");
%saveas(gcf,"C:/Users/User/Desktop/q3-1.png")
%%
%Q3-2
ff3 = fft(f2,100)/100;
ff3=ff3(1:freq/2);
[f3angle, f3mag] = cart2pol(real(ff3),imag(ff3));
k = 0:freq/2-1;k=k';
plot(k,f3mag)
hold on
stem(k,f3mag)
title("Amplitude spectrum")
xlabel('Frequency (Hz)'); ylabel('D_n');%%
saveas(gcf,"C:/Users/User/Desktop/q3-2.png")
%%