# EE4000-Digital-Signal-Processing-Assignment

##Introduction
Speech processing involves the analysis of speech waveforms and sampling and filtering the waveform for electrode stimulation. One common method is called the Spectral Maxima Sound Processor (SMP) which is employed by Chochlear implants. This processing strategy is to amplify the signal before making use of a bank of 16 band-pass filters who’s purpose is to split the waveform into 16 separate signals. Each signal is then passed through a Low Pass Filter (LFP) for envelope detection purposes before the 6 largest amplitudes of each signal is detected and rest discarded. Lastly, each maximum amplitude is compressed and encoded in preparation stimulation of the electrodes in the ear.

##Aim
This practical was conducted in order to simulate the SMSP strategy and asses it effectiveness in sampling speech waveforms. A hearing aid was also developed and tested for accuracy [1].

##Apparatus
 - Matlab R2014b (9.4.0.150421) – 64-bit (maci64) September 15, 2014

##PartA: MATLab simulation for the SMSP strategy
The following is pseudocode representation of the MATLAB algorithm needed to implement a simulated SMSP process.
1. Import the waveform into MA TLAB
2. Resample the waveform at 16kHz
3. Compare the original waveform with the resampled waveform
4. Use the MATLAB fdatool() to calculate the 16 vectors pertaining to the filter coefficients of each center frequency
5. Filter the waveform through the 16 band-pass filters creating 16 channels
6. Pass each channel through a LPF with a cut-off frequency of 200Hz
7. Sample each channel every 4milliseconds
8. Find the largest amplitude of the sampled channels
a. Sort the channels largest to smallest
b. Take the first index of each vector
9. Normalize the magnitudes of each amplitude to ensure values are between 0 and 1
10. Plot the normalized amplitudes in an electrodogram

##PartB:Designingahearingaid
1. The hearingloss.mat file is first loaded into the MATLAB workspace as per line 9 in Figure 11. 
2. Coefficient matrix was developed using the MATLAB fdaTool()
3. The decibel gains given in the assignment outline were loaded into an array
4. Signal X and Signal Y were then plotted and compared to gain an understanding of the differences in amplitude. 
5. Using the filter coefficients and the gains already calculated, the hearing loss waveform was passed through a filter bank of 15 band-pass filters in order split the waveform into 15 different waves whilst consecutively applying the gains to each of the filters. 
6. The outputs of each of the filters was then recombined in order to gain a single waveform
7. Finally, the amplified signal was plotted in lines 70 and the sound tested for accuracy and validity. The first 500 bits of the signal were removed due to the phase shift that the filtering had induced. Removing these bits aligned the combined filter outputs with the original waveform. 

#Results: 
Please see the report file


