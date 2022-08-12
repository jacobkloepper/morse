[x, fs] = audioread('Cw_morse.mp3');

% create bandpass filter
nyquist = fs/2;
band_lo = 700;
band_hi = 900;

band = [band_lo/nyquist band_hi/nyquist];
[b, a] = butter(6, band);

% apply filter
y = filter(b,a,x);

% cutoff amplitude
y_cutoff = 0.05;
y(abs(y) < y_cutoff) = 0;

plot(y)