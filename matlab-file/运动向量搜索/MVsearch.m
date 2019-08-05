close all;
clear all;
clc;
dims=[176 144];
numfrm=300;
startfrm=1;
[Y,U,V]=yuv_import('foreman_qcif.yuv',dims,numfrm,startfrm);
%imshow(Y{1},[]);
frame1=Y{1};
frame2=Y{2};
% frame3=Y{3};
% frame5=Y{5};
% frame10=Y{10};
% frame20=Y{20};
% frame50=Y{50};
% frame100=Y{100};

p=7;%window size=2*p+1
N=16;%size of macroblock16*16

x0=dims(1)/2;%coordinate of macroblock center in target frame
y0=dims(2)/2;
[u2,v2]=LogSearch(frame1,frame2,10,N,x0,y0);

