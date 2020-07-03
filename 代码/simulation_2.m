clc; clear; close all;
%人数
N = 15000000;
%暴露者
E = 0;
%感染者初值
I = 1;
%病毒易感人群
S = N - I;
%康复或移除人群
R = 0;
%感染患者I 每天接触的易感人群的数目
r = 25;
%传染系数
B = 0.03;
%潜伏者的发病概率
a = 0.1;
%恢复系数
y = 0.1;
%日期
T = 1:100;
[data, text] = xlsread('remeta.xlsx');
total = data(:, 2);
increased = data(:, 3);
infectedNow = data(:, 4);
death = data(:, 5);
cure = data(:, 6);
HMT = data(:, 10);
abroad = data(:, 11);
%平移前
%x = [1:85];
%平移后
x=[25:109];
for i = 1:length(T) - 1
%隔离条件
    if i == 50
        r = 0.1;
    end
    
    S(i + 1) = S(i) - r * B * S(i) * I(i) / N(1);
    E(i + 1) = E(i) + r * B * S(i) * I(i) / N(1) - a * E(i);
    I(i + 1) = I(i) + a * E(i) - y * I(i);
    R(i + 1) = R(i) + y * I(i);
    IN = E+I;
    df1(i) = diff(IN,i);
end

plot(T, E, T, I, T, R,T,0.8*(I+E)); grid on;
xlabel('天'); ylabel('人数')
%拟合
%P=polyfit(x,cure',8);
%xi=0:.2:10;
%yi=polyval(P,xi);
%plot(xi,yi,x,cure,'r*');
hold on;
%拟合
plot( x, increased', 'r*');
hold on;
legend('潜伏者', '传染者', '康复者','新增','拟合数据')
% plot(x, total, 'k:', x, infectedNow, 'r', x, cure, 'g');
% xlabel('距离1月10日天数', 'Fontsize', 12);
% ylabel('人数', 'Fontsize', 12);
% title('处理后的中国新冠疫情发展85天趋势(总数，现有感染者，治愈数)', 'Fontsize', 16)
% legend('total', 'infectedNow', 'cure');

% figure(4)
% plot(x, increased, 'b', x, death, 'k', x, HMT, 'k.-', x, abroad, 'c--');
% xlabel('距离1月10日天数', 'Fontsize', 12);
% ylabel('人数', 'Fontsize', 12);
% title('处理后的中国新冠疫情发展85天趋势(新增，死亡，港澳台，境外输入)', 'Fontsize', 16)
% legend('increased', 'death', 'HMT', 'abroad');
