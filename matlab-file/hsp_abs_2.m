syms  d f

w = 2*pi*f;
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

M_fz = pi*u0*N1*N2*(r1*r2)^2;
M_fm = 2*d^3;
M = M_fz/M_fm;


Z1 = R1 + 1i*w*L1 + 1/(1i*w*C1);
Z2 = R2 + 1i*w*L2; 
Z3 = RL/(1 + 1i*w*C2*RL);
I2 = 1i*w*M*Us/(Z1*(Z2+Z3)+(w*M)^2);
hsp = (I2*Z3)/Us;

S1_abs_2 = (R1*R2 + L1/C1 -(w*L1).^2 + (w*M).^2 + (R1*RL + w.^2*(RL^2)*C1*L1)./(1 + (w*RL*C1).^2) - (w*RL*C1).^2./((w.^2*C1^2*RL).^2 + (w*C1).^2)).^2 ...
    + (w*L1*(R1 + R2) - R2./(w*C1) + (w*L1*RL-w*(RL^2)*C1*R1)./(1+(w*RL*C1).^2) - (w*C1*RL)./((w.^2*RL*C1^2).^2+(w*C1).^2)).^2;

hsp_2 = (w*M*RL).^2./((1+(w*RL*C1).^2).*S1_abs_2);

dhsp_2_dw = diff(hsp_2,f);

solve(dhsp_2_dw == 0,f)
