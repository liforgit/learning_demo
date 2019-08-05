%均值滤波器
%M,N是滤波器的模板，应为同型奇数,如3x3,5x5
function dstImg=averageFilter(oriImg,M,N)
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

sum = 0;
%算法的执行,逐行扫描
for i = start+1:m+start
    for j = start+1:n+start
        
        for ii = -start:start
            for jj = -start:start
                sum = sum + extendOriImg(i+ii,j+jj);
            end
        end
        dstImg(i-start,j-start) = sum/(M * N);
        sum = 0;
    end
end
