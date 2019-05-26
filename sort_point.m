function sortblock= sort_point(block)
%将边数超过三的多边形进行排序，使其可以顺序连接成凸多边形

sortblock=block';%转置block矩阵
sortblock=sortrows(sortblock,2);%按照障碍区域的x轴坐标升序
sortblock=sortblock';%转置

up=[sortblock(:,1)];%在第一个点及最后一个点连线上方的点集
down=[sortblock(:,1)];%在第一个点及最后一个点连线下方的点集

syms x y;
n=length(sortblock);  
f=(sortblock(2,n)-sortblock(2,1))*(y-sortblock(3,1))-(sortblock(3,n)-sortblock(3,1))*(x-sortblock(2,1));
%得到第一个点与最后一个点所在直线的方程

for k=2:n
    if subs(f,{x,y},{sortblock(2,k),sortblock(3,k)})>=0
        %如果中间点在上述所求直线上方，则加入到up矩阵
        up=[up,sortblock(:,k)];
    else
        %下方的点加入到down矩阵
        down=[down,sortblock(:,k)];
    end
end

size_down=size(down);
for k=size_down(2):-1:1
    %将down矩阵的点逆序加入up矩阵
    up=[up,down(:,k)];
end
%down的加入使up矩阵成为首位相连的凸多边形点集

sortblock=up;
end

