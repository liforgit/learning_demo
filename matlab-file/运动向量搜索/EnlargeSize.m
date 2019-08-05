function [ res ] = EnlargeSize( pic,p )
%EnlargeSize 扩大图片尺寸
%   四周扩展大小为p的范围，值等于贴边的那一条
[rownum,colnum]=size(pic);

res=zeros(rownum+2*p,colnum+2*p);
res(p+1:p+rownum,p+1:p+colnum)=pic;

for i=1:p
    res(i,p+1:p+colnum)=res(p+1,p+1:p+colnum);
    res(rownum+p+i,p+1:p+colnum)=res(p+rownum,p+1:p+colnum);
end;
for j=1:p
    res(1:rownum+2*p,j)=res(1:rownum+2*p,p+1);
    res(1:rownum+2*p,colnum+p+j)=res(1:rownum+2*p,p+colnum);
end;

end

