function output = PointInBlock(point,Arg)
%判断一个点是否在障碍区域内
%在障碍区域内返回1，不在返回0
output=1;
point=[point;0];
n=size(Arg);
n=n(2);
if n==3
    %因为三角形障碍区域未进行处理，在此处进行按x轴坐标排序
    Arg=Arg';
    sortrows(Arg,1);
    Arg=Arg';
end
Arg=[Arg;zeros(1,n)];
Arg=[Arg];
vec=[];
for i=1:n
    %得到由用户坐标指向障碍区域顶点的向量
    vec=[vec,Arg(:,i)-point];
end
for j=1:n-1
    %利用叉乘的方法进行判断
    flag=cross(vec(:,j),vec(:,j+1));
    if flag(3)>=0
        output=-1;
        break;
    end
end
end

