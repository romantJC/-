function [user_new,UserInBlocks] = Judge_new(user,block)
%�ж���Щ�û��������ϰ������ڣ����û��������ɾ�������䱣����UserInBlocks����
xv=block(2,:);%�ϰ�������������
yv=block(3,:);%�ϰ��������������
block=[xv;yv];
user_new=user;
UserInBlocks=[];
k=0;
for i=1:length(user)
    point=[user(2,i);user(3,i)];
    In=PointInBlock(point,block);%����PointInBlock�����жϵ��Ƿ����ϰ�����
    if In==1
        UserInBlocks=[UserInBlocks,user_new(:,i-k)];
        user_new(:,i-k)=[];
        k=k+1;
    end
end
end
