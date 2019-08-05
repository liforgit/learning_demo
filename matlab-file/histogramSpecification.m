function histogramSpecification()
oriImg = imread('~/Pictures/imageprocess/lena.jpg');
oriImg = rgb2gray(oriImg);

stdImg = imread('~/Pictures/imageprocess/CH03/Fig0320(3)(third_from_top).tif');

[m,n] = size(oriImg);
[m1,n1] = size(stdImg);
dstImg = zeros(m,n);

pr = imhist(oriImg)'/(m * n);
pz = imhist(stdImg)'/(m1 * n1);

s = zeros(1,256);
g = zeros(1,256);

sum = 0;
sum1 = 0; 
for i = 1:256
    for k = 1:i
        sum = sum + pr(k);
        sum1 = sum1 + pz(k);
    end
    s(i) = round(255 * sum);
    g(i) = round(255 * sum1);
    sum = 0;
    sum1 = 0;
end

index = zeros(1,256);
for i = 1:256
    tmp = g - s(i);
    tmp = abs(tmp);
    [v,index(i)] = min(tmp);
end

for i = 1:m
    for j = 1:n
        dstImg(i,j) = index(oriImg(i,j) + 1) -1;
    end
end

figure;
subplot(2,2,1);
imshow(oriImg,[]);
title('original image');

subplot(2,2,2);
bar(s);
title('equlazation histogram');

subplot(2,2,3);
bar(g);
title('std histogram');

subplot(2,2,4);
imshow(dstImg,[]);
title('std image');

