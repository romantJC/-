function [user_new,UserInBlocks] = Judge_new(user,block)
%判断哪些用户坐标在障碍区域内，从用户坐标矩阵删除并将其保存在UserInBlocks矩阵
xv=block(2,:);%障碍区域横坐标矩阵
yv=block(3,:);%障碍区域列坐标矩阵
block=[xv;yv];
user_new=user;
UserInBlocks=[];
k=0;
for i=1:length(user)
    point=[user(2,i);user(3,i)];
    In=PointInBlock(point,block);%调用PointInBlock函数判断点是否在障碍区域
    if In==1
        UserInBlocks=[UserInBlocks,user_new(:,i-k)];
        user_new(:,i-k)=[];
        k=k+1;
    end
end
end
