clc; clear; close all;

% 中国感染数据处理

[data, text] = xlsread('meta.xlsx');
total = data(:, 2);
increased = data(:, 3);
infectedNow = data(:, 4);
death = data(:, 5);
cure = data(:, 6);
HMT = data(:, 10);
abroad = data(:, 11);
x = [1:85];

% 修正数据前

figure(1);
plot(x, total, 'k:', x, infectedNow, 'r', x, cure, 'g');
xlabel('距离1月10日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12);
title('中国新冠疫情发展85天趋势(总数，现有感染者，治愈数)', 'Fontsize', 16)
legend('total', 'infectedNow', 'cure');

figure(2)
plot(x, increased, 'b', x, death, 'k', x, HMT, 'k.-', x, abroad, 'c--');
xlabel('距离1月10日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12);
title('中国新冠疫情发展85天趋势(新增，死亡，港澳台，境外输入)', 'Fontsize', 16)
legend('increased', 'death', 'HMT', 'abroad');

% 修正数据后

[data, text] = xlsread('remeta.xlsx');
total = data(:, 2);
increased = data(:, 3);
infectedNow = data(:, 4);
death = data(:, 5);
cure = data(:, 6);
HMT = data(:, 10);
abroad = data(:, 11);
x = [1:85];

figure(3);
plot(x, total, 'k:', x, infectedNow, 'r', x, cure, 'g');
xlabel('距离1月10日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12);
title('处理后的中国新冠疫情发展85天趋势(总数，现有感染者，治愈数)', 'Fontsize', 16)
legend('total', 'infectedNow', 'cure');

figure(4)
plot(x, increased, 'b', x, death, 'k', x, HMT, 'k.-', x, abroad, 'c--');
xlabel('距离1月10日天数', 'Fontsize', 12);
ylabel('人数', 'Fontsize', 12);
title('处理后的中国新冠疫情发展85天趋势(新增，死亡，港澳台，境外输入)', 'Fontsize', 16)
legend('increased', 'death', 'HMT', 'abroad');
