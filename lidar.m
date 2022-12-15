clc
close all
clear
iteration_num = 130;
%%
dataB = csvread('data_xyz_55.csv');
M=dataB';
figure;
pt = pointCloud(M');
pcshow(pt);
%%
dataB = csvread('data_xyz_56.csv');
M=dataB';
figure;
pt = pointCloud(M');
pcshow(pt);
%% Å|20-25
dataA = csvread('data_xyz_20.csv');
MA = dataA';

for csv_num = 21:25
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    dataA = csvread(num);
    DB = unique(dataA,'rows');
    DB = DB';

    [Ricp, Ticp, ER, t] = icp(MA, DB, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(DB);
    Dicp = Ricp * DB+ repmat(Ticp,1,n);
    MA = [Dicp MA];   
end   

 figure;
 ptA = pointCloud(MA');
 pcshow(ptA);
 
 
 %% Å|20-25
dataB = csvread('data_xyz_26.csv');
MB = dataB';

for csv_num = 27:28
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    dataB = csvread(num);
    DB = unique(dataB,'rows');
    DB = DB';

    [Ricp, Ticp, ER, t] = icp(MB, DB, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(DB);
    Dicp = Ricp * DB+ repmat(Ticp,1,n);
    MB = [Dicp MB];   
end   

 figure;
 ptB = pointCloud(MB');
 pcshow(ptB);
 
 %% Merge 30-39
[Ricp, Ticp, ER, t] = icp(MA, MB, iteration_num, 'Matching','kDtree', 'Extrapolation', true);
n = length(MB);
Dicp = Ricp * MB +repmat(Ticp, 1, n);
M = [Dicp MA];
figure;
pt = pointCloud(M');   % ÂI¶³
pcshow(pt);
