%% Gagandeep Thapar Figure Generation
clc;
clear all;
close all;
%% Literature Review

% Cost v Performance of Sensors
sz = 100;

% star trackers
% var = {cost, cross-boresight, roll-boresight, name}
rocketlab = {140000, 5, 55, 'Rocket Lab ST-16RT2'};
maryland = {32000, 0.1*3600, 0.1*3600*6, 'Adcole Maryland Aerospace'};
twinkle = {45000, 15, 90, 'arcsec Twinkle'};
sagitta = {45000, 2, 10, 'arcsec Sagitta'};


berlin = {30000, 30, 200, 'Berlin Space Technologies'};


startrackers = [rocketlab;
                maryland;
                twinkle;
                sagitta;
                berlin];

% sun sensors
% bison = {9000, 2*3600, 'BiSon64-ET'};
ssoc = {4000, 0.5*3600, 'nanoSSOC-D60'};
bison = {10000, 0.5*3600, 'BiSon64-ET-B'};
nss = {12000, 0.5*3600, 'NSS CubeSat Sun Sensor'};


% magnetometers
tensortech = {15000, 1*3600, 'NSS Magnetometer'};

[a, ~] = size(startrackers);
names = cell(1, a);

figure
hold on

scatter(rocketlab{1}/1000, rocketlab{2}, sz, 'pentagram', 'red', 'filled')
scatter(bison{1}/1000, bison{2}, sz, 'diamond', 'blue', 'filled')
scatter(tensortech{1}/1000, tensortech{2}, sz, 'square', 'green', 'filled')
scatter(ssoc{1}/1000, ssoc{2}, sz, 'diamond', 'blue', 'filled')

for i = 2:a
    sensor = startrackers(i,:);
    scatter(sensor{1}/1000, sensor{2}, sz, 'pentagram', 'red', 'filled');

    names{1, i} = sensor{4};
end
hold off

title('Cost VS Performance: Various Sensors')
xlabel('Cost [in Thousands of $]')
ylabel('Accuracy [arcsec]')
% set(gca,'yscale','log')
grid on
axis padded
legend('Star Tracker', 'Sun Sensor', 'Magnetometer')

figure
hold on
for i = 1:a
    sensor = startrackers(i,:);
    scatter(sensor{1}/1000, sensor{2}, sz, 'pentagram', 'red', 'filled');

    names{1, i} = sensor{4};
end
hold off
set(gca,'yscale','log')
title('Cost VS Performance: Star Trackers')
xlabel('Cost [in Thousands of $]')
ylabel('Cross Boresight [arcsec]')
grid on
axis padded