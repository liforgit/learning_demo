%使用直方图统计进行局部增强
%使用3x3的模板
function localEnhance()
close all;
clear all;

oriImg = imread('~/Pictures/imageprocess/CH03/Fig0327(a)(tungsten_original).tif');
[m,n,~] = size(oriImg);
%边沿扩展，因为是3x3的，所以只需向外扩展一层
extendOriImg = zeros(m+2,n+2);
for i = 1:m
    for j = 1:n
        extendOriImg(i+1,j+1) = oriImg(i,j);
    end
end

equImg = zeros(m,n);

p = imhist(oriImg)';
gMean = 0;
gVan = 0;
for i = 1:256
    p(i) = p(i) / (m*n*1.0);
    gMean = gMean + (i - 1) * p(i);
end
for i = 1:256
    gVan = gVan + (i - 1 - gMean).^2 * p(i);
end
%gMean = round(gMean);
gVan = square(gVan);
s = zeros(1,256);

%求出累积直方图
sum = 0;
for i = 1:256
    for j = 1:i
        sum = sum + p(j);
    end
    s(i) = round(255 * sum);
    sum = 0;
end

%直方图映射变换
for i = 1:m
    for j = 1:n
        equImg(i,j) = s(oriImg(i,j) + 1);
    end
end

%以下使用直方图统计进行局部增强
gImg = zeros(m,n);
E = 4.0;
k0 = 0.4;
k1 = 0.02;
k2 = 0.4;
lMean = 0;
lVan = 0;
%算法的执行,逐行扫描
for i = 2:m+1
    for j = 2:n+1
        %计算局部均值
        lMean = (...
                 extendOriImg(i-1,j-1) + extendOriImg(i,j-1) + extendOriImg(i+1,j-1) +  ...
                 extendOriImg(i-1,j  ) + extendOriImg(i,j  ) + extendOriImg(i+1,j  ) + ...
                 extendOriImg(i-1,j+1) + extendOriImg(i,j+1) + extendOriImg(i+1,j+1) ...
                 )/9;
               
        %计算局部方差
        lVan = (...
                (extendOriImg(i-1,j-1) - lMean).^2 + (extendOriImg(i,j-1) - lMean).^2 + (extendOriImg(i+1,j-1) - lMean).^2 +  ...
                (extendOriImg(i-1,j  ) - lMean).^2 + (extendOriImg(i,j  ) - lMean).^2 + (extendOriImg(i+1,j  ) - lMean).^2 + ...
                (extendOriImg(i-1,j+1) - lMean).^2 + (extendOriImg(i,j+1) - lMean).^2 + (extendOriImg(i+1,j+1) - lMean).^2 ...
                )/9; 
        lVan = square(lVan);
        if (lMean <= k0*gMean) && (lVan >= k1 * gVan) && (lVan <= k2 * gVan)
            gImg(i-1,j-1) = extendOriImg(i,j) * E;
        else
            gImg(i-1,j-1) = extendOriImg(i,j);
        end
    end
end

figure;
subplot(131);
imshow(oriImg,[]);
title('oriImg');

subplot(132);
imshow(equImg,[]);
title('equImg');

subplot(133);
imshow(gImg,[]);
title('gImg');
