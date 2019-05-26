function [user,feima_u] = Add_fermat(user,blocks,sum1)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
feima=[];
for i=0:8
    for j=0:8
        a=[];
        for t=1:length(user)
            if user(2,t)>=10*i&&user(2,t)<=10*(i+2)&&user(3,t)>=10*j&&user(3,t)<=10*(j+2)
                a=[a,t];
            end
        end
        if length(a)>=3
            for k=1:length(a)-2
                 feima=[feima,findt(user(2,a(k)),user(3,a(k)),user(2,a(k+1)),user(3,a(k+1)),user(2,a(k+2)),user(3,a(k+2)))];
            end
        end
    end
end

%方法二
%按照最小生成树的路径寻找
% result=prim_new(user,blocks);
% user_col=round(result(1:2,:));
% for i=1:length(result)-2
%     f=user_col(1,i);
%     l=user_col(2,i);
%     m=user_col(2,i+1);
%     n=user_col(2,i+2);
%     feima=[feima,findt(user(2,f),user(3,f),user(2,l),user(3,l),user(2,m),user(3,m))];
%     feima=[feima,findt(user(2,f),user(3,f),user(2,l),user(3,l),user(2,n),user(3,n))];
% end

feima_u=[];
for j=1:length(feima)
        len=length(user)+1;
        user=[user,[len;feima(:,j)]];
        result=prim_new(user,blocks);
        sum2=sum(result(3,:));
        if sum2>sum1-0.25          
            user(:,len)=[];
            len=len-1;
        else
            sum1=sum2;
            feima_u=[feima_u,user(:,len)];
        end
end

end

