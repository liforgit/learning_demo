%分段处理函数
%分四种情况处理
%1 r1 < r2
%2 r1 == r2
%3 r1 > r2
%4 r2 == 1
%还有其他情况待完善
function pieceLinearTran(oriImg,r1,s1,r2,s2)

if r1 > r2
    error('r1 can not greater than r2');
end

[m,n,~] = size(oriImg);
dstImg = zeros(m,n);

%算法核心
for i = 1:m
    for j = 1:n
        r = oriImg(i,j);
        if r2 == 1
            dstImg(i,j) = (s1/r1)*r; 
        elseif r1 < r2
            if r < r1
                dstImg(i,j) = (s1/r1)*r; 
            elseif r < r2
                dstImg(i,j) = ((s1-s2)/(r1-r2))*(r-r2) + s2;
            else
                dstImg(i,j) = ((1-s2)/(1-r2))*(r-r2) + s2;
            end
        elseif r1 == r2
            if r < r1
                dstImg(i,j) = (s1/r1)*r; 
            else
                dstImg(i,j) = ((1-s2)/(1-r2))*(r-r2) + s2;
            end
        end
    end
end

figure;
subplot(1,2,1);
imshow(oriImg,[]);
title('original image');

subplot(1,2,2);
imshow(dstImg,[]);
title('piece linear tranfer image');
