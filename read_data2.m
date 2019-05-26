load('.\newdata.mat');
% figure, plot(new100posi,'*');
user=1:100;
user=[user',new100posi];
user=user';
blocks={};
blocks{1}=[1:length(blocks1);blocks1'];
blocks{2}=[1:length(blocks2);blocks2'];
blocks{3}=[1:length(blocks3);blocks3'];
blocks{4}=[1:length(blocks4);blocks4'];
blocks{5}=[1:length(blocks5);blocks5'];
blocks{6}=[1:length(blocks6);blocks6'];
for k=1:length(blocks)
    blocks{k}=blocks{k}';
    blocks{k}=sortrows(blocks{k},2);
    blocks{k}=blocks{k}';
end
