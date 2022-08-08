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
y(abs(y)<0.025) = 0;


figure
plot(y)
figure
plot(y2)