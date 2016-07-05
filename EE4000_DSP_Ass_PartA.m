%EE4000 Assignment Task 1 - Dane Lennon 

clc; %clear variables 
close all; %close all figures 

%% initialization
%load the audio file 
%y = sampled data (a column vector of 21364 long is returned) 
%Fs = sample rate (44100 is returned) 
[y, Fs] = audioread('/Users/danelennon/Documents/MATLAB/EE4000 - DSP/mbet.wav');
FsNew = 16000;
y1 = resample(y,FsNew,Fs); %resample the data at 16000Hz
numChannels = 16; %set the number of channels 
filterOrd = 1607; % set the filter order 

%% Compare original waveform with resampled waveform 
hold all; 
figure(1); 
subplot(3,1,1); %divide figure window into 3 axis

plot(y,'b') % plot the original waveform 
title('Original waveform');
xlabel('time');
ylabel('amplitude');

subplot(3,1,2);
plot(y1, 'r'); %plot the resampled waveform; 
title('Resampled waveform');
xlabel('time');
ylabel('amplitude');

subplot(3,1,3);
hold all; 
plot(y,'b'); % plot the original waveform 
plot(y1, 'r'); %plot the resampled waveform; 
title('Waveforms compared');
xlabel('time');
ylabel('amplitude');

%% Filter Outputs (Filtering through 16 channels) 
y1 = y1'; %transverse the vector 
out = zeros(16,length(y1)); %make a vector of zeros 16 rows deep and length(y1) long  
out(1,:)=filter(coeff1,1,y1);  
out(2,:)=filter(coeff2,1,y1);
out(3,:)=filter(coeff3,1,y1);
out(4,:)=filter(coeff4,1,y1);
out(5,:)=filter(coeff5,1,y1);
out(6,:)=filter(coeff6,1,y1);
out(7,:)=filter(coeff7,1,y1);
out(8,:)=filter(coeff8,1,y1);
out(9,:)=filter(coeff9,1,y1);
out(10,:)=filter(coeff10,1,y1);
out(11,:)=filter(coeff11,1,y1);
out(12,:)=filter(coeff12,1,y1);
out(13,:)=filter(coeff13,1,y1);
out(14,:)=filter(coeff14,1,y1);
out(15,:)=filter(coeff15,1,y1);
out(16,:)=filter(coeff16,1,y1);

%% Signal rectification of each channel using a low pass filter 
 
%using the fir1 function, creat low pass filter coefficients for each
%channel
[b,a] = fir1(1606,200/(0.5*FsNew));

out = abs(out); %get the absolute value of the filter outputs 
%now pass each channel though the low pass filter 
for i=1:numChannels
    lowPass(i,:) = filter(b,a,out(i,:)); 
end

%% sample at every 4msecs 
%Get every 64th magnitude so that array is taken every 4msec 
col = 1;
for i=1:64:length(lowPass)
    sample64(:,col) = lowPass(:,i); %sample every 64th column ('i' steps by 64)
    col = col + 1; %increment the column count
end 

%sort sampled data into descending order to find the largest amplitudes
%X is the 16x122 matrix, Y is the index matrix showing how the index's were sorted
[X,Y] = sort(sample64,'descend'); 

%Normalize maximum amplitude to be a maximum of one
X = X./max(max(X));

%% plot the data in the elctrodogram

%by adding the sorted data (X) with the index matrix (Y) the data is 
%separated into 16 channels forming the electrodogram layout
data = X + Y; 
figure(3);
title('Electrodogram');
xlabel('Time (sec)');   %label x axis
ylabel('Channel');    %label y axis

hold on

for i = 1:length(data)
    for j = 1:6 %only want the 6 greatest magntidudes out of the 16 channels
        time = i*0.0004; 
        plot(time,data(j,i),'bo')
    end
end
hold off 
