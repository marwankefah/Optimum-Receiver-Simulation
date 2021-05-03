function [modulatedSignalBFSK,time] = BFSKModulator(encodedSignal,t,A,W1,W2,Ts,Tb)
%BPSKMODULATOR Summary of this function goes here
%   Detailed explanation goes here


samplingTime=Ts:Ts:Tb;
j=1;
for i=1:length(encodedSignal)
    if (encodedSignal(i)==1)
        modulatedSignalBFSK(1,j:j+(Tb/Ts)-1)=A*cos(W1*samplingTime);
    else
        modulatedSignalBFSK(1,j:j+(Tb/Ts)-1)=A*cos(W2*samplingTime);
    end
    j=j+(Tb/Ts);
end

time=0:1:length(modulatedSignalBFSK)-1;

% figure(15);
% subplot(2,1,1) 
% plot(time,modulatedSignalBFSK);
% title('Modulated Signal for BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-3 3])
% %         xlim([0 10])
% subplot(2,1,2) 
% plot(time,modulatedSignalBFSK);
% title('Zoomed Modulated Signal for BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-3 3])
end

