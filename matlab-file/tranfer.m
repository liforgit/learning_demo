close all;
clear all;

%灰度变换函数例子
try 
   oriImg = imread('~/Pictures/imageprocess/2008_000017.jpg');
catch ME1
   error('can not read this image from disk');
end
oriImg = rgb2gray(oriImg);
oriImg = im2double(oriImg);
[m,n] = size(oriImg);

%图像反转 照片底片效果
dstImg = zeros(m,n);
for i = 1:m
    for j = 1:n
        dstImg(i,j) = 255 - oriImg(i,j);
    end
end

%对数变换
dstLogImg = zeros(m,n);
for i = 1:m
    for j = 1:n
        dstLogImg(i,j) = log(1 + oriImg(i,j));
    end
end

%观察幅度谱
oriImgMag = log(1 + abs(fftshift(fft2(oriImg))));
dstImgMag = log(1 + abs(fftshift(fft2(dstLogImg))));

%幂次变换 增强对比度
dstPowerImg = zeros(m,n);
for i = 1:m
    for j = 1:n
        dstPowerImg(i,j) = oriImg(i,j).^2;
    end
end

%分段线性变换 对比度拉伸
%pieceLinearTran(oriImg,50/255,0,130/255,255/255);

%观察比特平面对图像的重要性
bitImage();

%画图显示
% subplot(1,2,1);
% imshow(oriImg,[]);
% title('origial image');
% 
% subplot(1,2,2);
% imshow(dstImg,[]);
% title('dst image');

% figure;
% subplot(1,2,1);
% imshow(oriImgMag,[]);
% title('origial image');
% 
% subplot(1,2,2);
% imshow(dstImgMag,[]);
% title('dst log image');
% 
% figure;
% subplot(1,2,1);
% imshow(oriImg,[]);
% title('origial image');
% 
% subplot(1,2,2);
% imshow(dstPowerImg,[]);
% title('dst power image');

