function [data] = importdragdata(folder)
%importdragdata imports the drag data and puts it into a cell array
%   folder is the folder the data is in
%   data is the cell array of all the data it spits out
location = '/Users/charlesvillazor/Self Made Programs/Matlab/MAE 253/Lab 3/'+string(folder);
cd(location);

j = numel(-6:3:24);
data = cell(max(j),1);

count = 0;
for i=-6:3:24 %puts all matricies into one cell array
    count = count+1;
    name = 'alpha_'+string(i)+'.dat';
    data{count,1} = importdata(name);
end

for i = 1:numel(data) %averages all gauge pressure readings
    data{i}(:,7) = transpose(mean(transpose(data{i}(:,7:16))));
    data{i}(:,8:16)=[];
end

for i = 1:numel(data) %turns all columns to standard units
    data{i}(:,1) = data{i}(:,1)./(1000);
    data{i}(:,2) = data{i}(:,2).*(47.88);
    data{i}(:,4) = data{i}(:,4).*(3386.39);
    data{i}(:,5) = data{i}(:,5).*(47.88);
    data{i}(:,6) = data{i}(:,6).*(47.88);
    data{i}(:,7) = data{i}(:,7).*(47.88);
end

cd '/Users/charlesvillazor/Self Made Programs/Matlab/MAE 253/Lab 3/'
end
