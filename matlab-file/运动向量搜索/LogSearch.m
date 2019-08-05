function [ u,v ] = LogSearch( target,ref,p,N,x0,y0 )
%LogSearch 2D对数搜索函数
%进行2D对数搜索，每次选取9个位置进行对比

%扩大尺寸,防止窗口越界
target=EnlargeSize(target,p);
ref=EnlargeSize(ref,p);

%2D对数搜索
LARGE_NUM=9999999999999;
min_MAD=LARGE_NUM;
cur_MAD=0;%当前的平均绝对误差
x=x0-N/2;
y=y0-N/2;%目标宏块的左上角顶点坐标，作为原点
diff=zeros(N,N);%误差图

offset=ceil(p/2);

%9个点的位置自行定义
%这里以target里目标宏块的中心位置作为中心扩展开来
%cp0  cp1  cp2
%cp3 cp4 cp5
%cp6 cp7 cp8
cp=cell(1,9);
cp0.val=ref(x0-offset,y0-offset);cp0.x=x0-offset;cp0.y=y0-offset;
cp1.val=ref(x0,y0-offset);cp1.x=x0;cp1.y=y0-offset;
cp2.val=ref(x0+offset,y0-offset);cp2.x=x0+offset;cp2.y=y0-offset;
cp3.val=ref(x0-offset,y0);cp3.x=x0-offset;cp3.y=y0;
cp4.val=ref(x0,y0);cp4.x=x0;cp4.y=y0;
cp5.val=ref(x0+offset,y0);cp5.x=x0+offset;cp5.y=y0;
cp6.val=ref(x0-offset,y0+offset);cp6.x=x0-offset;cp6.y=y0+offset;
cp7.val=ref(x0,y0+offset);cp7.x=x0;cp7.y=y0+offset;
cp8.val=ref(x0+offset,y0+offset);cp8.x=x0+offset;cp8.y=y0+offset;
cp{1}=cp0;
cp{2}=cp1;
cp{3}=cp2;
cp{4}=cp3;
cp{5}=cp4;
cp{6}=cp5;
cp{7}=cp6;
cp{8}=cp7;
cp{9}=cp8;

last=0;
while(last~=1)
    for i=1:9
        cur_MAD=sum(sum(target(x:x+N,y:y+N)-ref(cp{i}.x-N/2:cp{i}.x+N/2,cp{i}.y-N/2:cp{i}.y+N/2)))/(N^2);
        if cur_MAD<min_MAD
            min_MAD=cur_MAD;
            u=cp{i}.x;
            v=cp{i}.y;
        end
    end
    if offset==1
        last=1;
    end
    offset=ceil(offset/2);
    cp{1}.x=u-offset;cp{1}.y=v-offset;
    cp{2}.x=u;cp{2}.y=v-offset;
    cp{3}.x=u+offset;cp{3}.y=v-offset;
    cp{4}.x=u-offset;cp{4}.y=v;
    cp{5}.x=u;cp{5}.y=v;
    cp{6}.x=u+offset;cp{6}.y=v;
    cp{7}.x=u-offset;cp{7}.y=v+offset;
    cp{8}.x=u;cp{8}.y=v+offset;
    cp{9}.x=u+offset;cp{9}.y=v+offset;
    
end

  %绘制误差图
      for i=1:N
          for j=1:N
              diff(i,j)=target(x+i,y+j)-ref(u-N/2+i,v-N/2+j);
          end
      end
      
      figure,imshow(target,[]);
      title('target frame');
      figure,imshow(ref,[]);
      title('reference frame');
      frmdiff=target-ref;
      figure,imshow(frmdiff,[]);
      title('difference between two frames');
      figure,imshow(diff,[]);
      disp('对数搜索 运动向量');disp(u-x0);disp(v-y0);
      title('difference in the macroblock'); 
end

