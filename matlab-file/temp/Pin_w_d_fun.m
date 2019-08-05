%x(1)--->f  x(2)--->d
function hsp_2 = Pin_w_d_fun(x)
[d,f] = meshgrid(0:0.015:0.5,0:700:100e3);
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
w = 2*pi*x(1);
M_fz = pi*u0*N1*N2*(r1*r2)^2;
M_fm = 2*x(2).^3;
M = M_fz./M_fm;
%**************************************
k = M./sqrt(L1*L2);
%**************************************

Z1 = R1 + j*w*L1 + 1./(j*w*C1);
Z2 = R2 + j*w*L2;
Z3 = ZL./(1 + j*w.*C2.*ZL);

I1 = Us./(Z1 + (w.*M).^2./(Z2 + Z3));
I2 = j*w.*M.*Us./(Z1.*(Z2 + Z3) + (w.*M).^2);

Pin = real(Us*conj(I1));
Pout = (abs(I2.*Z3)).^2./real(ZL);
eff = Pout./Pin;


S1_abs_2 = (R1*R2 + L1/C1 -(w*L1).^2 + (w.*M).^2 + (R1*RL + w.^2*(RL^2)*C1*L1)./(1 + (w*RL*C1).^2) - (w*RL*C1).^2./((w.^2*C1^2*RL).^2 + (w*C1).^2)).^2 ...
    + (w*L1*(R1 + R2) - R2./(w*C1) + (w*L1*RL-w*(RL^2)*C1*R1)./(1+(w*RL*C1).^2) - (w*C1*RL)./((w.^2*RL*C1^2).^2+(w*C1).^2)).^2;

hsp_2 = (w.*M*RL).^2./((1+(w*RL*C1).^2).*S1_abs_2);

% figure(4);
% surf(d,f,Pin);
% xlabel('d:m'),ylabel('f:Hz'),zlabel('Pin:W');
% title('Pin-(d,f)');
% 
% figure(5);
% surf(f,d,Pin);
% xlabel('f:Hz'),ylabel('d:m'),zlabel('Pin:W');
% title('Pin-(f,d)');
% 
% figure(6);
% contour(d,f,Pin,1000);
% xlabel('d:m'),ylabel('f:Hz');
% title('Pin�ȸ���ͼ');


% figure(4);
% surf(f,k,Pin);
% xlabel('f:Hz'),ylabel('k'),zlabel('Pin');
% title('Pin-(f,k)');
% 
% 
% 
% figure(5);
% surf(k,f,Pin);
% xlabel('k'),ylabel('f:Hz'),zlabel('Pin');
% title('Pin-(k,f)');
% 
% figure(6);
% contour(k,f,Pin,2000);
% xlabel('k'),ylabel('f:Hz');
% title('Pin�ȸ���ͼ');


% figure(1);
% contour(f,d,Pin,1000);

% dhsp_2_dw = diff(hsp_2,w);
% solve(dhsp_2_dw == 0,w)


