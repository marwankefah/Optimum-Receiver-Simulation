function [encodedSignal,time] = pnrz(inputBinaryData,Ts,N)
%PNRZ Summary of this function goes here
%   A function that encodes a binary bit using Polar NRZ

Tb=N*Ts;
Ws=2*pi*N/Tb;
%Sampling time
t=2*pi/Ws;
%% T will be equal to one here as N=40, Ts=1, Tb=40
time=0:t:length(inputBinaryData)*Tb;
encodedSignal = zeros(1,length(time));
for i =0:length(inputBinaryData)-1
    if inputBinaryData(i+1)== 0
        encodedSignal(i*Tb+1:(i+1)*Tb)=-1;
    else
        encodedSignal(i*Tb+1:(i+1)*Tb)=1;
    end
    
end
end

