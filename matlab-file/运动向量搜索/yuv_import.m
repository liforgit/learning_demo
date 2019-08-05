function [ Y,U,V ] = yuv_import(filename,dims,numfrm,startfrm)
%yuv_import ��ȡYUV��ʽ����Ƶ
%   ����YUV��Ƶ�ֱ���Y U V����������
%filenameΪ�ļ�·����dimsΪͼ��ķֱ��ʴ�С[width height]��numfrmΪ֡��
fid=fopen(filename,'r');
if(fid<0)
    error('File does not exist!');
end;

Yd=zeros(dims(1),dims(2));
UVd=zeros(dims(1)/2,dims(2)/2);

frelem=numel(Yd)+2*numel(UVd);%һ֡ͼ���ܵ����ظ���

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

