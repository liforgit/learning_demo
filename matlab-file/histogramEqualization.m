%直方图均衡化
function histogramEqualization()

oriImg = imread('~/Pictures/imageprocess/lena.jpg');
oriImg = rgb2gray(oriImg);

[m,n,~] = size(oriImg);
dstImg = zeros(m,n);
grayScale = zeros(1,256);
dstGrayScale = zeros(1,256);

for i = 1:m
    for j = 1:n
        pix = oriImg(i,j);
        grayScale(pix + 1) = grayScale(pix + 1) + 1;  %统计灰度0-255出现的次数
    end
end

for i = 1:256
    grayScale(i) = grayScale(i)/(m * n * 1.0);   %将灰度出现的次数转化为概率
end

sum = 0;
for i = 1:256
    for j = 1:i
        sum = sum + grayScale(j);
    end
    dstGrayScale(i) = round(255 * sum);  %直方图均衡化
    sum = 0;
end

%均衡化映射
for i = 1:m
    for j = 1:n
        dstImg(i,j) = dstGrayScale(oriImg(i,j));
    end
end

figure;
subplot(2,2,1);
imshow(oriImg,[]);
title('original image');

subplot(2,2,2)
bar(grayScale);
title('histogram graph');

subplot(2,2,3);
imshow(dstImg,[]);
title('dst img');

subplot(2,2,4);
bar(dstGrayScale);
title('dst histogram graph');
