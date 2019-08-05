% 局部直方图处理,并与全局直方图效果对比
% 邻域使用3x3的

function localHisrogram()
oriImg = imread('~/Pictures/imageprocess/CH03/Fig0326(a)(embedded_square_noisy_512).tif');

[m,n,~] = size(oriImg);
extOriImg = zeros(m+2,n+2);  %将原图像扩展成(m+2) x (n+2)
for i = 1:m
    for j = 1:n
        extOriImg(i+1,j+1) = oriImg(i,j);
    end
end
        
globalHisImg = zeros(m,n);   %目标图像
s = zeros(1,256);    %累积直方图

p = imhist(oriImg)';  %需要转置成行向量
for i = 1:256
    p(i) = p(i)/(m * n);   %归一化到0-1
end

%局部直方图均衡化
pl = zeros(1,256);
sl = zeros(1,256);
sum2 = 0;
localHisImg = zeros(m,n);
for i = 2:m+1
    for j = 2:n+1
        %统计邻域中各灰度级出现的次数
        pl(extOriImg(i-1,j-1)  + 1) = pl(extOriImg(i-1,j-1)  + 1) + 1;
        pl(extOriImg(i  ,j-1)  + 1) = pl(extOriImg(i  ,j-1)  + 1) + 1;
        pl(extOriImg(i+1,j-1)  + 1) = pl(extOriImg(i+1,j-1)  + 1) + 1;
        pl(extOriImg(i-1,j  )  + 1) = pl(extOriImg(i-1,j  )  + 1) + 1;
        pl(extOriImg(i  ,j  )  + 1) = pl(extOriImg(i  ,j  )  + 1) + 1;
        pl(extOriImg(i+1,j  )  + 1) = pl(extOriImg(i+1,j  )  + 1) + 1;
        pl(extOriImg(i-1,j+1)  + 1) = pl(extOriImg(i-1,j+1)  + 1) + 1;
        pl(extOriImg(i  ,j+1)  + 1) = pl(extOriImg(i  ,j+1)  + 1) + 1;
        pl(extOriImg(i+1,j+1)  + 1) = pl(extOriImg(i+1,j+1)  + 1) + 1;
    
        %将次数归一化到0-1之间
        for k = 1:256
            pl(k) = pl(k) / 9.0;
        end
        
        %求邻域内的累积直方图
        for ii = 1:256
            for jj = 1:ii
                sum2 = sum2 + pl(jj);
            end
            sl(ii) = round(255 * sum2);
            sum2 = 0;
        end
        
        %映射中心像素的值
        localHisImg(i-1,j-1) = sl(extOriImg(i,j) + 1);
    end
end

%求出全局累积直方图
sum = 0;
for i = 1:256
    for j = 1:i
        sum = sum + p(j);
    end
    s(i) = round(255 * sum);
    sum = 0;
end

%全局直方图映射变换
for i = 1:m
    for j = 1:n
        globalHisImg(i,j) = s(oriImg(i,j) + 1);
    end
end

figure;
subplot(1,3,1);
imshow(oriImg,[]);
title('oriImg');

subplot(1,3,2);
imshow(globalHisImg,[]);
title('globalHisImg');

subplot(1,3,3);
imshow(localHisImg,[]);
title('localHisImg');

