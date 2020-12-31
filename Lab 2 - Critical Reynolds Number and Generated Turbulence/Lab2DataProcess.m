%Charles Villazor
%Feb 21st, 2020
%MAE 253
clc;clear
%% Importing Data
%P_transducer (psf)(Dyanmic Pressure) | T_transducer (degree F) | P_atmospheric (Pa) | I_sensor (mA)
%Pressure # decimal #
pd5 = importdata('data_qinf_0.50.dat');
p1 = importdata('data_qinf_1.00.dat');
p1d5 = importdata('data_qinf_1.50.dat');
p2 = importdata('data_qinf_2.00.dat');
p2d5 = importdata('data_qinf_2.50.dat');
p3 = importdata('data_qinf_3.00.dat');
p3d5 = importdata('data_qinf_3.50.dat');
p4 = importdata('data_qinf_4.00.dat');
p4d5 = importdata('data_qinf_4.50.dat');
p5 = importdata('data_qinf_5.00.dat');
p5d5 = importdata('data_qinf_5.50.dat');
p6 = importdata('data_qinf_6.00.dat');
p6d5 = importdata('data_qinf_6.50.dat');
p7 = importdata('data_qinf_7.00.dat');
p7d5 = importdata('data_qinf_7.50.dat');
p8 = importdata('data_qinf_8.00.dat');
p8d5 = importdata('data_qinf_8.50.dat');
p9 = importdata('data_qinf_9.00.dat');
p9d5 = importdata('data_qinf_9.50.dat');
p10 = importdata('data_qinf_10.00.dat');
p10d5 = importdata('data_qinf_10.50.dat');
p11 = importdata('data_qinf_11.00.dat');
p11d5 = importdata('data_qinf_11.50.dat');
p12 = importdata('data_qinf_12.00.dat');
p12d5 = importdata('data_qinf_12.50.dat');
p13 = importdata('data_qinf_13.00.dat');
p13d5 = importdata('data_qinf_13.50.dat');
p14 = importdata('data_qinf_14.00.dat');
p14d5 = importdata('data_qinf_14.50.dat');
p15 = importdata('data_qinf_15.00.dat');
%find mean of all values
%This next line is the concatenate all the data into one matrix, to make
%the code simpler
data1 = transpose([transpose(p1),transpose(p1d5),transpose(p2),...
    transpose(p2d5),transpose(p3),transpose(p3d5),transpose(p4),...
    transpose(p4d5),transpose(p5),transpose(p5d5),transpose(p6),...
    transpose(p6d5),transpose(p7),transpose(p7d5),transpose(p8),...
    transpose(p8d5),transpose(p9),transpose(p9d5),transpose(p10),...
    transpose(p10d5),transpose(p11),transpose(p11d5),transpose(p12),...
    transpose(p12d5),transpose(p13),transpose(p13d5),transpose(p14),...
    transpose(p14d5),transpose(p15)]); %used for testing purposes
data = transpose([transpose(mean(pd5(:,:))),transpose(mean(p1d5(:,:))),...
    transpose(mean(p2(:,:))),transpose(mean(p2d5(:,:))),transpose(mean(p3(:,:))),...
    transpose(mean(p3d5(:,:))),transpose(mean(p4(:,:))),transpose(mean(p4d5(:,:))),...
    transpose(mean(p5(:,:))),transpose(mean(p5d5(:,:))),transpose(mean(p6(:,:))),...
    transpose(mean(p6d5(:,:))),transpose(mean(p7(:,:))),transpose(mean(p7d5(:,:))),...
    transpose(mean(p8(:,:))),transpose(mean(p8d5(:,:))),transpose(mean(p9(:,:))),...
    transpose(mean(p9d5(:,:))),transpose(mean(p10(:,:))),transpose(mean(p10d5(:,:))),...
    transpose(mean(p11(:,:))),transpose(mean(p11d5(:,:))),transpose(mean(p12(:,:))),...
    transpose(mean(p12d5(:,:))),transpose(mean(p13(:,:))),transpose(mean(p14(:,:))),...
    transpose(mean(p15(:,:)))]);
data(:,2) = ((data(:,2)-32).*(5/9))+273.15; %convert temperature to kelvin
data(:,1) = (data(:,1).*47.88); %convert psf to pa
%% Constants
muAir = 1.825e-5; %Dynamic viscosity of air
d_sphere = 0.2032; %diameter of the sphere within in meters
r = 287; %Gas constant
%% Getting Air Density
%density is (molar mass*pressure)/(gas constant*temperature)
rhoAir = (data(:,3))./(r.*data(:,2)); %air density
%rhoAir = mean(rhoAir);
%% Plotting Pressure Coefficient with Reynolds Number
%Calculating reynolds number
v = sqrt(2.*(data(:,1)./rhoAir)); %velocity
re = (rhoAir*d_sphere.*v)/(muAir); %reynolds number
%Calculating pressure coefficient
qf = mean(data(:,1)); %dynamic pressure
pc = (data(:,4)-4.0940)./0.0124; %Current Pressure
cp = pc./data(:,1); %coefficient of pressure
%Plotting
figure(1)
scatter(re,cp); %plotting reynolds number by the coefficient of pressure
xlabel('Reynolds Number');
ylabel('Coefficient of Pressure');
title('Reynold''s Number vs Coefficient of Pressure')
xfit = linspace(min(re),max(re),1000);
curve = spline(re,cp,xfit);
hold on
plot(xfit,curve);
%% Finding the critical reynolds number
cre = 309551.3172; %critical reynolds number, found empircially
%% Turbulence factor and %turbulence
tf = (3.85*10^5)/(cre);
grabit('TF_vs_PerCentT.jpg')
percturb = mean(data(:,1));













