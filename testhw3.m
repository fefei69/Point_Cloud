%FFT of a signal
%%
freq = 100;
SR = 1/freq;
en = 1;
t_fourier = 0:1/(freq):1;
t = 0:SR:en;
t2 = 0:1/1000:en;
x_fourier = cos(2*pi*40*t_fourier);
x = cos(2*pi*40*t);
x2 = cos(2*pi*40*t2);
%subplot(211);
plot(t,x,"rx-",t2,x2,"black-");
%plot(t,x,"b-");
ylim([-1,1]);
title("Sampled Signal")
xlabel('Time (s)'); ylabel('x');
legend('SampleRate=100hz','SampleRate=1000hz');
%saveas(gcf,"sampling_100hz.png")
%%
f = fft(x_fourier);
[fangle, fmag] = cart2pol(real(f),imag(f));

subplot(212);
k = 0:freq;k=k';
plot(k,fmag)
title("Amplitude spectrum")
xlabel('Frequency (Hz)'); ylabel('Amplitude');
%saveas(gcf,"fft_60hz.png")