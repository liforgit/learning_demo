function [ Y,U,V ] = yuv_import(filename,dims,numfrm,startfrm)
%yuv_import 读取YUV格式的视频
%   读入YUV视频分别获得Y U V分量的数据
%filename为文件路径，dims为图像的分辨率大小[width height]，numfrm为帧数
fid=fopen(filename,'r');
if(fid<0)
    error('File does not exist!');
end;

Yd=zeros(dims(1),dims(2));
UVd=zeros(dims(1)/2,dims(2)/2);

frelem=numel(Yd)+2*numel(UVd);%一帧图像总的像素个数

%if we have the 'starting frame'
if(nargin==4)
    fseek(fid,startfrm*frelem,0);
end;

Y=cell(1,numfrm);
U=cell(1,numfrm);
V=cell(1,numfrm);
for i=1:numfrm
    Yd=fread(fid,[dims(1) dims(2)],'uint8');
    Y{i}=Yd';
    UVd=fread(fid,[dims(1)/2 dims(2)/2],'uint8');
    U{i}=UVd';
    UVd=fread(fid,[dims(1)/2 dims(2)/2],'uint8');
    V{i}=UVd';
end;


end

