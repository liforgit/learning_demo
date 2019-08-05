function [ u,v ] = SequenceSearch(target,ref,p,N,x0,y0)
%SequenceSearch 顺序搜索
%  依次搜索宏块，找到全局中的最优解
%target为目标帧，ref为参考帧，p指示窗口大小(2*p+1)，
%N指示宏块大小，x0,y0为宏块中心坐标
%u v为找到的匹配宏块中心坐标

%扩大尺寸，防止窗口越界
target=EnlargeSize(target,p);
ref=EnlargeSize(ref,p);

%全搜索算法

LARGE_NUM=9999999999999;
min_MAD=LARGE_NUM;
cur_MAD=0;%当前的平均绝对误差
x=x0-N/2;
y=y0-N/2;%目标宏块的左上角顶点坐标，作为原点

diff=zeros(N,N);%误差图

      for  i=-p:p
           for j=-p:p%(i,j)表示子块在参考帧搜索的位置
             cur_MAD=sum(sum(target(x:x+N,y:y+N)-ref(x +i:x+i+N,y+j:y+j+N)))/(N^2);
            if cur_MAD<min_MAD
                min_MAD=cur_MAD;
                u=i;
                v=j;
            end;
           end;
      end;

      %绘制误差图
      for i=1:N
          for j=1:N
              diff(i,j)=target(x+i,y+j)-ref(x+u+i,y+v+j);
          end;
      end;
      
      figure,imshow(target,[]);
      title('target frame');
      figure,imshow(ref,[]);
      title('reference frame');
      frmdiff=target-ref;
      figure,imshow(frmdiff,[]);
      title('difference between two frames');
      figure,imshow(diff,[]);
      disp('顺序搜索 运动向量 ');disp(u);disp(v);
      title('difference in the macroblock');

end

