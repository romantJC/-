function p = findt(x1,y1,x2,y2,x3,y3)
%���������㣬Ѱ�������η�����
x4=(x1+x2)/2+(3^0.5/2)*(y2-y1);
y4=(y1+y2)/2-(3^0.5/2)*(x2-x1);
x5=(x1+x3)/2-(3^0.5/2)*(y3-y1);
y5=(y1+y3)/2+(3^0.5/2)*(x3-x1);
k34=(y3-y4)/(x3-x4);
k25=(y2-y5)/(x2-x5);
x6=((k25*x2-y2)-(k34*x3-y3))/(k25-k34);
y6=y2+k25*(x6-x2);
p=[x6;y6];
end
