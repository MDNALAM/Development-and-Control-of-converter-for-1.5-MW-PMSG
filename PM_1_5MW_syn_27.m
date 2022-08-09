clc
clear
z=.003
a=.7
mn=60000;
b=5*10^-4
Vm=2*1.15;
Vh=Vm/6*0;
%dc link voltage
Vdc=1200;
% dc link capacitance
C=.5;
C1=.005;
L=.0001;
R=.17;
Ts_Control=5.000000000000000e-05
Ts_Power=5.000000000000000e-06
% data from new paper(Analysis of Wind Turbine Driven Permanent Magnet
% Synchronous Generator under Different Loading Conditions)
a_Version ='Syn_27'
f=53.33;
p=26;
Flux=5.8264;
Rs=0.000821;
Ld=0.001575;
Lq=0.001575;
Tmax=650.5;
J=300;
w0=2*pi*f;
%converter
%current control
Bandw=50;
% Kp=Bandw*2*pi*Ld;
Kp=1*.0005;
Ki=(Bandw/10*2*pi)*Kp;
Id_set=500;
Iq_set=-2200;

% Speed controller
BW =50;

Kp_Speed =1.5*J/p*2*pi*BW;
% Kp_Speed =0;
Ki_Speed =Kp_Speed*2*pi*(BW/10);
%Speed_set=2*pi*50/p;
%Speed_set=2*pi*53.33;
%Speed_set2=floor(Speed_set);
n_m       = 20.07; % aus dem Text
f_m       = n_m/60;
w_m       = (2*pi*f_m);
Speed_set =w_m;


% parameters required for the S-Function block:
%FAST_InputFileName = 'E:\documents_uni\specialization\Results\PM_control_withFAST\Test11.fst';
%FAST_InputFileName = 'C:\Users\sganzel\Documents\MATLAB\Netz-Stabil\Syn\Syn_24\Test11.fst';

stringFile = 'E:\Assistantship\Syn_27\Test11.fst' 
FAST_InputFileName = char(stringFile); % convert string to char because FAST needs char-type
TMax = 20;
load('Lookup_M_n.mat'); % load references for lookup table
%inverter:

m =1;   % modulationsindex
fs=4000;      % Switching frequency
Ts=10e-6;    % Sampling time of devices


