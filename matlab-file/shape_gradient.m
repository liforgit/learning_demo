%gradient decent 
%使用一阶微分锐化图像
close all;
clear all;
clc;

oriImg = imread('~/Pictures/imageprocess/CH03/Fig0342(a)(contact_lens_original).tif');
M = 3;
N = 3;

[m,n,~] = size(oriImg);
dstImg = zeros(m,n);
imshow(oriImg);
%extend
extendOriImg = zeros(m+M-1,n+N-1);
start = fix(M/2);
for i = 1:m
    for j = 1:n
        extendOriImg(i+start,j+start) = oriImg(i,j);
    end
end

%excuse algorithm
extendOriImg = im2double(extendOriImg);
for i = start+1:m+start
    for j = start+1:n+start
        dstImg(i-start,j-start)=abs((extendOriImg(i-start,j+start)+2*extendOriImg(i,j+start)+extendOriImg(i+start,j+start))...
        -(extendOriImg(i-start,j-start)+2*extendOriImg(i,j-start)+extendOriImg(i+start,j-start)))...
        + abs((extendOriImg(i+start,j-start)+2*extendOriImg(i+start,j)+extendOriImg(i+start,j+start))...
        -(extendOriImg(i-start,j-start)+2*extendOriImg(i-start,j)+extendOriImg(i-start,j+start)));
    end
end

figure;
imshow(dstImg,[]);
