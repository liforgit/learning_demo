close all
clear all
clc;
%  图像输入


fixed = dicomread('/usr/local/MATLAB/R2017a/toolbox/images/imdata/knee1.dcm');      % 读参考图像fixed

moving = dicomread('/usr/local/MATLAB/R2017a/toolbox/images/imdata/knee2.dcm'); %  读浮动图像moving



figure, imshowpair(moving, fixed, 'montage');
title('Unregistered');


%粗配准
[optimizer, metric] = imregconfig('multimodal');


%配准
movingRegisteredDefault = imregister(moving, fixed, 'affine', optimizer, metric);
figure, imshowpair(movingRegisteredDefault, fixed);
title('A: Default registration');


%提高配准精度
optimizer.MaximumIterations = 300;
movingRegisteredAdjustedInitialRadius300 = imregister(moving, fixed, 'affine', optimizer, metric);
figure, imshowpair(movingRegisteredAdjustedInitialRadius300, fixed);
title('B: Adjusted InitialRadius, MaximumIterations = 300, Adjusted InitialRadius.');
disp('optimizer');
disp('metric');


tformSimilarity = imregtform(moving,fixed,'similarity',optimizer,metric);
Rfixed = imref2d(size(fixed));


%依据tformSimilarity变换
movingRegisteredRigid = imwarp(moving,tformSimilarity,'OutputView',Rfixed);
figure, imshowpair(movingRegisteredRigid, fixed);
title('C: Registration based on similarity transformation model.');


%精确配准


movingRegisteredAffineWithIC = imregister(moving,fixed,'affine',optimizer,metric,...
    'InitialTransformation',tformSimilarity);
figure, imshowpair(movingRegisteredAffineWithIC,fixed);
title('D: Registration from affine model based on similarity initial condition.');


%you tell the end


figure
imshowpair(movingRegisteredDefault, fixed)
title('A - Default settings.');


% figure
% imshowpair(movingRegisteredAdjustedInitialRadius, fixed)
% title('B - Adjusted InitialRadius, 100 Iterations.');


figure
imshowpair(movingRegisteredAdjustedInitialRadius300, fixed)
title('C - Adjusted InitialRadius, 300 Iterations.');


figure
imshowpair(movingRegisteredAffineWithIC, fixed)
title('D - Registration from affine model based on similarity initial condition.');