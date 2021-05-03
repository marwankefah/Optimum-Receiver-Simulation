function [outputBinaryData] = BFSKDemodulator(Vt,t,W1,W2,Tb,~,numberOfInputBits)
%BFSKMODULATOR Summary of this function goes here
%   consists of the matched filter followed by sampler followed by
%   threshold detector

% figure(14);
% subplot(2,1,1) 
% plot(t,Vt);
% title('Noisy Signal V(t) for BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% %         xlim([0 10])
% ylim([-3 3])
% subplot(2,1,2) 
% plot(t,Vt);
% title('Zoomed Noisy Signal V(t) for BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-3 3])



%Matched filter output
t=0:1:Tb-1;
Ht1=cos(W1*(Tb-t));
Ht2=cos(W2*(Tb-t));
Yt1=conv(Vt,Ht1);
Yt2=conv(Vt,Ht2);

% figure(4);
% plot(Yt);%
% title("y(t) after matched filter");
% xlabel('time)');
% ylabel('Volts');
% xlim([0 300]);
% ylim([-20 20]);

%sampling for each bit sent at time= Tb
sampledTime=Tb:Tb:Tb*numberOfInputBits;
sampledSignal1=Yt1(sampledTime);
sampledSignal2=Yt2(sampledTime);

%Threshold detector bigger than threshold =1 less than threshold =-
outputBinaryData=sampledSignal1>sampledSignal2;

% figure(18);
% subplot(5,1,1) 
% plot(Yt1);
% title('Zoomed Output Of Matched filter 1 BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-15 15])
% 
% subplot(5,1,2) 
% plot(Yt2);
% title('Zoomed Output Of Matched filter 2 BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% xlim([0 320])
% ylim([-15 15])
% 
% 
% subplot(5,1,3) 
% stem(sampledSignal1);
% title('After Sampling at kTb of BFSK Matched filter 1');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-15 15])
% 
% subplot(5,1,4) 
% stem(sampledSignal2);
% title('After Sampling at kTb of BFSK Matched filter 2');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-15 15])
% 
% 
% subplot(5,1,5) 
% stem(outputBinaryData);
% title('Output Binary Data After threshold detector of BFSK');
% xlabel('time in seconds');
% ylabel('Amplitude in Volts');
% ylim([-1 1.5])


end

