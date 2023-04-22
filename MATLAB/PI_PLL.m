pkg load signal
clc
clear all

%User inputs:
f0=77.5e3; %Frequency of reference signal [Hz]
phase_ref=0; %Phase of reference signal [radians]
fVCO=50e3; %free running oscilating frequency of VCO [Hz]
KVCO=1E3; %Gain of VCO (i.e. voltage to frequency transfer coefficient) [Hz/V]
G1=50; %Proportional gain term of PI controller
G2=1.7783e+06; %Integral gain term of PI controller
fs=10E6; %Sampling frequency [Hz]
NF=2000; %Number of samples in simulation
fc= 20e3; %Cut-off frequency of low-pass filter (after the multiplier) [Hz]
filter_coefficient_num=100; %Number of filter coefficeints of low-pass filter

%Start!
b = fir1(filter_coefficient_num,fc/(fs/2)); %design FIR filter coefficients
Ts=1/fs; %sampling period
t_vec=[0:Ts:(NF-1)*Ts]; %time vector

VCO=zeros(1,NF); %initialize VCO signal array
phi=zeros(1,NF); %initialize VCO angle (phi) array
error=zeros(1,NF); %initialize error array
Int_error=zeros(1,NF); %initialize error array
reference=sin(2*pi*f0*t_vec+phase_ref); %input signal

for n=2:NF
    t=(n-2)*Ts; %Current time (start at t = 0 seconds

    error_mult(n)=reference(n)*VCO(n-1);%multiply VCO x Signal input to get raw error signal

    %%%%%%%%%%%%Low pass filter the raw error signal:
    for m=1:length(b)
        if n-m+1>=1
           error_array(m)=error_mult(n-m+1);
        else
           error_array(m)=0;
        end
    end
    error(n)=sum(error_array.*(b));
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
  %Process filtered error signal through PI controller:
           Int_error(n)=Int_error(n-1)+G2*error(n)*Ts;
           PI_error(n)=G1*error(n)+Int_error(n);
  %

    phi(n)=phi(n-1)+2*pi*PI_error(n)*KVCO*Ts; %update the phase of the VCO
    VCO(n)=sin(2*pi*fVCO*t+phi(n)); %compute VCO signal
    VCO_COS(n) = -cos(2*pi*fVCO*t+phi(n));
end

%Plot VCO (output) and reference (input) signals:
figure(1)
plot(t_vec,reference,t_vec,VCO_COS)
title('Plot of input and output signals','FontSize',12)
xlabel('time [s]','FontSize',12)
legend('Input','Output')

%Plot error signal:
figure(2)
plot(t_vec,error)
title('Error signal','FontSize',12)
xlabel('time [s]','FontSize',12) 