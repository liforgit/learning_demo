close all;

srcImg = imread('/usr/local/MATLAB/R2017a/toolbox/images/imdata/baby.jpg');
subplot(2,2,1);
imshow(srcImg);
title("原图");

% 验证图像分辨率对细节分辨率的影响
dstImg128 = imresize(srcImg, [128,128]);
subplot(2,2,2);
imshow(dstImg128);
title("128x128 图像");

dstImg1024 = imresize(srcImg,[1024,1024]);
subplot(2,2,3);
imshow(dstImg1024);
title("1024x1024 图像");

% 验证灰度级数对细节分辨率的影响
dstImg = imadjust(srcImg, [0,0.5],[]);
subplot(2,2,4);
imshow(dstImg);
title("改变灰度后的图像");


