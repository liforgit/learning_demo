%中值滤波
%M,N是滤波器的模板，应为同型奇数,如3x3,5x5
function dstImg=middleFilter(oriImg,M,N)
[m,n,~] = size(oriImg);
dstImg = zeros(m,n);

%边沿扩展
extendOriImg = zeros(m+M-1,n+N-1);
start = fix(M/2);
for i = 1:m
    for j = 1:n
        extendOriImg(i+start,j+start) = oriImg(i,j);
    end
end

order = zeros(1,M*N);
aa = 0;
temp = 0;
%算法的执行,逐行扫描
for i = start+1:m+start
    for j = start+1:n+start
        k=1;
        for ii = -start:start
            for jj = -start:start
                order(k) = extendOriImg(i+ii,j+jj);  %将二维像素映射到一维数组
                k = k + 1;
            end
        end
        
        k = k-1;
        for a = 1:k
            aa = k - a;
            for b = 1:aa
                if order(b) < order(b+1)   %将一维数组从大到小排序
                    temp = order(b);
                    order(b) = order(b+1);
                    order(b+1) = temp;
                end
            end
        end
        
        dstImg(i-start,j-start) = order(fix (k/2) + 1);  %将中值赋给目标图像点
    end
end