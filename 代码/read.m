clc; clear; close all;
files = dir('Provice/*.xlsx');
countNumber = [];
x = [1:69];
y = [1:32];
[xx, yy] = meshgrid(x, y);

for index = 1:69
    filename = files(index).name;
    index = num2str(index);
    name = strcat('Provice/', index, '.xlsx');

    %    name = strcat('Provice/', filename);
    [data, text] = xlsread(name);
    countNumber = [countNumber, data(1:32, 1)];
    z = countNumber;
end
figure(1)
surf(xx, yy, z)
shading interp;
xlabel('天数');
ylabel('省编号');
zlabel('人数');
%去除武汉
countNumber = [];
x = [1:69];
y = [1:32];
[xx, yy] = meshgrid(x, y);
for index = 1:69
    filename = files(index).name;
    index = num2str(index);
    name = strcat('Provice/', index, '.xlsx');
    [data, text] = xlsread(name);
    countNumber = [countNumber, data(1:32, 1)];
    z = countNumber;
end
z(14, :) = 0;
figure(2)
surf(xx, yy, z)
shading interp;
xlabel('天数');
ylabel('省编号');
zlabel('人数');
%死亡
countNumber = [];
x = [1:69];
y = [1:32];
[xx, yy] = meshgrid(x, y);
for index = 1:69
    filename = files(index).name;
    index = num2str(index);
    name = strcat('Provice/', index, '.xlsx');

    %    name = strcat('Provice/', filename);
    [data, text] = xlsread(name);
    countNumber = [countNumber, data(1:32, 2)];
    z = countNumber;
end
z(14, :) = 0;
figure(3)
surf(xx, yy, z)
shading interp;
xlabel('天数');
ylabel('省编号');
zlabel('人数');
%康复
countNumber = [];
x = [1:69];
y = [1:32];
[xx, yy] = meshgrid(x, y);
for index = 1:69
    filename = files(index).name;
    index = num2str(index);
    name = strcat('Provice/', index, '.xlsx');

    %    name = strcat('Provice/', filename);
    [data, text] = xlsread(name);
    countNumber = [countNumber, data(1:32, 3)];
    z = countNumber;
end
z(14, :) = 0;
figure(4)
surf(xx, yy, z)
shading interp;
xlabel('天数');
ylabel('省编号');
zlabel('人数');