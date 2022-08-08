% Get waveform samples
[x, fs] = audioread('cw.wav');

% create bandpass filter
nyquist = fs/2;
band_lo = 1450;
band_hi = 1550;

band = [band_lo/nyquist band_hi/nyquist];
[b, a] = butter(10, band);

% apply filter
y = filter(b,a,x);
y2 = y;

% cutoff amplitude
y_cutoff = 0.03;
y(abs(y) < y_cutoff) = 0;

figure
plot(y)

% TODO:
% 1. Find T (unit time)
%   a. morse: dit (T), dah (3*T), intra-letter space (T), inter-letter
%   space (3*T), inter-word space (7*T)
% 2. Represent signal as binary sequence using above
% 3. Translate

% T0 and T3 are periods of dits and dahs by statistical analysis
% By morse spec, T3 ~= 3*T1
[T1, T3] = get_time_unit(y,fs);
