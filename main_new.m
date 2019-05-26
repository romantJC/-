% main脚本，调用函数解决第一题与第二题

read_data1;%加载第一组数据(请使得52-55行，64-67行保持不被注释掉的状态)
% read_data2;%加载第二组数据（请使得56-59行，70-73行保持不被注释掉的状态，并注释掉上述第一组数据）

%程序每次仅能运行一组数据，暂且注释了第二组（可注释第一行，取消第二行，来运行第二组）

UserInAllBlocks=[];%储存位于障碍区域内的坐标数据
for k=1:length(blocks)
    if length(blocks{k})>3
        blocks{k}=sort_point(blocks{k});%对边数大于三的多边形进行排序，得到首尾相连的坐标
    else
        blocks{k}=[blocks{k},blocks{k}(:,1)];%将障碍区域第一个坐标加入到最后一个坐标后面，使其可以首尾相连得到凸多边形
    end
    [user,UserInBlocks]=Judge_new(user,blocks{k});%判断用户是否在障碍区域，并将在障碍区域的坐标删除
    UserInAllBlocks=[UserInAllBlocks,UserInBlocks];
    plot(blocks{k}(2,:),blocks{k}(3,:));%绘制障碍区域图形
    hold on;
end
fprintf("位于障碍区域的坐标：\n");
UserInAllBlocks

plot(user(2,:),user(3,:),'.');%以散点的形式绘制有效用户坐标

% 第二题

result=prim_new(user,blocks);%利用prim算法得到最小生成树,result矩阵第一、二、三行分别储存生成树边的起点、终点、权值。
sum1=sum(result(3,:)) ;%计算result第三行得到最小生成树的总距离

%尝试加入障碍区域顶点作为过渡点
%由于加入障碍顶点和费马点的程序运行时间较长，我们注释掉了代码，将运行过一次的数据保存了下来，使得以后运行速度更快

%注释寻找顶点的代码
% D_point=[];
% for i=1:length(blocks)
%     for j=1:length(blocks{i})-1
%         len=length(user)+1;
%         user=[user,blocks{i}(:,j)];
%         result=prim_new(user,blocks);
%         sum2=sum(result(3,:));
%         if sum2>sum1
%             user(:,len)=[];
%             len=len-1;
%         else
%  %如果加入障碍区域顶点后，总距离减小，则将该点保存在user坐标矩阵中
%             sum1=sum2;
%             D_point=[D_point,blocks{i}(:,j)];
%         end
%     end
% end

D_point1=[1     1;
          50    90;
          30    75];
user=[user,D_point1];
% D_point2=[ 5.0000    1.0000;
%           20.7142   80.3911;
%           37.8445   88.7923]
% user=[user,D_point2];

%注释费马点代码
% [user,feima]=Add_fermat(user,blocks,sum1);%尝试加入费马点来优化模型,运行时间在八分钟左右,由于精度恒定，只能得到下列费马点的子集

feima1=[99.0000  100.0000  101.0000  102.0000  103.0000  104.0000  105.0000  106.0000  107.0000  108.0000  109.0000  110.0000  111.0000;
   27.1929   26.6719   36.5128   40.8983   53.8786   53.2672   62.0656   71.4942   70.1378   80.5026   75.3337   80.1716   88.7273;
   85.0551   42.6781   64.5540   61.5528   63.8028   23.4747   52.3112   40.0848   90.0813   13.5887   66.4389   61.1983    2.9833];
user=[user,feima1];


% feima2=[91.0000   92.0000   93.0000   94.0000   95.0000   96.0000   97.0000   98.0000   99.0000  100.0000  101.0000  102.0000;
%     5.7971   14.4077   25.0578   24.4434   34.1638   43.5467   49.0939   58.0813   69.0020   69.9391   81.0837   93.9260;
%    16.2452   59.1706   35.6014   37.4821   57.5190   86.8750   45.6408    67.1028   18.5618   86.2930   15.3477   67.6462];
% user=[user,feima2];

result=prim_new(user,blocks);%优化模型后再次得到最小生成树的result矩阵
user_col=round(result(1:2,:));%得到生成树每一条边的起点和终点

fprintf("最小生成树总距离为：\n");
sum(result(3,:))

%绘制最小生成树
for i=1:length(result)
    f=user_col(1,i);
    l=user_col(2,i);
    plot([user(2,f),user(2,l)],[user(3,f),user(3,l)],'b');
    hold on;
end

