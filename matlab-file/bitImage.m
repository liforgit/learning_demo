function bitImage()

oriImg = imread('~/Pictures/imageprocess/lena.jpg');
oriImg = rgb2gray(oriImg);

[m,n,~] = size(oriImg);
dstImg1 = zeros(m,n);
dstImg2 = zeros(m,n);
dstImg3 = zeros(m,n);
dstImg4 = zeros(m,n);
dstImg5 = zeros(m,n);
dstImg6 = zeros(m,n);
dstImg7 = zeros(m,n);
dstImg8 = zeros(m,n);

dstReImg1 = zeros(m,n);
dstReImg2 = zeros(m,n);
dstReImg3 = zeros(m,n);
dstReImg4 = zeros(m,n);
dstReImg5 = zeros(m,n);
dstReImg6 = zeros(m,n);
dstReImg7 = zeros(m,n);
dstReImg8 = zeros(m,n);

%分解比特平面
 for i = 1:m
     for j = 1:n
         pix = oriImg(i,j);
         dstImg1(i,j) = bitand(pix,2.^0);  
         dstImg2(i,j) = bitand(pix,2.^1); 
         dstImg3(i,j) = bitand(pix,2.^2); 
         dstImg4(i,j) = bitand(pix,2.^3); 
         dstImg5(i,j) = bitand(pix,2.^4);  
         dstImg6(i,j) = bitand(pix,2.^5); 
         dstImg7(i,j) = bitand(pix,2.^6); 
         dstImg8(i,j) = bitand(pix,2.^7);
     end
 end
 
 %重建原图像
 dstImg1 = im2double(dstImg1);
 dstImg2 = im2double(dstImg2);
 dstImg3 = im2double(dstImg3);
 dstImg4 = im2double(dstImg4);
 dstImg5 = im2double(dstImg5);
 dstImg6 = im2double(dstImg6);
 dstImg7 = im2double(dstImg7);
 dstImg8 = im2double(dstImg8);
 
 for i = 1:m
     for j = 1:n
        dstReImg1(i,j) = dstImg1(i,j) * 2.^0;
        dstReImg2(i,j) = dstImg2(i,j) * 2.^1;
        dstReImg3(i,j) = dstImg3(i,j) * 2.^2;
        dstReImg4(i,j) = dstImg4(i,j) * 2.^3;
        dstReImg5(i,j) = dstImg5(i,j) * 2.^4;
        dstReImg6(i,j) = dstImg6(i,j) * 2.^5;
        dstReImg7(i,j) = dstImg7(i,j) * 2.^6;
        dstReImg8(i,j) = dstImg8(i,j) * 2.^7;
     end
 end
 
 %显示提取后的比特平面
 figure;
 subplot(3,3,1);
 imshow(oriImg,[]);
 title('original image');
 
 subplot(3,3,2);
 imshow(dstImg1,[]);
 title('dst 1 bit image');
 
 subplot(3,3,3);
 imshow(dstImg2,[]);
 title('dst 2 bit image');
 
 subplot(3,3,4);
 imshow(dstImg3,[]);
 title('dst 3 bit image');
 
 subplot(3,3,5);
 imshow(dstImg4,[]);
 title('dst 4 bit image');
 
 subplot(3,3,6);
 imshow(dstImg5,[]);
 title('dst 5 bit image');
 
 subplot(3,3,7);
 imshow(dstImg6,[]);
 title('dst 6 bit image');
 
 subplot(3,3,8);
 imshow(dstImg7,[]);
 title('dst 7 bit image');
 
 subplot(3,3,9);
 imshow(dstImg8,[]);
 title('dst 8 bit image');
 
 %显示重建后的图像
 figure;
 subplot(2,2,1)
 imshow(oriImg,[]);
 title('original image');
 
 subplot(2,2,2);
 imshow(dstReImg8 + dstReImg7,[]);
 title('using bit 8 and bit 7');
 
 subplot(2,2,3);
 imshow(dstReImg8+dstReImg7+dstReImg6,[]);
 title('using bit 8,7 and bit 6');
 
 subplot(2,2,4);
 imshow(dstReImg8+dstReImg7+dstReImg6+dstReImg5,[]);
 title('using bit 8,7,6 and bit 5');
 