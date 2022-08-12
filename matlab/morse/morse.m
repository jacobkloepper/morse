% Get waveform samples
%[x, fs] = audioread('cw.wav');
[x, fs] = audioread('Cw_morse.mp3');
L = length(x);
NFFT = 2^nextpow2(L);
X = fft(x,NFFT)/L;
f = fs/2*linspace(0,1,NFFT/2+1);

% create bandpass filter
nyquist = fs/2;
% cw.wav: 1500
% Cw_morse.mp3: 800
peak_w = get_cw_freq(X);
band_lo = peak_w-100;
band_hi = peak_w+100;

band = [band_lo/nyquist band_hi/nyquist];
[b, a] = butter(5, band);

% apply filter
y = filter(b,a,x);
Y = fft(y,NFFT)/L;

% normalize
y_cutoff = 0.05;
y(abs(y) < y_cutoff) = 0;
y(y ~= 0) = 1;

% signal display
subplot(2,2,1)
plot(f, 2*abs(X(1:NFFT/2+1)))
title('pre-filter (fft)')

subplot(2,2,2)
plot(f, 2*abs(Y(1:NFFT/2+1)))
title('filtered (fft)')

subplot(2,2,3)
plot(x)
title('pre-filter')

subplot(2,2,4)
plot(y)
title('filtered')

sound(y, fs)

% TODO:
% 1. Find T (unit time)
%   a. morse: dit (T), dah (3*T), intra-letter space (T), inter-letter
%   space (3*T), inter-word space (7*T)
% 2. Represent signal as binary sequence using above
% 3. Translate

% T1 and T3 are periods of dits and dahs by statistical analysis
% By morse spec, T3 ~= 3*T1
% From initial sample test, d_avg=557,D_avg=1406 D_avg/(3d_avg)=0.84
% Give \pm20%?
[T1, T3, T_seq] = get_time_unit(y,fs);

code = get_binary_repr(T1,T3,T_seq);

translated = morse_to_english(code);

disp(translated)