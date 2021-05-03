function [outputBinaryData] = BPSK(encodedSignal,time,A,Ts,N,No,threshold,numberOfInputBits)
%BPSK Summary of this function goes here
%   Detailed explanation goes here
Tb=Ts*N;
Wc = (4*2*pi)/Tb;
[modulatedBPSKSignal,t]=BPSKModulator(encodedSignal,time,A,Wc,Ts,Tb);
% figure(1);
% plot(t,modulatedBPSKSignal)
% xlim([0 200])
% ylim([-0.5 0.5])
% title('the modulated BPSK signal');

%the channel is assumed to be ideal and the channel noise is assumed to be white and
%Gaussian with power spectral density No/2
[Vt,Vtime]=channel(modulatedBPSKSignal,t,No);
% figure(2);
% plot(Vtime,Vt)
% xlim([0 200])
% ylim([-5 5])
% title('the modulated BPSK signal with AWGN');

[outputBinaryData] = BPSKDemodulator(Vt,Vtime,Wc,Tb,threshold,numberOfInputBits);
end

