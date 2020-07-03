close;
clear;
clc;
n = 575; %元胞矩阵大小
getInfected = 0.06;
peopleInGrowth = 0.005;
LongDistanceRun = 0.005;
ShortDistanceRun = 0.003;
UpAndLeft = [n, 1:n - 1];
DownAndRight = [2:n, 1];
tableOfArea = zeros(n, n); %初始化
TimeInfectedCell = zeros(n, n);
% 数值维度规则
% removed == 0 黑
% infected == 1 红
% susceptible == 2 绿
imh = image(cat(3, tableOfArea, tableOfArea, tableOfArea));
m = ...
    annotation('textbox', ...
    [0.1, 0.1, 0.1, 0.1], ...
    'LineStyle', ...
    '-', ...
    'LineWidth', ...
    1, ...
    'String', ...
    '123');
timeSetter = 0;
%反向学习参数
for i = 1:160

    if i <= 40
        getInfected = 0.01;
        peopleInGrowth = 0.001;

    end

    if i >= 40 & i <= 70
        getInfected = 0.00005 * ((i - 40)^2) + 0.01;
        peopleInGrowth = 0.000003 * ((i - 40)^2) + 0.001;

    end

    if i >= 70
        getInfected = 0.06;
        peopleInGrowth = 0.002 + 0.002 * (150 - i) / 80;
    end

    sum = (tableOfArea(UpAndLeft, :) == 1) ...
        + (tableOfArea(:, UpAndLeft) == 1) ...
        + (tableOfArea(DownAndRight, :) == 1) ...
        + (tableOfArea(:, DownAndRight) == 1);
    % 总人数=2*总人数-被感染人数+流动人口
    tableOfArea = ...
        2 * (tableOfArea == 2) ...
        - ((tableOfArea == 2) & (sum > 0 | (rand(n, n) < getInfected))) ...
        + 2 * ((tableOfArea == 0) & rand(n, n) < peopleInGrowth);

    tableOfArea((tableOfArea == 2) & (rand(n, n) < LongDistanceRun)) = 0;
    tableOfArea((tableOfArea == 1) & (rand(n, n) < ShortDistanceRun)) = 0;

    % 封锁

    % 游行示威

    a = find(tableOfArea == 2);
    b = find(tableOfArea == 1);
    c = find(tableOfArea == 0);
    aa = length(a);
    bb = length(b);
    cc = length(c);
    removedpeople(i) = cc;
    deathPeople(i) = aa;
    infectedPeople(i) = bb * 30;

    % 575*575*3 double
    set(imh, 'cdata', cat(3, (tableOfArea == 1), (tableOfArea == 2), zeros(n)))
    drawnow
    figure(2)
    delete(m)
    plot(0.05 * deathPeople);
    hold on
    plot(infectedPeople);
    hold on
    % plot(removedpeople);
    legend(['新增死亡', num2str(bb), '（人）'], ['新增确诊', num2str(aa), '（人）']);
    title(['时间T=', num2str(i), '天']);
    %    m = annotation('textbox', [0.15, 0.8, 0.1, 0.1], 'LineStyle', '-', 'LineWidth', 1, 'String', str);
    hold off
    %控制速度
    % pause(0.1)
end

% 拟合
[data, text] = xlsread('dailyAmerican.xlsx');
positive = data(:, 3);
negative = data(:, 4);
pending = data(:, 5);
hospitalizedCurrently = data(:, 6);
inIcuCurrently = data(:, 8);
recovered = data(:, 12);
death = data(:, 14);
deathIncrease = data(:, 20);
hospitalizedIncrease = data(:, 21);
negativeIncrease = data(:, 22);
positiveIncrease = data(:, 23);
death = data(:, 6);
x = [1:138];
% hold on;
% plot(x, deathIncrease, '*r', x, positiveIncrease, '*g');
% xlabel('距离1月22日天数', 'Fontsize', 12);
% ylabel('人数', 'Fontsize', 12)
% legend('新增死亡', '新增确诊', '拟合死亡', '拟合确诊');
% title('图A');
