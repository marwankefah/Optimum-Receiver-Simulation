function [outputBinaryData] = BFSK(encodedSignal,time,A,Ts,N,No,threshold,numberOfInputBits)
%BFSK Summary of this function goes here
%   Detailed explanation goes here
Tb=Ts*N;
no=4;
n1=1;
W1 = (2*pi)*(no+n1)/Tb;
W2=  (2*pi)*(no-n1)/Tb;
[modulatedBFSKSignal,t]=BFSKModulator(encodedSignal,time,A,W1,W2,Ts,Tb);
% figure(4);
% plot(t,modulatedBFSKSignal)
% xlim([0 300])
% ylim([-0.5 0.5])
% title('the modulated BFSK signal');

%the channel is assumed to be ideal and the channel noise is assumed to be white and
%Gaussian with power spectral density No/2
[Vt,Vtime]=channel(modulatedBFSKSignal,t,No);
% figure(2);
% plot(Vtime,Vt)
% xlim([0 200])
% ylim([-5 5])
% title('the modulated BFSK signal with AWGN');

[outputBinaryData] = BFSKDemodulator(Vt,Vtime,W1,W2,Tb,threshold,numberOfInputBits);
end

