function [modulatedSignalBPSK,time] = BPSKModulator(encodedSignal,t,A,Wc,Ts,Tb)
%BPSKMODULATOR Summary of this function goes here
%   Detailed explanation goes here

samplingTime=Ts:Ts:Tb;
j=1;
for i=1:length(encodedSignal)
    if (encodedSignal(i)==0)
        modulatedSignalBPSK(1,j:j+(Tb/Ts)-1)=-A*cos(Wc*samplingTime);
    else
        modulatedSignalBPSK(1,j:j+(Tb/Ts)-1)=A*cos(Wc*samplingTime);
    end
    j=j+(Tb/Ts);
end

time=0:1:length(modulatedSignalBPSK)-1;

% figure(13);
% subplot(2,1,1) 
% plot(time,modulatedSignalBPSK);
% title('Modulated Signal for BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-3 3])
% %         xlim([0 10])
% subplot(2,1,2) 
% plot(time,modulatedSignalBPSK);
% title('Zoomed Modulated Signal for BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-3 3])
end

