function [Vt,time] = channel(modulatedSignal,t,No)
%BPSK Summary of this function goes here
%   Detailed explanation goes here

%power specifies the power of noise in dBW.
Wt=wgn(1,length(modulatedSignal),10*log10(No/2));

% figure(12);
% plot(t,Wt);
% title('Channel noise');
% xlabel('time in seconds');
% ylabel('Nois in Volts');
%         xlim([0 10])
% ylim([-5 5])

%the channel is assumed to be ideal and the channel noise is assumed to be white and
%Gaussian with power spectral density No/2
Vt=modulatedSignal+Wt;
time=t;

end

