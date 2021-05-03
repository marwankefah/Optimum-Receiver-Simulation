clc;
clear;

Ts=1;
N=40;
Ws=2*pi/Ts;
%we must sample at a substantially higher
%frequency than the bit frequency.
Tb=N*Ts;
% %plotting the encoded signal with PNRZ
% plot(time,encodedSignal)
% %xim([0 length(encodedSignal])
% ylim([-1.5 1.5])

SNRe=-4:1:4;
No=2;
realizationCount=20;
threshold=0;
numberOfInputBits=100000;
PerrorBPSKPexp=zeros(1,length(SNRe));
PerrorBPSKPtheo=zeros(1,length(SNRe));
PerrorBFSKPexp=zeros(1,length(SNRe));
PerrorBFSKPtheo=zeros(1,length(SNRe));
for i=1:length(SNRe)
    BpskBER=0;
    BfskBER=0;
    for j=1:realizationCount
        %Generating the input to our system TODO ask if 0,1 are equiprobable 
        inputBinaryData=rand(1,numberOfInputBits)>0.5;
        %that this sequence of binaARY digits are represented by rectangular pulses having amplitudes ±1
        %==PolarRZ
        %TODO ask Dr if we can concat both with each other
        [encodedSignal,time]=pnrz(inputBinaryData,Ts,N);
         A=sqrt((10^(SNRe(i)/10))*2*(No/Tb));
         
%         figure(10);
%         plot(time,encodedSignal)
%         xlim([0 200])
%         ylim([-1.5 1.5])
%         xlabel('time in sec');
%         ylabel('Value in volts');
%         title('Input random data after encoding with Polar NRZ');
%         
%         [PSD,F] = periodogram(encodedSignal,[],[],1);
%         figure(11);
%         plot(F,PSD);
%         title("Power Spectral Density of the Encoded Signal ");
%         xlabel('Frequency in HZ');
%         ylabel('PSD in Volts/HZ');
%                 xlim([0 10])
%         ylim([0 10])

% %          BPSK
        [outputBinaryDataBPSK]=BPSK(inputBinaryData,time,A,Ts,N,No,threshold,numberOfInputBits);
        BpskBER=BpskBER+sum(inputBinaryData~=outputBinaryDataBPSK)/numberOfInputBits;
    
        %BFSK
       [outputBinaryDataBFSK]=BFSK(inputBinaryData,time,A,Ts,N,No,threshold,numberOfInputBits);
        BfskBER=BfskBER+sum(inputBinaryData~=outputBinaryDataBFSK)/numberOfInputBits;
    end
    PerrorBPSKPexp(i)=BpskBER/realizationCount;
    PerrorBPSKPtheo(i)=0.5*erfc(sqrt((((A^2)*Tb)/2)/No));
    PerrorBFSKPexp(i)=BfskBER/realizationCount;
    PerrorBFSKPtheo(i)=0.5*erfc(sqrt((((A^2)*Tb)/2)/(No*2)));
end


figure(1);
semilogy(SNRe,PerrorBPSKPexp,'r');
hold on
semilogy(SNRe,PerrorBPSKPtheo,'g');
hold on
semilogy(SNRe,PerrorBFSKPexp,'k');
hold on
semilogy(SNRe,PerrorBFSKPtheo,'b');
title(['BPSK Perfomance graph sending ',num2str(numberOfInputBits),' bits']);
xlabel('SNR');
ylabel('BER');
legend('BPSK Experimental BER','BPSK Theoretical BER','BFSK Experimental BER','BFSK Theoretical BER');
hold off


% figure(2);
% semilogy(SNRe,PerrorBFSKPexp,'g');
% hold on
% semilogy(SNRe,PerrorBFSKPtheo,'b');
% title(['BFSK Perfomance graph sending',num2str(numberOfInputBits),' bits']);
% xlabel('SNR');
% ylabel('BER');
% legend('Experimental BER','Theoretical BER');
% hold off



