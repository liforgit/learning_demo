function [ZI] = bilinear(I,zmf)
if ~exist('I','var') || isempty(I)
    error("输入图像I未定义或为空");
end
if ~exist("zmf","var") || isempty(zmf) || numel(zmf) ~= 1
    error("位移矢量zmf未定义或为空或zmf中的元素超过2");
end
if isstr(I)
    [I,M] = imread(I);
end
if zmf <= 0
    error("缩放倍数zmf的值应该大于0");
end
[IH,IW,ID] = size(I);
ZIH = round(IH*zmf);
ZIW = round(IW*zmf);
ZI = zeros(ZIH,ZIW,ID);
IT = zeros(IH+2,IW+2,ID);
IT(2:IH+1,2:IW+1,:) = I;
IT(1,2:IW+1,:)=I(1,:,:);
IT(IH+2,2:IW+1,:)=I(IH,:,:);
IT(2:IH+1,1,:)=I(:,1,:);
IT(2:IH+1,IW+2,:)=I(:,IW,:);
IT(1,1,:)=I(1,1,:);
IT(1,IW+2,:)=I(1,IW,:);
IT(IH+2,1,:)=I(IH,1,:);
IT(IH+2,IW+2,:)=I(IH,IW,:);

for zj = 1:ZIW
    for zi=1:ZIH
        ii = (zi-1)/zmf;
        jj = (zj-1)/zmf;
        i = floor(ii);
        j = floor(jj);
        u = ii - i;
        v = jj - j;
        i = i +1;
        j = j + 1;
        ZI(zi,zj,:) = (1-u)*(1-v)*IT(i,j,:) + (1-u)*v*IT(i,j+1,:)+u*(1-v)*IT(i+1,j,:)+u*v*IT(i+1,j+1);
    end
end
ZI = uint8(ZI);
figure
imshow(I,M);
figure
imshow(ZI,M);
