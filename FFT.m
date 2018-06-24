% Title: Fast Fourier Transform of given signals
% Aim: To prove that FFT can not identify change in sequence.
% Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
% Department: Department of Electronics Engineering
% Mentor: Dr. Nirmal, HOD
% Department: Department of Electronics Engineering
% Date: 26/09/2017

% ***************Program starts here*************************

% Frequency signals declarations
f1 = 50;    % 50 Hz
f2 = 18;    % 18 Hz
f3 = 25;    % 25 Hz

% Signal duration declarations
t = 0:1:10000;
t1 = 0:1:3300;
t2 = 3301:1:6600;
t3 = 6601:1:10000;
t4 = [t1 t2 t3];        % Combined time duration

% Amplitude declarations
A = 10;     % in Volts
B = 10;     % in Volts
C = 10;     % in Volts

% Signal description
% Generating Signal I
X = A*sin(2*pi*f1*t) + B*sin(2*pi*f2*t) + C*sin(2*pi*f3*t);

% Generating Signal II
x1 = A*sin(2*pi*f1*t1) + B*sin(2*pi*f2*t1) + C*sin(2*pi*f3*t1);

% Generating Signal III
p1 = A*sin(2*pi*f1*t1);
p2 = B*sin(2*pi*f2*t2);
p3 = C*sin(2*pi*f3*t3);
x2 = [p1 p2 p3];

% Applying FFT
Y = fft(X);     % FFT of Signal I
y1 = fft(x1);   % FFT of Signal II
y2 = fft(x2);   % FFT of Signal III

% Main figure details
figure('Name','FFT of Signals');

% Plotting Figure I and its FFT
subplot(2,3,1);
plot(t,X,'r');
xlabel("Time");
ylabel("Amplitude");
subplot(2,3,4);
plot(abs(Y),'r');
xlabel("Frequency");
ylabel("Amplitude");

% Plotting Figure II and its FFT
subplot(2,3,2);
plot(t1,x1,'r');
xlabel("Time");
ylabel("Amplitude");
subplot(2,3,5);
plot(abs(y1),'r');
xlabel("Frequency");
ylabel("Amplitude");

% Plotting Figure III and its FFT
subplot(2,3,3);
plot(t,x2,'r');
xlabel("Time");
ylabel("Amplitude");
subplot(2,3,6);
plot(t,abs(y2),'r');
xlabel("Frequency");
ylabel("Amplitude");

% ***************Program ends here***************************