function output = PointInBlock(point,Arg)
%�ж�һ�����Ƿ����ϰ�������
%���ϰ������ڷ���1�����ڷ���0
output=1;
point=[point;0];
n=size(Arg);
n=n(2);
if n==3
    %��Ϊ�������ϰ�����δ���д����ڴ˴����а�x����������
    Arg=Arg';
    sortrows(Arg,1);
    Arg=Arg';
end
Arg=[Arg;zeros(1,n)];
Arg=[Arg];
vec=[];
for i=1:n
    %�õ����û�����ָ���ϰ����򶥵������
    vec=[vec,Arg(:,i)-point];
end
for j=1:n-1
    %���ò�˵ķ��������ж�
    flag=cross(vec(:,j),vec(:,j+1));
    if flag(3)>=0
        output=-1;
        break;
    end
end
end

