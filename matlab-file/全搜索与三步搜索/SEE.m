clear all;
clc;
close all;

I1=imread('claire1.BMP');  %read the first frame
I2=imread('claire2.BMP');  %read the second frame

dm=7;

I1=double(I1);
I2=double(I2);
[rownum colnum] = size(I1);

v=0;
II=[v*ones(rownum,dm) I1 v*ones(rownum,dm)];
II=[v*ones(dm,colnum+2*dm);II;v*ones(dm,colnum+2*dm)];

%�������ȫ�����㷨
 blocksize=16;
 rowblocks =rownum/blocksize;
 colblocks =colnum/blocksize;
 A=99999999999999999999;         %Ϊ���ҵ���С�ľ���A�����趨һ���ܴ�ĳ�ֵ
 Eij=0;
 xrecord=ones(32,32);            %xrecord��yrecord���ڴ��ƥ���Ŀ�ţ����˶�ʸ��
 yrecord=ones(32,32);
 diff=zeros(256,256);           %���ͼ��Ĵ�СΪ256*256��diff���ڴ�����ز�ֵ
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

                         III=I1+abs(diff);

%��������������㷨
 blocksize=16;
 rowblocks =rownum/blocksize;
 colblocks =colnum/blocksize;
 A=99999999999999999999;         %Ϊ���ҵ���С�ľ���A�����趨һ���ܴ�ĳ�ֵ
 Eij=0;
 xrecord=ones(32,32);            %xrecord��yrecord���ڴ��ƥ���Ŀ�ţ����˶�ʸ��
 yrecord=ones(32,32);
 diff=zeros(256,256);           %���ͼ��Ĵ�СΪ256*256��diff���ڴ�����ز�ֵ
                for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                    row=x*blocksize;
                   for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                       col=y*blocksize;
%                        tempx=x*blocksize+1:(x+1)*blocksize;
%                        tempy=y*blocksize+1:(y+1)*blocksize;
                                 for p1=-4:4:4              %��һ��
                                    for q1=-4:4:4     %��p��q����ʾ��x��y��Ӧ�ӿ���ǰһ֡���������λ��
                                        Eij=0;
                                        Eij=sum(sum((I2(row+1:row+blocksize,col+1:col+blocksize)-II(row+dm+p1+1:row+dm+p1+blocksize,col+dm+q1+1:col+dm+q1+blocksize)).^2))/(blocksize^2);
                                            if Eij<A
                                                    A=Eij;
                                                    xrecord(x+1,y+1)=p1;
                                                    yrecord(x+1,y+1)=q1;
                                            end   
                                    end
                                 end
                                 
                                 p1=xrecord(x+1,y+1);
                                 q1=yrecord(x+1,y+1);
                                 for p2=p1-2:2:p1+2         %�ڶ���
                                     for q2=q1-2:2:q1+2
                                         if p2~=p1 | q2~=q1
                                         Eij=0;
                                         Eij=sum(sum((I2(row+1:row+blocksize,col+1:col+blocksize)-II(row+dm+p2+1:row+dm+p2+blocksize,col+dm+q2+1:col+dm+q2+blocksize)).^2))/(blocksize^2);
                                            if Eij<A
                                                    A=Eij;
                                                    xrecord(x+1,y+1)=p2;
                                                    yrecord(x+1,y+1)=q2;
                                            end 
                                         end
                                     end
                                 end
                                 
                                 p2=xrecord(x+1,y+1);
                                 q2=yrecord(x+1,y+1);
                                 for p3=p2-1:1:p2+1        %����
                                     for q3=q2-1:1:q2+1
                                         if p3~=p2 | q3~=q2 
                                         Eij=0;
                                         Eij=sum(sum((I2(row+1:row+blocksize,col+1:col+blocksize)-II(row+dm+p3+1:row+dm+p3+blocksize,col+dm+q3+1:col+dm+q3+blocksize)).^2))/(blocksize^2);
                                            if Eij<A
                                                    A=Eij;
                                                    xrecord(x+1,y+1)=p3;
                                                    yrecord(x+1,y+1)=q3;
                                            end 
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
                 IIII=I1+abs(diff);
                         
subplot(2,2,1),imshow(I1,[]),title('the first frame');
subplot(2,2,2),imshow(I2,[]),title('the second frame');
subplot(2,2,3),imshow(III,[]),title('FS');
subplot(2,2,4),imshow(IIII,[]),title('3SS');
                   

        