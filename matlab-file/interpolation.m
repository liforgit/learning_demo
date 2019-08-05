close all;
clear all;
clc;

% read original picture of lena
srcImg = imread('/home/lichanghai/Pictures/lena.jpg');
% subplot(2,2,1);
imshow(srcImg);
title("original picture of lena");

% % nearest neighbor interpolation
% row = size(srcImg,1);
% column = size(srcImg,2);
% nn = 0.5;  % 缩放系数
% m = round(nn * row);
% n = round(nn * column);
% dstImg = zeros(m,n,3);  % 定义变换后的图像
% for i=1:m
%     for j=1:n
%         x = round(i/nn);
%         y = round(j/nn);
%         
%         dstImg(i,j,:) = srcImg(x,y,:);
%     end
% end
% dstImg = uint8(dstImg);
% % subplot(2,2,2);
% figure;
% imshow(dstImg);
% title("使用nearest缩放后的图像");

% bilinear interpolation
bilinear('/home/lichanghai/Pictures/lena.jpg',0.5);