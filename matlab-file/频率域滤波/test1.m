clc;  
clear all;  
close all;  
I = imread('~/Pictures/lena.jpg');
I = rgb2gray(I);
I = im2double(I);
I = imnoise(I,'gaussian');

ff = ideaLPF(I,20);
out = imfreqfilt(I,ff);

figure(1);
subplot(221);
imshow(I);
title('Source');

temp = fft2(I);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure(2);
subplot(221);
imshow(temp,[]);
title('Source');

figure(1);
subplot(222);
imshow(out);
title('Ideal LPF, freq = 20');

temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure(2);
subplot(222);
imshow(temp,[]);
title('Ideal LPF,freq = 20');

ff = ideaLPF(I,40);
out = imfreqfilt(I,ff);

figure(1);
subplot(223);
imshow(out);
title('Ideal LPF, freq = 40');

temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure(2);
subplot(223);
imshow(temp,[]);
title('Ideal LPF, freq = 40');

ff = ideaLPF(I,60);
out = imfreqfilt(I,ff);

figure(1);
subplot(224);
imshow(out);
title('Ideal LPF, freq = 60');

temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure(2);
subplot(224);
imshow(temp,[]);
title('Ideal LPF, freq = 60');





    