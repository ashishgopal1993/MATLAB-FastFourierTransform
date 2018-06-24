% Title: Fast Fourier Transform of given signals
% Aim: To prove that FFT can not identify change in sequence of signal.
% Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
% Department: Department of Electronics Engineering
% Mentor: Dr. Nirmal, HOD
% Department: Department of Electronics Engineering
% Date: 26/09/2017

% ***************Program starts here*************************

% Frequency signals declarations
fs = 1000;  % Sampling frequency
f1 = 10;    % 10 Hz
f2 = 50;    % 50 Hz
f3 = 100;   % 100 Hz

% Signal duration declarations
ts = 1/fs;                          % Sampling period or signal duration
dt = 0:ts:2-ts;                     % Signal duration
dt1 = 0:ts:((2-ts)/3);              % Signal duration 1
dt2 = ((2-ts)/3):ts:(2*(2-ts)/3);   % Signal duration 2
dt3 = (2*(2-ts)/3):ts:2-ts;         % Signal duration 3

% Amplitude [V] declarations
A = 10;     % in Volts
B = 10;     % in Volts
C = 10;     % in Volts

% Signal description
% Generating Signal I
X = A*sin(2*pi*f1*dt) + B*sin(2*pi*f2*dt) + C*sin(2*pi*f3*dt);

% Generating Signal II
x1 = A*sin(2*pi*f1*dt1) + B*sin(2*pi*f2*dt1) + C*sin(2*pi*f3*dt1);

% Generating Signal III
p1 = A*sin(2*pi*f1*dt1);
p2 = B*sin(2*pi*f2*dt2);
p3 = C*sin(2*pi*f3*dt3);
x2 = [p1 p2 p3];

% Applying FFT
nfftX = length(X);
nfftX1 = 2^nextpow2(nfftX);
Y = fft(X,nfftX1);     
xY = fs*(0:nfftX1/2-1)/nfftX1;
Y1 = Y(1:nfftX1/2);         % FFT of Signal I

nfftx1 = length(x1);
nfftx11 = 2^nextpow2(nfftx1);
y1 = fft(x1, nfftx11);
xy1 = fs*(0:nfftx11/2-1)/nfftx11;
y12 = y1(1:nfftx11/2);      % FFT of Signal II

nfftx2 = length(x2);
nfftx21 = 2^nextpow2(nfftx2);
y2 = fft(x2, nfftx21);
xy2 = fs*(0:nfftx21/2-1)/nfftx21;
y21 = y2(1:nfftx21/2);      % FFT of Signal III

% Main figure details
figure('Name','FFT of Signals');

% Plotting Figure I and its FFT
subplot(2,3,1);
plot(dt,abs(X),'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Signal X in Time Domain");
subplot(2,3,4);
plot(xY, abs(Y1),'r');
xlabel("Frequency [Hz]");
ylabel("Magnitude");
title("FFT of Signal X");

% Plotting Figure II and its FFT
subplot(2,3,2);
plot(dt1,abs(x1),'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Signal x1 in Time Domain");
subplot(2,3,5);
plot(xy1, abs(y12),'r');
xlabel("Frequency [Hz]");
ylabel("Magnitude");
title("FFT of Signal x1");

% Plotting Figure III and its FFT
subplot(2,3,3);
plot(abs(x2),'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Combined Signal x2 in Time Domain");
subplot(2,3,6);
plot(xy2, abs(y21),'r');
xlabel("Frequency [Hz]");
ylabel("Magnitude");
title("FFT of Signal x2");

% ***************Program ends here***************************