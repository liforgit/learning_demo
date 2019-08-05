function f = Pout_eff_sub(x)

u0 = 4*pi*1e-7;
Us = 10/1.414;
N1 = 8;
N2 = 8;
r1 = 0.2;
r2 = 0.2;     
ZL = 50;
R1 = 1;
R2 = 1;               
a1 = 0.5e-3;  %
a2 = 0.5e-3;  %
L1 = u0*r1*N1^2*(log(8*r1/a1)-2); 
C1 = 1/(L1*(2*pi*40e3)^2);
L2 = L1;
C2 = C1;

M_fz = pi*u0*N1*N2*(r1*r2)^2;
M_fm = 2*0.246.^3;
M = M_fz./M_fm;
R =R1;
C = C1;
L = L1;
RL = real(ZL);
XL = imag(ZL);
w1 = 2*pi*x(1);
w2 = 2*pi*x(2);

Z3R = (RL.*(1 - w1.*XL.*C2) + XL.*w1.*RL.*C2)./((1-w1.*XL.*C2).^2 + (w1.*RL.*C2).^2);
Z3L = (XL.*(1 - w1.*XL.*C2) - w1.*RL.^2.*C2)./((1-w1.*XL.*C2).^2 + (w1.*RL.*C2).^2);
Z3_2 = Z3R.^2 + Z3L.^2;
ZL_2 = RL.^2 + XL.^2;
A = R.*(R + Z3R) - (w1.*L - 1./(w1.*C)).*(w1.*L + Z3L) + (w1.*M).^2;
B = (w1.*L - 1./(w1.*C)).*(R + Z3R) + R.*(w1.*L + Z3L);
I2_2 = ((w1.*M).^2.*Us.^2)./(A.^2 + B.^2);
Pout = I2_2.*Z3_2.*real(ZL)./ZL_2;
Z2_add_Z3 = sqrt((R + Z3R).^2 + (w1.*L + Z3L).^2);
Pin = Us.^2.*Z2_add_Z3./sqrt(A.^2 + B.^2);
eff = Pout./Pin;
Pout_eff = Pout.*eff;


Z3R_1 = (RL.*(1 - w2.*XL.*C2) + XL.*w2.*RL.*C2)./((1-w2.*XL.*C2).^2 + (w2.*RL.*C2).^2);
Z3L_1 = (XL.*(1 - w2.*XL.*C2) - w2.*RL.^2.*C2)./((1-w2.*XL.*C2).^2 + (w2.*RL.*C2).^2);
Z3_2_1 = Z3R_1.^2 + Z3L_1.^2;
ZL_2 = RL.^2 + XL.^2;
A_1 = R.*(R + Z3R_1) - (w2.*L - 1./(w2.*C)).*(w2.*L + Z3L_1) + (w2.*M).^2;
B_1 = (w2.*L - 1./(w2.*C)).*(R + Z3R_1) + R.*(w2.*L + Z3L_1);
I2_2_1 = ((w2.*M).^2.*Us.^2)./(A_1.^2 + B_1.^2);
Pout_1 = I2_2_1.*Z3_2_1.*real(ZL)./ZL_2;
Z2_add_Z3_1 = sqrt((R + Z3R_1).^2 + (w2.*L + Z3L_1).^2);
Pin_1 = Us.^2.*Z2_add_Z3_1./sqrt(A_1.^2 + B_1.^2);
eff_1 = Pout_1./Pin_1;
Pout_eff_1 = Pout_1.*eff_1;

f = abs(Pout_eff - Pout_eff_1);
