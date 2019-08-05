close all;
clear all;

oriImg = imread('~/Pictures/imageprocess/CH03/Fig0340(a)(dipxe_text).tif');

k1 = 1; %weight of unshape masking image
k2 = 4.5; %weight of high boost filter

oriImg = im2double(oriImg);
blurredImg = averageFilter(oriImg,5,5); %blur original image
maskImg = oriImg - blurredImg; %mask image
unshapeImg = oriImg +  k1 * maskImg;
highImg = oriImg + k2 * maskImg;

% calibration pixel to 0-255
fm = maskImg - min(min(maskImg));
calImg = uint8(255 * (fm/max(max(fm))));

subplot(231);imshow(oriImg);title('oriImg');
subplot(232);imshow(blurredImg);title('blurredImg');
subplot(233);imshow(calImg);title('maskImg after calibration');
subplot(234);imshow(unshapeImg);title('unshape masking image');
subplot(235);imshow(highImg);title('high boost image');

