close all;
clear all;

I= imread('~/Pictures/imageprocess/NGC3314.jpg');     %读取图片
sizes = size(I);    %获取大小

sumImg5 = zeros(sizes(1),sizes(2));  
for i=1:5 
  noiseImg=imnoise(I,'gaussian',0);                  %随机加噪
  noiseImg=im2double(noiseImg);                       %转成double型进行相加
  sumImg5=sumImg5+noiseImg;
end
sumImg5=sumImg5/5;

sumImg20 = zeros(sizes(1),sizes(2));  
for i=1:20 
  noiseImg=imnoise(I,'gaussian',0);                   %随机加噪
  noiseImg=im2double(noiseImg);                       %转成double型进行相加
  sumImg20=sumImg20+noiseImg;
end
sumImg20=sumImg20/20;

sumImg50 = zeros(sizes(1),sizes(2));  
for i=1:50 
  noiseImg=imnoise(I,'gaussian',0);                   %随机加噪
  noiseImg=im2double(noiseImg);                       %转成double型进行相加
  sumImg50=sumImg50+noiseImg;
end
sumImg50=sumImg50/50;

sumImg100 = zeros(sizes(1),sizes(2));  
for i=1:100 
  noiseImg=imnoise(I,'gaussian',0);                   %随机加噪
  noiseImg=im2double(noiseImg);                       %转成double型进行相加
  sumImg100=sumImg100+noiseImg;
end
sumImg100=sumImg100/100;

subplot(2,3,1);imshow(I);title('original image');
subplot(2,3,2);imshow(noiseImg);title('noise image');
subplot(2,3,3);imshow(sumImg5);title('average with 5 image');
subplot(2,3,4);imshow(sumImg20);title('average with 20 image');
subplot(2,3,5);imshow(sumImg50);title('average with 50 image');
subplot(2,3,6);imshow(sumImg100);title('average with 100 image');
