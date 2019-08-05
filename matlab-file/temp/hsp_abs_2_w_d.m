%hsp_abs_2��hsp_abs_2_f������ʽ��Ȼ����ͬ�����ǽ����ȫ��ͬ
close all;
clear all;
clc;

[d,f] = meshgrid(0:0.005:0.5,0:400:100e3);

u0 = 4*pi*1e-7;
Us = 10/1.414;
N1 = 8;
N2 = 8;
r1 = 0.2;
r2 = 0.2;     
ZL = 50;
RL = real(ZL);
R1 = 1;
R2 = 1;  
a1 = 0.5e-3;  %
a2 = 0.5e-3;  %
L1 = u0*r1*N1^2*(log(8*r1/a1)-2); 
C1 = 1/(L1*(2*pi*40e3)^2);
L2 = L1;
C2 = C1;
w = 2*pi*f;
M_fz = pi*u0*N1*N2*(r1*r2)^2;
M_fm = 2*d.^3;
M = M_fz./M_fm;
%**************************************
k = M./sqrt(L1*L2);
%**************************************
S1_abs_2 = (R1*R2 + L1/C1 -(w*L1).^2 + (w.*M).^2 + (R1*RL + w.^2*(RL^2)*C1*L1)./(1 + (w*RL*C1).^2) - (w*RL*C1).^2./((w.^2*C1^2*RL).^2 + (w*C1).^2)).^2 ...
    + (w*L1*(R1 + R2) - R2./(w*C1) + (w*L1*RL-w*(RL^2)*C1*R1)./(1+(w*RL*C1).^2) - (w*C1*RL)./((w.^2*RL*C1^2).^2+(w*C1).^2)).^2;

hsp_2 = (w.*M*RL).^2./((1+(w*RL*C1).^2).*S1_abs_2);
% subplot(2,2,1);

figure(1);
surf(d,f,hsp_2);
xlabel('d:m'),ylabel('f:Hz'),zlabel('hsp_2');
title('hsp_2-(d,f)');

figure(2);
surf(f,d,hsp_2);
xlabel('f:Hz'),ylabel('d:m'),zlabel('hsp_2');
title('hsp_2-(f,d)');

figure(3);
contour(d,f,hsp_2,1000);
xlabel('d:m'),ylabel('f:Hz');
title('hsp_2�ȸ���ͼ');


%�����ǹ������ϵ��͹���Ƶ�ʵ���άͼ
% figure(1);
% surf(f,k,hsp_2);
% xlabel('f:Hz'),ylabel('k'),zlabel('hsp_2');
% title('hsp_2-(f,k)');
% 
% figure(2);
% surf(k,f,hsp_2);
% xlabel('k'),ylabel('f:Hz'),zlabel('hsp_2');
% title('hsp_2-(k,f)');
% 
% figure(3);
% contour(k,f,hsp_2,1000);
% xlabel('k'),ylabel('f:Hz');
% title('hsp_2�ȸ���ͼ');
