function sortblock= sort_point(block)
%�������������Ķ���ν�������ʹ�����˳�����ӳ�͹�����

sortblock=block';%ת��block����
sortblock=sortrows(sortblock,2);%�����ϰ������x����������
sortblock=sortblock';%ת��

up=[sortblock(:,1)];%�ڵ�һ���㼰���һ���������Ϸ��ĵ㼯
down=[sortblock(:,1)];%�ڵ�һ���㼰���һ���������·��ĵ㼯

syms x y;
n=length(sortblock);  
f=(sortblock(2,n)-sortblock(2,1))*(y-sortblock(3,1))-(sortblock(3,n)-sortblock(3,1))*(x-sortblock(2,1));
%�õ���һ���������һ��������ֱ�ߵķ���

for k=2:n
    if subs(f,{x,y},{sortblock(2,k),sortblock(3,k)})>=0
        %����м������������ֱ���Ϸ�������뵽up����
        up=[up,sortblock(:,k)];
    else
        %�·��ĵ���뵽down����
        down=[down,sortblock(:,k)];
    end
end

size_down=size(down);
for k=size_down(2):-1:1
    %��down����ĵ��������up����
    up=[up,down(:,k)];
end
%down�ļ���ʹup�����Ϊ��λ������͹����ε㼯

sortblock=up;
end

