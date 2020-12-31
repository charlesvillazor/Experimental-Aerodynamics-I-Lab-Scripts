%Charles Villazor
%April 16th, 2020
%MAE 253
%Lab 6 - Propeller Aerodynamics
clc;clear;close all
%% Importing Data
%(1)No. of Props | (2)Prop dia (in) | (3)Prop Pitch (in) | (4)Throttle | (5)Q (psf) | (6)V (Volts) | (7)I (Amps) | (8)Thrust (lb) | (9)Torque (in-lb) | (10)RPM | (11)Material (1 - APC; 2- Wood)
data = importdata('Lab-6_prop_data_all_sessions.dat');
%Should the units be in SI?
data(:,2) = data(:,2).*0.0254; %convert inch to meter
data(:,3) = data(:,3).*0.0254;
data(:,5) = data(:,5).*47.8803; %Convert psf to Pa
data(:,8) = data(:,8).*4.44822; %convert lb to N
data(:,9) = data(:,9).*0.11298482933333; %convert lb-in to n-m
data(:,9) = data(:,9).*(-1); %flip signs of torque
data(:,10) = data(:,10).*(1/60); %convert rpm to hz (1/s)
%% Finding Advanced Ratio
%constants
rhoAir = 1.18; %air density
%Calculating Freestream Velocity
v = sqrt((2.*data(:,5))./rhoAir); %Freestream Velocity
%Calculating Advanced Ratio
j = v./(data(:,10).*data(:,2)); %Advanced Ratio
%% Calculating Coefficient of Thrust
ct = (data(:,8)./(rhoAir.*(data(:,10).^2).*(data(:,2).^4)));
%% Calculating Coefficient of Torque
cq = (data(:,9)./(rhoAir.*(data(:,10).^2).*(data(:,2).^5)));
%% Calculating Coefficient of Power
%Calculating power
p = data(:,6).*data(:,7);
%Calculating Coefficient of Power
cp = (p(:,1)./(rhoAir.*(data(:,10).^3).*(data(:,2).^5)));
%% Calculating Propeller Efficiency
%If thrust or torque is negative, set efficiency to zero
% thrustEdit = zeros(numel(data(:,8)),1);
% torqueEdit = zeros(numel(data(:,9)),1);
% for i=1:numel(data(:,8))
%     if data(i,8) < 0
%         thrustEdit(i,1) = thrustEdit(i,1)+data(i,8);
%     end
% end
% for i=1:numel(data(:,9))
%     if data(i,9) < 0
%         torqueEdit(i,1) = torqueEdit(i,1)+data(i,9);
%     end
% end
% cte = (thrustEdit(:,1)./(rhoAir.*(data(:,10).^2).*(data(:,2).^4)));
% cqe = (torqueEdit(:,1)./(rhoAir.*(data(:,10).^2).*(data(:,2).^5))).*10;
pe = (ct(:,1).*j(:,1))./((2*pi).*cq(:,1));
for i = 1:numel(pe(:,1))
    if data(i,8) < 0
        pe(i,1) = 0;
    end
    if data(i,9) < 0
        pe(i,1) = 0;
    end
end
%% Seperating Data:
%Propellers
    %1 - 1 to 30
        %0.4572 Meter Diameter, 0.2032 Meter Pitch, 2 propellers, APC
    %2 - 31 to 54
        %0.4064 Meter Diameter, 0.2032 Meter Pitch, 2 propellers, APC
    %3 - 55 to 74
        %0.3810 Meter Diameter, 0.2540 Meter Pitch, 2 propellers, APC
    %4 - 79 to 106
        %0.3810 Meter Diameter, 0.2032 Meter Pitch, 2 propellers, APC
    %5 - 107 to 137
        %0.3810 Meter Diameter, 0.3048 Meter Pitch, 2 propellers, APC
    %6 - 138 to 159
        %0.4572 Meter Diameter, 0.2032 Meter Pitch, 2 propellers, Wooden
    %7 - 160 to 183
        %0.4572 Meter Diameter, 0.2032 Meter Pitch, 4 propellers, Wooden
%% Plotting Based on Propellers
%propeller 1
figure(1)
scatter(j(1:30,1),ct(1:30,1),'k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(1:30,1),cq(1:30,1).*10,'+','r');
hold on
scatter(j(1:30,1),cp(1:30,1),'*','b');
hold on
scatter(j(1:30,1),pe(1:30,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 1 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 2
figure(2)
scatter(j(34:54,1),ct(34:54,1),'k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(34:54,1),cq(34:54,1).*10,'+','r');
hold on
scatter(j(34:54,1),cp(34:54,1),'*','b');
hold on
scatter(j(34:54,1),pe(34:54,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 2 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 3
figure(3)
scatter(j(55:74,1),ct(55:74,1),'d','k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(55:74,1),cq(55:74,1).*10,'+','r');
hold on
scatter(j(55:74,1),cp(55:74,1),'*','b');
hold on
scatter(j(55:74,1),pe(55:74,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 3 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 4
figure(4)
scatter(j(79:106,1),ct(79:106,1),'d','k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(79:106,1),cq(79:106,1).*10,'+','r');
hold on
scatter(j(79:106,1),cp(79:106,1),'*','b');
hold on
scatter(j(79:106,1),pe(79:106,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 4 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 5
figure(5)
scatter(j(107:137,1),ct(107:137,1),'d','k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(107:137,1),cq(107:137,1).*10,'+','r');
hold on
scatter(j(107:137,1),cp(107:137,1),'*','b');
hold on
scatter(j(107:137,1),pe(107:137,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 5 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 6
figure(6)
scatter(j(138:159,1),ct(138:159,1),'d','k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(138:159,1),cq(138:159,1).*10,'+','r');
hold on
scatter(j(138:159,1),cp(138:159,1),'*','b');
hold on
scatter(j(138:159,1),pe(138:159,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 6 - Coefficients vs Advanced Ratio')
xlim([0,1])
%propeller 7
figure(7)
scatter(j(160:183,1),ct(160:183,1),'d','k'); %plotting reynolds number by the coefficient of pressure
hold on
scatter(j(160:183,1),cq(160:183,1).*10,'+','r');
hold on
scatter(j(160:183,1),cp(160:183,1),'*','b');
hold on
scatter(j(160:183,1),pe(160:183,1),'^','m');
legend('Coefficient of Thrust','Coefficient of Torque (Multiplied by 10)','Coefficient of Power','Power Efficiency')
xlabel('Advanced Ratio');
ylabel('Ct/Cq/Cp/Pe');
title('Propeller 7 - Coefficients vs Advanced Ratio')
xlim([0,1])
%% Propeller Diameter
    %.4572 - 1 to 30, Wooden, 138 to 183, APC
    %.4064 - 31 to 54
    %.3810 - 55 to 137
%% Plotting parameterized propeller diameter
figure(8)
subplot(2,2,1) %Coefficient of Thrust
scatter(j(1:30,1),ct(1:30,1),'d','k'); 
hold on
scatter(j(31:54,1),ct(31:54,1),'^','r'); 
hold on
scatter(j(55:137,1),ct(55:137,1),'+','b'); 
legend('.4572 Meters','.4064 Meters','.3810 Meters')
xlabel('Advanced Ratio');
ylabel('Ct');
title('Coefficient of Thurst vs Advanced Ratio')
xlim([0,1])
subplot(2,2,2) %Coefficient of Torque
scatter(j(1:30,1),cq(1:30,1),'d','k'); 
hold on
scatter(j(31:54,1),cq(31:54,1),'^','r'); 
hold on
scatter(j(55:137,1),cq(55:137,1),'+','b'); 
legend('.4572 Meters','.4064 Meters','.3810 Meters')
xlabel('Advanced Ratio');
ylabel('Cq');
title('Coefficient of Torque vs Advanced Ratio')
xlim([0,1])
subplot(2,2,3) %Coefficient of Power
scatter(j(1:30,1),cp(1:30,1),'d','k'); 
hold on
scatter(j(31:54,1),cp(31:54,1),'^','r'); 
hold on
scatter(j(55:137,1),cp(55:137,1),'+','b'); 
legend('.4572 Meters','.4064 Meters','.3810 Meters')
xlabel('Advanced Ratio');
ylabel('Cp');
title('Coefficient of Power vs Advanced Ratio')
ylim([-0.01,0.14]);
xlim([0,1])
subplot(2,2,4) %Power Efficiency
scatter(j(1:30,1),pe(1:30,1),'d','k'); 
hold on
scatter(j(31:54,1),pe(31:54,1),'^','r'); 
hold on
scatter(j(55:137,1),pe(55:137,1),'+','b'); 
legend('.4572 Meters','.4064 Meters','.3810 Meters')
xlabel('Advanced Ratio');
ylabel('Power Efficiency');
title('Power Efficiency vs Advanced Ratio')
xlim([0,1])
%% Propeller Pitch
    %.2032 - 1 to 54, 79 to 106
    %.2540 - 55 to 78
    %.3048 - 107 to 137
    %.2032 - 138 to 183, APC
%% Plotting parameterized Propeller Pitch
figure(9)
subplot(2,2,1) %Coefficient of Thrust
scatter(j(1:54,1),ct(1:54,1),'d','k'); 
hold on
scatter(j(55:78,1),ct(55:78,1),'^','r'); 
hold on
scatter(j(107:137,1),ct(107:137,1),'+','b'); 
legend('.2032 Meters','.2540 Meters','.3038 Meters')
xlabel('Advanced Ratio');
ylabel('Ct');
title('Coefficient of Thurst vs Advanced Ratio')
xlim([0,1])
subplot(2,2,2) %Coefficient of Torque
scatter(j(1:54,1),cq(1:54,1),'d','k'); 
hold on
scatter(j(55:78,1),cq(55:78,1),'^','r'); 
hold on
scatter(j(107:137,1),cq(107:137,1),'+','b'); 
legend('.2032 Meters','.2540 Meters','.3038 Meters')
xlabel('Advanced Ratio');
ylabel('Cq');
title('Coefficient of Torque vs Advanced Ratio')
xlim([0,1])
subplot(2,2,3) %Coefficient of Power
scatter(j(1:54,1),cp(1:54,1),'d','k'); 
hold on
scatter(j(55:78,1),cp(55:78,1),'^','r'); 
hold on
scatter(j(107:137,1),cp(107:137,1),'+','b'); 
legend('.2032 Meters','.2540 Meters','.3038 Meters')
xlabel('Advanced Ratio');
ylabel('Cp');
title('Coefficient of Power vs Advanced Ratio')
xlim([0,1])
ylim([0,0.2])
subplot(2,2,4) %Power Efficiency
scatter(j(1:54,1),pe(1:54,1),'d','k'); 
hold on
scatter(j(55:78,1),pe(55:78,1),'^','r'); 
hold on
scatter(j(107:137,1),pe(107:137,1),'+','b'); 
legend('.2032 Meters','.2540 Meters','.3038 Meters')
xlabel('Advanced Ratio');
ylabel('Pe');
title('Power Efficiency vs Advanced Ratio')
xlim([0,1])
%% Number of Propeller
    %2 - 137 to 159
    %4 - 160 to 183
%% Number of Propeller Plots
figure(10)
subplot(2,2,1) %Coefficient of Thrust
scatter(j(138:159,1),ct(138:159,1),'d','b'); 
hold on
scatter(j(160:183,1),ct(160:183,1),'^','r'); 
legend('2 Propellers','4 Propellers')
xlabel('Advanced Ratio');
ylabel('Ct');
title('Coefficient of Thurst vs Advanced Ratio')
xlim([0,1])
subplot(2,2,2) %Coefficient of Torque
scatter(j(138:159,1),cq(138:159,1),'d','b'); 
hold on
scatter(j(160:183,1),cq(160:183,1),'^','r');
legend('2 Propellers','4 Propellers')
xlabel('Advanced Ratio');
ylabel('Cq');
title('Coefficient of Torque vs Advanced Ratio')
xlim([0,1])
subplot(2,2,3) %Coefficient of Power
scatter(j(138:159,1),cp(138:159,1),'d','b'); 
hold on
scatter(j(160:183,1),cp(160:183,1),'^','r'); 
legend('2 Propellers','4 Propellers')
xlabel('Advanced Ratio');
ylabel('Cp');
title('Coefficient of Power vs Advanced Ratio')
xlim([0,1])
ylim([-0.01,0.15])
subplot(2,2,4) %Power Efficiency
scatter(j(138:159,1),pe(138:159,1),'d','b'); 
hold on
scatter(j(160:183,1),pe(160:183,1),'^','r');
legend('2 Propellers','4 Propellers')
xlabel('Advanced Ratio');
ylabel('Pe');
title('Power Efficiency vs Advanced Ratio')
xlim([0,1])
%% Material 
    %APC Material - 1 to 30
    %Wooden - 138 to 159
%% Material Plots
figure(11)
subplot(2,2,1) %Coefficient of Thrust
scatter(j(1:30,1),ct(1:30,1),'d','b'); 
hold on
scatter(j(138:159,1),ct(138:159,1),'^','r'); 
xlabel('Advanced Ratio');
ylabel('Ct');
title('Coefficient of Thurst vs Advanced Ratio')
legend('APC','Wooden')
xlim([0,1])
subplot(2,2,2) %Coefficient of Torque
scatter(j(1:30,1),cq(1:30,1),'d','b'); 
hold on
scatter(j(138:159,1),cq(138:159,1),'^','r'); 
legend('APC','Wooden')
xlabel('Advanced Ratio');
ylabel('Cq');
title('Coefficient of Torque vs Advanced Ratio')
xlim([0,1])
subplot(2,2,3) %Coefficient of Power
scatter(j(1:30,1),cp(1:30,1),'d','b'); 
hold on
scatter(j(138:159,1),cp(138:159,1),'^','r');  
legend('APC','Wooden')
xlabel('Advanced Ratio');
ylabel('Cp');
title('Coefficient of Power vs Advanced Ratio')
xlim([0,1])
ylim([-0.01,0.15])
subplot(2,2,4) %Power Efficiency
scatter(j(1:30,1),pe(1:30,1),'d','b'); 
hold on
scatter(j(138:159,1),pe(138:159,1),'^','r');
legend('APC','Wooden')
xlabel('Advanced Ratio');
ylabel('Pe');
title('Power Efficiency vs Advanced Ratio')
xlim([0,1])