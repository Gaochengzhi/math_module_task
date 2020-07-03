clc; clear; close all;
% 美国感染数据表
[data, text] = xlsread('dailyAmerican.xlsx');
%累计确诊
positive = data(:, 3);
%累计不确诊
negative = data(:, 4);
%疑似
pending = data(:, 5); %60000
%现有住院
hospitalizedCurrently = data(:, 6); %40000
%现有危重症患者
inIcuCurrently = data(:, 8); %10000
%痊愈
recovered = data(:, 12);
%死亡
death = data(:, 14);
deathIncrease = data(:, 20);
hospitalizedIncrease = data(:, 21);
negativeIncrease = data(:, 22);
positiveIncrease = data(:, 23);
death = data(:, 6);
x = [1:138];
subplot(2, 2, 1)
plot(x, pending, 'r', x, positiveIncrease, 'g');
xlabel('距离1月22日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12)
legend('疑似', '新增确诊');
title('图A');
subplot(2, 2, 2)
plot(x, death, 'k', x, recovered, 'g');
xlabel('距离1月22日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12)
legend('死亡', '痊愈');
title('图B');
subplot(2, 2, 3)
plot(x, hospitalizedIncrease, 'k', x, inIcuCurrently, 'r',x,hospitalizedCurrently,'g');
xlabel('距离1月22日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12)
legend('新增住院', '现有危重症','现有住院');
title('图C');
subplot(2, 2, 4)
plot(x, positive, 'r',x, negative, 'g');
xlabel('距离1月22日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12)
legend('累计确诊','检测呈阴性');
title('图D');
