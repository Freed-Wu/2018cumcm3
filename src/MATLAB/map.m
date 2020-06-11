clear;
clc;

longi=xlsread('附件一：已结束项目任务数据.xls','t_tasklaunch','B2:B836');
lati=xlsread('附件一：已结束项目任务数据.xls','t_tasklaunch','C2:C836');
price=xlsread('附件一：已结束项目任务数据.xls','t_tasklaunch','D2:D836');
task=int8(xlsread('附件一：已结束项目任务数据.xls','t_tasklaunch','E2:E836'));
point0=[lati(task==0),longi(task==0),price(task==0)];
point1=[lati(task==1),longi(task==1),price(task==1)];
xlswrite('data.xls',point0,1);
xlswrite('data.xls',point1,2);

[num,lola]=xlsread('附件二：会员信息数据.xlsx','Sheet1','B2:B1878');
lo=zeros(length(lola),1);
la=zeros(length(lola),1);
for k=1:length(lola)
	temp=strsplit(lola{k});
	lo(k)=str2double(temp{1});
	la(k)=str2double(temp{2});
end
xlswrite('data.xls',[la,lo],3);

longix=xlsread('附件三：新项目任务数据.xls','t_tasklaunch','B2:B2067');
latix=xlsread('附件三：新项目任务数据.xls','t_tasklaunch','C2:C2067');
xlswrite('data.xls',[latix,longix],4);

scatter(point0(:,1),point0(:,2),'+r');
hold on;
scatter(point1(:,1),point1(:,2),'+g');
xlabel('纬度');
ylabel('经度');
title('完成任务情况');
legend('不能完成任务','能完成任务');