function [ u,v ] = SequenceSearch(target,ref,p,N,x0,y0)
%SequenceSearch ˳������
%  ����������飬�ҵ�ȫ���е����Ž�
%targetΪĿ��֡��refΪ�ο�֡��pָʾ���ڴ�С(2*p+1)��
%Nָʾ����С��x0,y0Ϊ�����������
%u vΪ�ҵ���ƥ������������

%����ߴ磬��ֹ����Խ��
target=EnlargeSize(target,p);
ref=EnlargeSize(ref,p);

%ȫ�����㷨

LARGE_NUM=9999999999999;
min_MAD=LARGE_NUM;
cur_MAD=0;%��ǰ��ƽ���������
x=x0-N/2;
y=y0-N/2;%Ŀ��������ϽǶ������꣬��Ϊԭ��

diff=zeros(N,N);%���ͼ

      for  i=-p:p
           for j=-p:p%(i,j)��ʾ�ӿ��ڲο�֡������λ��
             cur_MAD=sum(sum(target(x:x+N,y:y+N)-ref(x +i:x+i+N,y+j:y+j+N)))/(N^2);
            if cur_MAD<min_MAD
                min_MAD=cur_MAD;
                u=i;
                v=j;
            end;
           end;
      end;

      %�������ͼ
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
      disp('˳������ �˶����� ');disp(u);disp(v);
      title('difference in the macroblock');

end

