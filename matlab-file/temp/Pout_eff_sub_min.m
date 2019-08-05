% 频率范围 0hz--100khz 步长 1khz 
% 距离范围 0--0.2 步长 0.01 
%
A =[];
b = [];
Aeq = [];
beq = [];
nonlcon = [];
options = optimoptions(@fmincon,'Display','iter','Algorithm','interior-point');%zhelishezhi options suanfa!
% [x,fval] = fmincon(@Pout_eff_sub,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);


fstep = 1e3;   %频率步长
dstep = 0.01;   %距离步长
f = [1600, 2400, 3600, 4000, 5600, 6800, 7600, 9600, 1.12e4, 1.28e4,...
    1.44e4, 1.6e4, 1.72e4, 1.88e4, 2e4, 2.16e4, 2.28e4, 2.44e4, 2.52e4, 2.68e4,...
    2.76e4, 2.92e4, 3.04e4, 3.08e4, 3.2e4, 3.24e4, 3.32e4, 3.48e4, 3.52e4, 3.72e4,...
    4.6e4, 4.68e4, 4.88e4, 5.04e4, 5.28e4, 5.6e4, 5.96e4,6.65e4];

d = [0.02, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05, 0.055, 0.06, 0.065, ...
    0.07, 0.075, 0.08, 0.085, 0.09, 0.095, 0.1, 0.105, 0.11, 0.115, ...
    0.12, 0.125, 0.13, 0.135, 0.14, 0.145, 0.15, 0.155, 0.16, 0.165,...
    0.18, 0.175, 0.17, 0.165, 0.16, 0.155, 0.15, 0.145];

for ii = 1:38 
    x0 = [f(ii),d(ii)];                    %起始点
    lb = [f(ii)-fstep,d(ii)-dstep];        %低范围
    ub = [f(ii)+fstep,d(ii)+dstep];        %高范围
    [x,fval] = fmincon(@hsp_abs_2_fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);   
    
    dlmwrite('mindata.txt',x,'-append');
end

