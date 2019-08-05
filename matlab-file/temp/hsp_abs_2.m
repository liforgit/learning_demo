clear all;
close all;
clc;

syms d f

%ȷ��������ʽ
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
Z1 = R1 + j*w*L1 + 1/(j*w*C1);
Z2 = R2 + j*w*L2; 
Z3 = RL/(1 + j*w*C2*RL);
I2 = j*w*M*Us/(Z1*(Z2+Z3)+(w*M)^2);
hsp = (I2*Z3)/Us;
S1_abs_2 = (R1*R2 + L1/C1 -(w*L1).^2 + (w*M).^2 + (R1*RL + w.^2*(RL^2)*C1*L1)./(1 + (w*RL*C1).^2) - (w*RL*C1).^2./((w.^2*C1^2*RL).^2 + (w*C1).^2)).^2 ...
    + (w*L1*(R1 + R2) - R2./(w*C1) + (w*L1*RL-w*(RL^2)*C1*R1)./(1+(w*RL*C1).^2) - (w*C1*RL)./((w.^2*RL*C1^2).^2+(w*C1).^2)).^2;

%二元高次函数,自变量f,d
%范围 d = 0 ~ 0.2 步长 0.00001
%范围 f = 0 ~ 40 000hz  步长 1hz
f = 1;
d = 0.1;
hsp_2 = (w*M*RL).^2./((1+(w*RL*C1).^2).*S1_abs_2)

% %��פ��
% dhsp_2_df = diff(hsp_2,f);  
% dhsp_2_dd = diff(hsp_2,d);   
% h1 = ezplot(dhsp_2_df,[0 0.3 0 100e3]); 
% set(h1,'Color','red','LineWidth',1.5);
% 
% hold on
% h2 = ezplot(dhsp_2_dd,[0 0.3 0 100e3]);
% set(h2,'Color','black','LineWidth',1.5);
% title('hsp_abs_2');
% hold off


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %�����Ǻ�ɭ������ֵ��ķ�����
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %��פ��
% dhsp_2_dw = diff(hsp_2,w);
% dhsp_2_dd = diff(hsp_2,d);
% eqns = [dhsp_2_dw == 0,dhsp_2_dd == 0];
% vars = [w,d];
% [solv, solu] = solve(eqns,vars);
% %��ɭ����
% A = diff(hsp_2,w,2);
% B = diff(diff(hsp_2,w),d);
% C = diff(hsp_2,d,2);
% %פ�����ȷ����ֵ��
% %A>0,AC-B^2>0,f(P0)Ϊ��Сֵ�㣻
% %A>0,AC-B^2<0,f(P0)Ϊ����ֵ�㣻
% %AC-B^2<0,f(P0)��Ϊ��ֵ�㣻
% A_data = subs(A, {w, d}, {solv,solu});
% B_data = subs(B, {w, d}, {solv,solu});
% C_data = subs(C, {w, d}, {solv,solu});
% result = A_data.*C_data - B_data.^2
