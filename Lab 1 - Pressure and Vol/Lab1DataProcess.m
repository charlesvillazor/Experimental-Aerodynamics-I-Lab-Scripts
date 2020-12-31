%Charles Villazor
%Feb 7th, 2020
%MAE 253
clc;clear
%% Importing Data
%P_transducer (psf) | h_manometer (inches) | I_sensor (mA)| T_transducer (degree F)
downdata = importdata('Lab-1_Decreasing-Velocity_Tuesday-Session-2_20200128.dat');
updata = importdata('Lab-1_Increasing-Velocity_Tuesday-Session-2_20200128.dat');
waterDensity = 997.71; %Water Density
g = 9.81; %Gravitational acceleration
%% Increasing Velocity Data Processing - Pressure vs Current
data = updata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(1)
i_coefficients = polyfit(i_sensor,p_manometer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(i_coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_manometer);
hold on
plot(xfit,yfit); %plot polynomial
title('Increasing velocity Manometer Pressure vs Transducer Current');
ylabel('Manometer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Increasing Velocity Manometer Pressure','Increasing Velocity Fit Line')
%% Decreasing Velocity Data Processing - Pressure vs Current
data = downdata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(2)
d_coefficients = polyfit(i_sensor,p_manometer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(d_coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_manometer);
hold on
plot(xfit,yfit); %plot polynomial
title('Decreasing velocity Manometer Pressure vs Transducer Current');
ylabel('Manometer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Decreasing Velocity Manometer Pressure','Decreasing Velocity Fit Line')
%% Plotting Both on the Same Graph - Pressure vs Current
data = updata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(3)
coefficients = polyfit(i_sensor,p_manometer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_manometer);
hold on
plot(xfit,yfit); %plot polynomial
title('Increasing velocity Manometer Pressure vs Transducer Current');
ylabel('Manometer Pressure (Pa)')
xlabel('Transducer Current (mA)')
hold on
data = downdata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
coefficients = polyfit(i_sensor,p_manometer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_manometer);
hold on
plot(xfit,yfit); %plot polynomial
title('Overall velocity Manometer Pressure vs Transducer Current');
ylabel('Manometer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Increasing Velocity Manometer Pressure','Increasing Velocity Fit Line','Decreasing Velocity Manometer Pressure','Decreasing Velocity Fit Line')
%% Increasing Velocity Transducer Pressure vs Current
data = updata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(4)
it_coefficients = polyfit(i_sensor,p_transducer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(it_coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_transducer);
hold on
plot(xfit,yfit); %plot polynomial
title('Increasing velocity Transducer Pressure vs Transducer Current');
ylabel('Transducer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Increasing Velocity Transducer Pressure','Increasing Velocity Fit Line')
%% Decreasing Velocity Transducer Pressure vs Current
data = downdata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(5)
dt_coefficients = polyfit(i_sensor,p_transducer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(dt_coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_transducer);
hold on
plot(xfit,yfit); %plot polynomial
title('Decreasing velocity Transducer Pressure vs Transducer Current');
ylabel('Transducer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Decreasing Velocity Transducer Pressure','Decreasing Velocity Fit Line')
%% All Velocities Transducer Pressure vs Current
data = updata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
figure(6)
coefficients = polyfit(i_sensor,p_transducer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_transducer);
hold on
plot(xfit,yfit); %plot polynomial
hold on
data = downdata;
p_transducer = data(:,1).*47.88; %Pressure measured from wind tunnel transducer in Pa
h_manometer = data(:,2).*0.0254; %Height of Manometer in meters
i_sensor = transpose(mean(transpose(data(:,3:7)))); %Current from Transducer in mA
t_transducer = data(:,4); %Temperature from transducer
p_manometer = waterDensity*g.*h_manometer; %pressure from manometer
coefficients = polyfit(i_sensor,p_transducer,1); %polynomial for graph
xfit = linspace(min(i_sensor),max(i_sensor),1000); %x fit for polynomial
yfit = polyval(coefficients,xfit); %y fit for polynomial
scatter(i_sensor,p_transducer);
hold on
plot(xfit,yfit); %plot polynomial
title('All velocities Transducer Pressure vs Transducer Current');
ylabel('Transducer Pressure (Pa)')
xlabel('Transducer Current (mA)')
legend('Increasing Velocity Transducer Pressure','Increasing Velocity Fit Line','Decreasing Velocity Transducer Pressure','Decreasing Velocity Fit Line')
%% Calculating Hysterisis
it_average = diff(polyval(polyint(it_coefficients),[min(i_sensor),max(i_sensor)])); %evaluate integral from min of current to max of current
dt_average = diff(polyval(polyint(dt_coefficients),[min(i_sensor),max(i_sensor)])); %evaluate integral from min of current to max of current
hysterisis = (it_average-dt_average)/(max(i_sensor)-min(i_sensor));