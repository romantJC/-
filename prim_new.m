function result = prim_new(user,block)
%prim算法得到最小生成树
%运用prim算法之前需要调用distance函数得到邻接矩阵
dist=zeros(length(user));
for i=1:length(user)
    for j=i+1:length(user)
        dist(i,j)=distance([user(2,i),user(3,i)],[user(2,j),user(3,j)],block);
    end
end
dist=dist+dist';
a=dist;
a(find(a==0))=inf;
result=[];
p=1;
tb=2:length(a);
while length(result)~=length(a)-1
    temp=a(p,tb);
    temp=temp(:);
    d=min(temp);
    [jb,kb]=find(a(p,tb)==d);
    j=p(jb(1));k=tb(kb(1));
    result=[result,[j;k;d]];
    p=[p,k];
    tb(find(tb==k))=[];
end
end

