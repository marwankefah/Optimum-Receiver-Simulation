function [outputBinaryData] = BPSKDemodulator(Vt,t,Wc,Tb,threshold,numberOfInputBits)
%BPSKMODULATOR Summary of this function goes here
%   consists of the matched filter followed by sampler followed by
%   threshold detector

% figure(16);
% subplot(2,1,1) 
% plot(t,Vt);
% title('Noisy Signal V(t) for BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% %         xlim([0 10])
% ylim([-3 3])
% subplot(2,1,2) 
% plot(t,Vt);
% title('Zoomed Noisy Signal V(t) for BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-3 3])

%Matched filter output
t=0:1:Tb-1;
Ht=cos(Wc*(Tb-t));
Yt=conv(Vt,Ht);

% figure(4);
% plot(Yt);%
% title("y(t) after matched filter");
% xlabel('time)');
% ylabel('Volts');
% xlim([0 300]);
% ylim([-20 20]);

%sampling for each bit sent at time= Tb
sampledTime=Tb:Tb:Tb*numberOfInputBits;
sampledSignal=Yt(sampledTime);

%Threshold detector bigger than threshold =1 less than threshold =-
outputBinaryData=sampledSignal>threshold;

% figure(17);
% subplot(3,1,1) 
% plot(Yt);
% title('Zoomed Output Of Matched filter BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-15 15])
% 
% subplot(3,1,2) 
% stem(sampledSignal);
% title('After Sampling at kTb of BPSK Matched filter');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-15 15])
% 
% 
% subplot(3,1,3) 
% stem(outputBinaryData);
% title('Output Binary Data After threshold detector of BPSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-1 1.5])



end

