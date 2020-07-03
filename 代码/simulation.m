clc; clear; close all;
%人数
N = 100000000;
%暴露者
E = 0;
%感染者初值
I = 1;
%病毒易感人群
S = N - I;
%康复或移除人群
R = 0;
%感染患者I 每天接触的易感人群的数目
r = 20;
%传染系数
B = 0.03;
%潜伏者的发病概率
a = 0.1;
%恢复系数
y = 0.1;
%日期
T = 1:150;
for i = 1:length(T) - 1
    S(i + 1) = S(i) - r * B * S(i) * I(i) / N(1);
    E(i + 1) = E(i) + r * B * S(i) * I(i) / N(1) - a * E(i);
    I(i + 1) = I(i) + a * E(i) - y * I(i);
    R(i + 1) = R(i) + y * I(i);
end
plot(T, S, T, E, T, I, T, R); grid on;
xlabel('天'); ylabel('人数')
legend('易感者', '潜伏者', '传染者', '康复者')
