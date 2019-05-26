function dist = distance(point1,point2,blocks)
%求两点之间的距离，如果两点连线经过障碍区域，则距离为无穷
%计算任意两点连线与障碍区域的各边是否存在交点
x1=point1(1);y1=point1(2);x2=point2(1);y2=point2(2);%用户坐标
dist=((y2-y1)^2+(x2-x1)^2)^0.5;%假设不经过障碍区域的距离
A=[y1-y2,x2-x1];
b=[y1*x2-x1*y2];
for i =1:length(blocks)
    for k=1:length(blocks{i})-1
        y3=blocks{i}(3,k);x3=blocks{i}(2,k);y4=blocks{i}(3,k+1);x4=blocks{i}(2,k+1);%障碍区域顶点坐标
        A=[A;[y3-y4,x4-x3]];%系数矩阵
        b=[b;y3*x4-x3*y4];%Ax=b
        if rank(A)==1
            %A的秩为0时，平行，无交点
            A(2,:)=[];
            b(2)=[];
            continue;
        end
        p=linsolve(A,b);%运用linsolve函数求解交点
        ydown=max(min(y1,y2),min(y3,y4));
        yup=min(max(y1,y2),max(y3,y4));
        xdown=max(min(x1,x2),min(x3,x4));
        xup=min(max(x1,x2),max(x3,x4));
        if (p(1)<xup-0.0001)&&(p(1)>xdown)&&(p(2)<yup)&&(p(2)>ydown)
            %判断交点是否位于线段上
            dist=0;           
            break;
        else
            A(2,:)=[];
            b(2)=[];
            continue;
        end
    end
end
end

