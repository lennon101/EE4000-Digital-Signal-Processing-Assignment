%EE4000 Assignment Task 2 - Dane Lennon 

clc; %clear variables 
%clear all; %clear memory 
close all; %close all figures 

%% initialization
%load the hearingloss.mat file into the workspace 
load('hearingloss.mat')
load('coeffTask2.mat')

% load the filter gain factors into an array 15 long 
gainsDB = [9; 14; 37; 53; 57; 41; 34; 38; 40; 43; 45; 46; 48; 49; 50; 51];

%% calc gains 
gains = zeros(1,16);
for i=1:16
    gains(i) = 10^(gainsDB(i)/20);
end

%% Compare the two waveforms
hold all; 
figure(1); 
subplot(3,1,1); %divide figure window into 3 axis

plot(X,'b') % plot the original waveform 
title('Original waveform');
xlabel('time');
ylabel('amplitude');

subplot(3,1,2);
plot(Y, 'r'); %plot the hearing loss waveform; 
title('Hearing Loss waveform');
xlabel('time');
ylabel('amplitude');

subplot(3,1,3);
hold all; 
plot(X,'b'); % plot the original waveform 
plot(Y, 'r'); %plot the resampled waveform; 
title('Waveforms compared');
xlabel('time');
ylabel('amplitude');

%% Filter Outputs (Filtering through 15 channels) 
Y = Y'; %transverse the vector 
filterOut = zeros(15,length(Y)); %make a vector of zeros 15 rows deep and length(Y) long  
filterOut(1,:)=filter(coeff1,1,Y*gains(1));  
filterOut(2,:)=filter(coeff2,1,Y*gains(2));
filterOut(3,:)=filter(coeff3,1,Y*gains(3));
filterOut(4,:)=filter(coeff4,1,Y*gains(4));
filterOut(5,:)=filter(coeff5,1,Y*gains(5));
filterOut(6,:)=filter(coeff6,1,Y*gains(6));
filterOut(7,:)=filter(coeff7,1,Y*gains(7));
filterOut(8,:)=filter(coeff8,1,Y*gains(8));
filterOut(9,:)=filter(coeff9,1,Y*gains(9));
filterOut(10,:)=filter(coeff10,1,Y*gains(10));
filterOut(11,:)=filter(coeff11,1,Y*gains(11));
filterOut(12,:)=filter(coeff12,1,Y*gains(12));
filterOut(13,:)=filter(coeff13,1,Y*gains(13));
filterOut(14,:)=filter(coeff14,1,Y*gains(14));
filterOut(15,:)=filter(coeff15,1,Y*gains(15));

%% combine all the signals 
signal = zeros(1,length(Y));
for i=1:14
    signal = signal+filterOut(i,:);
end

signal = signal(500:end)
figure(2) 
hold all
plot(signal,'r') 
plot(X,'g')
sound(signal) 