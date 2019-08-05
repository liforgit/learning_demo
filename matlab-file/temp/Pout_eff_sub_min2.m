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
f = [3500, 7000, 1.05e4, 1.54e4, 2.03e4, 2.38e4, 2.66e4, 3.01e4, 3.43e4, 3.57e4,...
    3.71e4, 3.92e4, 4.06e4, 4.06e4, 4.06e4, 4.06e4, 4.06e4, 4.55e4, 4.62e4, 4.97e4, ...
    4.97e4, 5.6e4, 5.6e4, 6.51e4, 7.35e4, 7.56e4];

d = [0.03, 0.045, 0.06, 0.075, 0.09, 0.105, 0.12, 0.135, 0.15, 0.165,...
    0.18, 0.195, 0.21, 0.225, 0.24, 0.255, 0.27, 0.195, 0.18, 0.18, ...
    0.165, 0.165, 0.15, 0.15, 0.15, 0.135];

for ii = 1:26 
    x0 = [f(ii),d(ii)];                    %起始点
    lb = [f(ii)-fstep,d(ii)-dstep];        %低范围
    ub = [f(ii)+fstep,d(ii)+dstep];        %高范围
    [x,fval] = fmincon(@Pin_w_d_fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);   
    
    dlmwrite('mindata2.txt',x,'-append');
end

