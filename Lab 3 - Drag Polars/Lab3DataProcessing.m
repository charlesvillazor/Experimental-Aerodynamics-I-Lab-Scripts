%Charles Villazor
%April 5th, 2020
%MAE 253
%Lab 3 - Airfoil Aerodyanmics
clc;clear
tic
%% Importing Data - Drag
% Order of cell arrays in increasing angle of attack, from -6 to 24
%(1)Spanwise Tap Location (mm) | (2)Dynamic Pressure (psf) | (3)Temperature (degree F) | (4)Atmospheric Pressure (inches of Hg) | (5)Wake Static Gauge Pressure (psf) | (6)Wake Total Gauge Pressure (psf) | (7-16)10 Total Gauge Pressure Readings (psf)
%Uploading Reynolds Number 2.5e5
dre2_5 = importdragdata('dre_2-5e5');
%Uploading Reynolds Number 5e5
dre5 = importdragdata('dre_5e5');
%Uploading Reynolds Number 6e5
dre6 = importdragdata('dre_6e5');
%Uploading Reynolds Number 7e5
dre7 = importdragdata('dre_7e5');
%% Importing Data - Lift
% Order of cell arrays in increasing angle of attack, from -5 to 24
%(1)Tap Number | (2)Tap X-Coordinate (mm) | (3)Tap Y-Coordinate (mm) | (4)Dynamic Pressure (psf) | (5)Tunnel Temperature (degree F) | (6)Atmospheric Pressure (inches of Hg) | (7-16)10 Static Gauge Pressure Readings (psf)
%Uploading Reynolds Number 2.5e5
lre2_5 = importliftdata('lre_2-5e5');
%Uploading Reynolds Number 5e5
lre5 = importliftdata('lre_5e5');
%Uplaoding Reynolds Number 6e5
lre6 = importliftdata('lre_6e5');
%Uploading Reynolds Number 7e5
lre7 = importliftdata('lre_7e5');
%% Data Processing - Lift, Plotting Cp vs x/c
%Constants
c = 0.3048; %chord of airfoil
muAir= 1.825e-5; %dynamic viscosity of air
rhoHg= 13593; %density of mercury
rhoAir= 1.225; %density of air
%Creating x-axis x/c
liftChordRatio2_5 = cell(numel(lre2_5),1);
count = 0;
for i=1:numel(lre2_5)
    count = count+1;
    liftChordRatio2_5{count} = lre2_5{i}(:,2)./c;
end
liftChordRatio = liftChordRatio2_5{1}(:,1); %They're all the same the above loop is essentially useless
%Creating pressure coefficient for lift
%Reynolds 2.5e5
cp2_5 = cell(numel(lre2_5),1);
count = 0;
for i=1:numel(lre2_5)
    count = count+1;
    cp2_5{count} = lre2_5{i}(:,7)./lre2_5{i}(:,4);
end
%Reynolds5e5
cp5 = cell(numel(lre5),1);
count = 0;
for i=1:numel(lre5)
    count = count+1;
    cp5{count} = lre5{i}(:,7)./lre5{i}(:,4);
end
%Reynolds6e5
cp6 = cell(numel(lre6),1);
count = 0;
for i=1:numel(lre6)
    count = count+1;
    cp6{count} = lre6{i}(:,7)./lre6{i}(:,4);
end
%Reynolds7e5
cp7 = cell(numel(lre7),1);
count = 0;
for i=1:numel(lre7)
    count = count+1;
    cp7{count} = lre7{i}(:,7)./lre7{i}(:,4);
end
%Plotting
figure(1)
subplot(2,2,1) %re 2.5e5
cl2_5 = zeros(numel(cp2_5),1);
for i = 1:numel(cp2_5)
    plot(liftChordRatio(:,1),cp2_5{i}(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cl2_5(i)=trapz(liftChordRatio(:,1),cp2_5{i}(:,1));
end
ax = gca;
ax.YDir = 'reverse';
xlim([0,1])
ylim([-6,2]);
xlabel('x/c');
ylabel('Coefficient of Pressure');
title('Re2.5e5 x/c vs Coefficient of Pressure')
subplot(2,2,2) %re 5e5
cl5 = zeros(numel(cp2_5),1);
for i = 1:numel(cp5)
    plot(liftChordRatio(:,1),cp5{i}(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cl5(i)=trapz(liftChordRatio(:,1),cp5{i}(:,1));
end
xlim([0,1])
ylim([-6,2]);
ax = gca;
ax.YDir = 'reverse';
xlabel('x/c');
ylabel('Coefficient of Pressure');
title('Re5e5 x/c vs Coefficient of Pressure')
subplot(2,2,3)
cl6 = zeros(numel(cp2_5),1);
for i = 1:numel(cp6) %re 6e5
    plot(liftChordRatio(:,1),cp6{i}(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cl6(i)=trapz(liftChordRatio(:,1),cp6{i}(:,1));
end
xlim([0,1])
ylim([-6,2]);
ax = gca;
ax.YDir = 'reverse';
xlabel('x/c');
ylabel('Coefficient of Pressure');
title('Re6e5 x/c vs Coefficient of Pressure')
subplot(2,2,4) %re 7e5
cl7 = zeros(numel(cp2_5),1);
for i = 1:numel(cp7)
    plot(liftChordRatio(:,1),cp7{i}(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cl7(i)=trapz(liftChordRatio(:,1),cp7{i}(:,1));
end
xlim([0,1])
ylim([-6,2]);
ax = gca;
ax.YDir = 'reverse';
xlabel('x/c');
ylabel('Coefficient of Pressure');
title('Re7e5 x/c vs Coefficient of Pressure')
%% Data Processing - Lift, Cl vs alpha
% x values, alpha
alphaLift = -5:1:24;
%Importing xfoil data
xfoil2_5 = importdata('RE2-5.dat');
xfoil5 = importdata('RE5.dat');
xfoil6 = importdata('RE6.dat');
xfoil7 = importdata('RE7.dat');
%plotting
figure(2)
subplot(2,2,1) %re2.5e5
plot(alphaLift,cl2_5);
hold on
scatter(alphaLift,cl2_5);
hold on
plot(xfoil2_5(:,1),xfoil2_5(:,2))
hold on
err = ones(size(alphaLift)).*0.1;
errorbar(alphaLift,cl2_5,err);
xlabel('alpha')
ylabel('Cl')
title('Re2.5e5 alpha vs Coefficient of Lift')
subplot(2,2,2) %re 5e5
plot(alphaLift,cl5);
hold on
scatter(alphaLift,cl5);
hold on
plot(xfoil5(:,1),xfoil5(:,2))
hold on
err = ones(size(alphaLift)).*0.1;
errorbar(alphaLift,cl5,err);
xlabel('alpha')
ylabel('Cl')
title('Re5e5 alpha vs Coefficient of Lift')
subplot(2,2,3) %re6e5
plot(alphaLift,cl6);
hold on
scatter(alphaLift,cl6);
hold on
plot(xfoil6(:,1),xfoil6(:,2))
hold on
err = ones(size(alphaLift)).*0.1;
errorbar(alphaLift,cl6,err);
xlabel('alpha')
ylabel('Cl')
title('Re6e5 alpha vs Coefficient of Lift')
subplot(2,2,4) %re 7e5
plot(alphaLift,cl7);
hold on
scatter(alphaLift,cl7);
hold on
plot(xfoil7(:,1),xfoil7(:,2))
hold on
err = ones(size(alphaLift)).*0.1;
errorbar(alphaLift,cl7,err);
xlim([-6,25])
ylim([-1,2])
xlabel('alpha')
ylabel('Cl')
title('Re7e5 alpha vs Coefficient of Lift')
%% Data Processing - Drag, Plotting y/c vs (p-p(wake))/q
%Calculating y/c
dragChordRatio = dre2_5{1}(:,1)./c; %all drag chord ratios are the same
%calculating (p-p(wake))/q
%Reynolds 2.5e5
p2_5 = cell(numel(dre2_5),1);
count = 0;
for i=1:numel(dre2_5)
    count = count+1;
    p2_5{count} = (dre2_5{i}(:,6)-dre2_5{i}(:,7))./dre2_5{i}(:,2);
end
pc2_5 = p2_5;
for i = 1:numel(pc2_5)
    for j = 1:numel(pc2_5{i}(:,1))
        if pc2_5{i}(j,1) < 0
            pc2_5{i}(j,1)=0;
        end
    end
end
%Reynolds Number 5e5
p5 = cell(numel(dre5),1);
count = 0;
for i=1:numel(dre5)
    count = count+1;
    p5{count} = (dre5{i}(:,6)-dre5{i}(:,7))./dre5{i}(:,2);
end
pc5 = p5;
for i = 1:numel(pc5)
    for j = 1:numel(pc5{i}(:,1))
        if pc5{i}(j,1) < 0
            pc5{i}(j,1)=0;
        end
    end
end
%Reynolds Number 6e5
p6 = cell(numel(dre6),1);
count = 0;
for i=1:numel(dre6)
    count = count+1;
    p6{count} = (dre6{i}(:,6)-dre6{i}(:,7))./dre6{i}(:,2);
end
pc6 = p6;
for i = 1:numel(pc6)
    for j = 1:numel(pc6{i}(:,1))
        if pc6{i}(j,1) < 0
            pc6{i}(j,1)=0;
        end
    end
end
%Reynolds Number 7e5
p7 = cell(numel(dre7),1);
count = 0;
for i=1:numel(dre7)
    count = count+1;
    p7{count} = (dre7{i}(:,6)-dre7{i}(:,7))./dre7{i}(:,2);
end
pc7 = p7;
for i = 1:numel(pc7)
    for j = 1:numel(pc7{i}(:,1))
        if pc7{i}(j,1) < 0
            pc7{i}(j,1)=0;
        end
    end
end
%Plotting
figure(3)
subplot(2,2,1) %re 2.5e5
cd2_5 = zeros(numel(p2_5),1);
for i = 1:numel(p2_5)
    plot(p2_5{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cd2_5(i)=trapz(dragChordRatio(:,1),p2_5{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re2.5e5 y/c vs (p-p(wake))/q')
subplot(2,2,2) %re 5e5
cd5 = zeros(numel(p5),1);
for i = 1:numel(p5)
    plot(p5{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cd5(i)=trapz(dragChordRatio(:,1),p5{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re5e5 y/c vs (p-p(wake))/q')
subplot(2,2,3)
cd6 = zeros(numel(p6),1);
for i = 1:numel(p6)
    plot(p6{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cd6(i)=trapz(dragChordRatio(:,1),p6{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re6e5 y/c vs (p-p(wake))/q')
subplot(2,2,4)
cd7 = zeros(numel(p7),1);
for i = 1:numel(p7)
    plot(p7{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cd7(i)=trapz(dragChordRatio(:,1),p7{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re7e5 y/c vs (p-p(wake))/q')
%% Data Processing - Drag, Plotting y/c vs (p-p(wake))/q, Positives only
figure(4)
subplot(2,2,1) %re 2.5e5
cdc2_5 = zeros(numel(p2_5),1);
for i = 1:numel(pc2_5)
    plot(pc2_5{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cdc2_5(i)=trapz(dragChordRatio(:,1),pc2_5{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re2.5e5 y/c vs (p-p(wake))/q - Positive')
subplot(2,2,2) %re 5e5
cdc5 = zeros(numel(pc5),1);
for i = 1:numel(pc5)
    plot(pc5{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cdc5(i)=trapz(dragChordRatio(:,1),pc5{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re5e5 y/c vs (p-p(wake))/q - Positive')
subplot(2,2,3) %re 5e5
cdc6 = zeros(numel(pc6),1);
for i = 1:numel(pc6)
    plot(pc6{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cdc6(i)=trapz(dragChordRatio(:,1),pc6{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re6e5 y/c vs (p-p(wake))/q - Positive')
subplot(2,2,4) %re 5e5
cdc7 = zeros(numel(pc7),1);
for i = 1:numel(pc7)
    plot(pc7{i}(:,1),dragChordRatio(:,1)); %plotting reynolds number by the coefficient of pressure
    hold on
    cdc7(i)=trapz(dragChordRatio(:,1),pc7{i}(:,1));
end
xlabel('p-p(wake))/q');
ylabel('y/c');
title('Re7e5 y/c vs (p-p(wake))/q - Positive')
%% Data Processing - Drag, Plotting alpha vs Cd
%Calculating Alpha
alphaDrag = -6:3:24;
%Plotting
figure(5)
subplot(2,2,1) %re2.5e5
plot(alphaDrag,cd2_5,'r');
hold on
scatter(alphaDrag,cd2_5,'b');
hold on
plot(xfoil2_5(:,1),xfoil2_5(:,3),'k')
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cd2_5,err);
xlabel('alpha')
ylabel('Cd')
title('Re2.5e5 alpha vs Coefficient of Drag')
subplot(2,2,2) %re2.5e5
plot(alphaDrag,cd5,'r');
hold on
scatter(alphaDrag,cd5,'b');
hold on
plot(xfoil5(:,1),xfoil5(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cd5,err);
xlabel('alpha')
ylabel('Cd')
title('Re5e5 alpha vs Coefficient of Drag')
subplot(2,2,3) %re2.5e5
plot(alphaDrag,cd6,'r');
hold on
scatter(alphaDrag,cd6,'b');
hold on
plot(xfoil6(:,1),xfoil6(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cd6,err);
xlabel('alpha')
ylabel('Cd')
title('Re6e5 alpha vs Coefficient of Drag')
subplot(2,2,4) %re7e5
plot(alphaDrag,cd7,'r');
hold on
scatter(alphaDrag,cd7,'b');
hold on
plot(xfoil7(:,1),xfoil7(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cd7,err);
xlabel('alpha')
ylabel('Cd')
title('Re7e5 alpha vs Coefficient of Drag')
%% Data Processing - Drag, Plotting alpha vs Cd - Correct
%Plotting
figure(6)
subplot(2,2,1) %re2.5e5
plot(alphaDrag,cdc2_5,'r');
hold on
scatter(alphaDrag,cdc2_5,'b');
hold on
plot(xfoil2_5(:,1),xfoil2_5(:,3),'k')
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cdc2_5,err);
xlabel('alpha')
ylabel('Cdc')
title('Re2.5e5 alpha vs Coefficient of Drag - Correct')
subplot(2,2,2) %re2.5e5
plot(alphaDrag,cdc5,'r');
hold on
scatter(alphaDrag,cdc5,'b');
hold on
plot(xfoil5(:,1),xfoil5(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cdc5,err);
xlabel('alpha')
ylabel('Cdc')
title('Re5e5 alpha vs Coefficient of Drag - Correct')
subplot(2,2,3) %re2.5e5
plot(alphaDrag,cdc6,'r');
hold on
scatter(alphaDrag,cdc6,'b');
hold on
plot(xfoil6(:,1),xfoil6(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cdc6,err);
xlabel('alpha')
ylabel('Cdc')
title('Re6e5 alpha vs Coefficient of Drag - Correct')
subplot(2,2,4) %re7e5
plot(alphaDrag,cdc7,'r');
hold on
scatter(alphaDrag,cdc7),'b';
hold on
plot(xfoil7(:,1),xfoil7(:,3),'k')
hold on
err = ones(size(alphaDrag)).*0.01;
errorbar(alphaDrag,cdc7,err);
xlabel('alpha')
ylabel('Cdc')
title('Re7e5 alpha vs Coefficient of Drag - Correct')
%% Drag Polar - Cl vs Cd graph
%Gettings both coefficients into intervals of -3 to 24
%Reynolds 2.5e5
clc2_5 = ones((numel(cdc2_5)-1),1);
count = 0;
for i = 3:3:30
    count = count+1;
    clc2_5(count) = cl2_5(i)*clc2_5(count);
end
count = 0;
cdcc2_5 = ones((numel(cdc2_5)-1),1);
for i = 2:1:11
    count = count+1;
    cdcc2_5(count) = cdc2_5(i)*cdcc2_5(count);
end
%Reynolds Number 5e5
clc5 = ones((numel(cdc5)-1),1);
count = 0;
for i = 3:3:30
    count = count+1;
    clc5(count) = cl5(i)*clc5(count);
end
count = 0;
cdcc5 = ones((numel(cdc5)-1),1);
for i = 2:1:11
    count = count+1;
    cdcc5(count) = cdc5(i)*cdcc5(count);
end
%Reynolds Number 6e5
clc6 = ones((numel(cdc6)-1),1);
count = 0;
for i = 3:3:30
    count = count+1;
    clc6(count) = cl6(i)*clc6(count);
end
count = 0;
cdcc6 = ones((numel(cdc6)-1),1);
for i = 2:1:11
    count = count+1;
    cdcc6(count) = cdc6(i)*cdcc6(count);
end
%Reynolds Number 7e5
clc7 = ones((numel(cdc7)-1),1);
count = 0;
for i = 3:3:30
    count = count+1;
    clc7(count) = cl7(i)*clc7(count);
end
count = 0;
cdcc7 = ones((numel(cdc7)-1),1);
for i = 2:1:11
    count = count+1;
    cdcc7(count) = cdc7(i)*cdcc7(count);
end
figure(7)
%Reynolds Number 2.5e5
subplot(2,2,1)
plot(cdcc2_5,clc2_5,'r')
hold on
plot(xfoil2_5(:,3),xfoil2_5(:,2),'k')
xlabel('Cd')
ylabel('Cl')
title('Drag Polar Reynolds Number 2.5e5')
%Reynolds Number 5e5
subplot(2,2,2)
plot(cdcc5,clc5,'r')
hold on
plot(xfoil5(:,3),xfoil5(:,2),'k')
xlabel('Cd')
ylabel('Cl')
title('Drag Polar Reynolds Number 5e5')
%Reynolds Number 6e5
subplot(2,2,3)
plot(cdcc6,clc6,'r')
hold on
plot(xfoil6(:,3),xfoil6(:,2),'k')
xlabel('Cd')
ylabel('Cl')
title('Drag Polar Reynolds Number 6e5')
%Reynolds Number 7e5
subplot(2,2,4)
plot(cdcc7,clc7,'r')
hold on
plot(xfoil7(:,3),xfoil7(:,2),'k')
xlabel('Cd')
ylabel('Cl')
title('Drag Polar Reynolds Number 7e5')
%% End of data
time = toc;
