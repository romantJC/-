function dist = distance(point1,point2,blocks)
%������֮��ľ��룬����������߾����ϰ����������Ϊ����
%�������������������ϰ�����ĸ����Ƿ���ڽ���
x1=point1(1);y1=point1(2);x2=point2(1);y2=point2(2);%�û�����
dist=((y2-y1)^2+(x2-x1)^2)^0.5;%���費�����ϰ�����ľ���
A=[y1-y2,x2-x1];
b=[y1*x2-x1*y2];
for i =1:length(blocks)
    for k=1:length(blocks{i})-1
        y3=blocks{i}(3,k);x3=blocks{i}(2,k);y4=blocks{i}(3,k+1);x4=blocks{i}(2,k+1);%�ϰ����򶥵�����
        A=[A;[y3-y4,x4-x3]];%ϵ������
        b=[b;y3*x4-x3*y4];%Ax=b
        if rank(A)==1
            %A����Ϊ0ʱ��ƽ�У��޽���
            A(2,:)=[];
            b(2)=[];
            continue;
        end
        p=linsolve(A,b);%����linsolve������⽻��
        ydown=max(min(y1,y2),min(y3,y4));
        yup=min(max(y1,y2),max(y3,y4));
        xdown=max(min(x1,x2),min(x3,x4));
        xup=min(max(x1,x2),max(x3,x4));
        if (p(1)<xup-0.0001)&&(p(1)>xdown)&&(p(2)<yup)&&(p(2)>ydown)
            %�жϽ����Ƿ�λ���߶���
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

