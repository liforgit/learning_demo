clear all;
clc;
close all;

I1=imread('claire1.BMP');  %read the first frame
I2=imread('claire2.BMP');  %read the second frame


dm=7;
%��ͼ�����ߣ�ÿ���߶���dm��С
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         |-----|-------------------------------|------|
%         |  B  |              C                |  D   |
%         |-----|-------------------------------|------|
%         |     |                               |      |
%         |     |                               |      |
%         |  E  |               A               |  F   |   ----> ͼ��
%         |     |                               |      |
%         |     |                               |      |
%         |     |                               |      |
%         |-----|-------------------------------|------|
%         |  G  |              H                |  I   |
%         |-----|-------------------------------|------|
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I1=double(I1);
I2=double(I2);
[rownum colnum] = size(I1);


%Ϊ���ı߸�ֵ  ���Լ�д�������
% v=0;
% II=[v*ones(rownum,dm) I1 v*ones(rownum,dm)];
% II=[v*ones(dm,colnum+2*dm);II;v*ones(dm,colnum+2*dm)];

II=zeros(rownum+2*dm,colnum+2*dm);
II(dm+1:dm+rownum,dm+1:dm+colnum)=I1;
for i=1:dm
    II(i,dm+1:dm+colnum)=II(dm+1,dm+1:dm+colnum);
    II(rownum+dm+i,dm+1:dm+colnum)=II(dm+rownum,dm+1:dm+colnum);
end
for j=1:dm
    II(1:rownum+2*dm,j)=II(1:rownum+2*dm,dm+1);
    II(1:rownum+2*dm,colnum+dm+j)=II(1:rownum+2*dm,dm+colnum);
end

%�������ȫ�����㷨
 blocksize=16;
 rowblocks =rownum/blocksize;
 colblocks =colnum/blocksize;
 A=99999999999999999999;         %Ϊ���ҵ���С�ľ���A�����趨һ���ܴ�ĳ�ֵ
 Eij=0;
 xrecord=ones(16,16);            %xrecord��yrecord���ڴ��ƥ���Ŀ�ţ����˶�ʸ��
 yrecord=ones(16,16);
 diff=zeros(256,256);           %���ͼ��Ĵ�СΪ256*256��diff���ڴ�����ز�ֵ
 tic
                for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                    row=x*blocksize;
                   for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                       col=y*blocksize;
%                        tempx=x*blocksize+1:(x+1)*blocksize;
%                        tempy=y*blocksize+1:(y+1)*blocksize;

                                 for p=-dm:dm
                                    for q=-dm:dm      %��p��q����ʾ��x��y��Ӧ�ӿ���ǰһ֡���������λ��
                                        Eij=0;
                                        Eij=sum(sum((I2(row+1:row+blocksize,col+1:col+blocksize)-II(row+dm+p+1:row+dm+p+blocksize,col+dm+q+1:col+dm+q+blocksize)).^2))/(blocksize^2); 
                                        if Eij<A
                                                    A=Eij;
                                                    xrecord(x+1,y+1)=p;
                                                    yrecord(x+1,y+1)=q;
                                            end   
                                    end
                                end
                                A=999999999999999999;
                                for mx=1:blocksize
                                    for ny=1:blocksize
                                        diff(row+mx,col+ny)=I2(row+mx,col+ny)-II(row+mx+dm+xrecord(x+1,y+1),col+ny+dm+yrecord(x+1,y+1));
                                    end
                                end
                                        
                       end
                end
toc
                
                         figure,imshow(I1,[]);
                         title('the first frame');
                         figure,imshow(I2,[]);
                         title('the second frame');
                         IIII=I2-I1;
                         figure,imshow(IIII,[]);
                         title('֡���ֵ');
                         figure,imshow(diff,[]);
                         title('DFD');                         
                         %title('����ȫ�����㷨��ƥ����֡���');
                         for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                             row=x*blocksize;
                             for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                                 col=y*blocksize;
                                 III(row+1:row+blocksize,col+1:col+blocksize)=II(row+dm+xrecord(x+1,y+1)+1:row+dm+xrecord(x+1,y+1)+blocksize,col+dm+yrecord(x+1,y+1)+1:col+dm+yrecord(x+1,y+1)+blocksize)+diff(row+1:row+blocksize,col+1:col+blocksize);
                             end
                         end
                         %III=I1+abs(diff);
                         figure,imshow(III,[]);
                         title('�ָ���ĵڶ�֡ͼ��');
                         
                         ERR=diff;
%                          figure,imshow(ERR,[]);
%                          title('DFD');
 
 numberarray=0:1:255;
 for m=1:255
     numberarray(m+1)=0;
 end;
 zeronumber=0;
 for n=1:rownum 
     for m=1:colnum 
            dif=abs(ERR(m,n));
        if(dif==0)
            temp=zeronumber;
            zeronumber=temp+1;
        else
            numberarray(dif)=numberarray(dif)+1;
        end;
     end;
 end;
 figure;plot(0,zeronumber,'k*');hold on;plot(numberarray,'r*'),title('DFD distribution');hold off;
 
 ERR1=zeros(16,16);
 for i=0:15
     for j=0:15
         ERR1(i+1,j+1)=round(sum(sum(ERR(i*blocksize+1:i*blocksize+blocksize,j*blocksize+1:j*blocksize+blocksize)))/(blocksize*blocksize));
     end
 end
 
 numberarray=0:1:255;
 for m=1:255
     numberarray(m+1)=0;
 end;
 zeronumber=0;
 for n=1:16 
     for m=1:16 
            dif=abs(ERR1(m,n));
        if(dif==0)
            temp=zeronumber;
            zeronumber=temp+1;
        else
            numberarray(dif)=numberarray(dif)+1;
        end;
     end;
 end;
 figure;plot(0,zeronumber,'k*');hold on;plot(numberarray,'r*'),title('DFD(block average) distribution');hold off;
 
 
 
 
 %figure;mesh(diff);figure;contour(diff,15);
 
figure;
 for i=1:16
     for j=1:16
         quiver(i,j,xrecord(i,j)/16,yrecord(i,j)/16); hold on;
     end
 end
 grid on;
figure;quiver(1:16,1:16,yrecord,xrecord);
 grid on;
                   

        