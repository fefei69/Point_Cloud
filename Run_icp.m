clc
close all
clear
iteration_num = 130;
%20~25 30~59
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

 %figure;
 ptA = pointCloud(MA');
 %pcshow(ptA);
%% Å|30-35
data0 = csvread('data_xyz_30.csv');
M0 = data0';

for csv_num = 31:35
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    data0 = csvread(num);
    D0 = unique(data0,'rows');
    D0 = D0';

    [Ricp, Ticp, ER, t] = icp(M0, D0, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(D0);
    Dicp = Ricp * D0+ repmat(Ticp,1,n);
    M0 = [Dicp M0];   
end   

 %figure;
 %pt0 = pointCloud(M0');
% pcshow(pt0);
%% Å|36-39
data01 = csvread('data_xyz_36.csv');
M01 = data01';

for csv_num = 37:39
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    data01 = csvread(num);
    D01 = unique(data01,'rows');
    D01 = D01';

    [Ricp, Ticp, ER, t] = icp(M01, D01, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(D01);
    Dicp = Ricp * D01+ repmat(Ticp,1,n);
    M01 = [Dicp M01];   
end   

 %figure;
 %pt01 = pointCloud(M01');
 %pcshow(pt01);
%% Merge 30-39
[Ricp, Ticp, ER, t] = icp(M0, M01, iteration_num, 'Matching','kDtree', 'Extrapolation', true);
n = length(M01);
Dicp = Ricp * M01 +repmat(Ticp, 1, n);
M_30 = [Dicp M0];
%figure;
%pt_30 = pointCloud(M_30');   % ÂI¶³
%pcshow(pt_30);
%% Å|51-59
data1 = csvread('data_xyz_51.csv');
M1 = data1';

for csv_num = 52:59
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    data2 = csvread(num);
    D1 = unique(data2,'rows');
    D1 = D1';

    [Ricp, Ticp, ER, t] = icp(M1, D1, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(D1);
    Dicp = Ricp * D1+ repmat(Ticp,1,n);
    M1 = [Dicp M1];   
end   

 %figure;
 %pt1 = pointCloud(M1');
 %pcshow(pt1);
 

%% Å|40-50
data3 = csvread('data_xyz_40.csv');
M2 = data3';

for csv_num = 41:50
    i = int2str(csv_num);
    num = ['data_xyz_',i,'.csv'];
    data4 = csvread(num);
    D = unique(data4,'rows');
    D = D';

    [Ricp, Ticp, ER, t] = icp(M2, D, iteration_num, 'Matching','kDtree','Extrapolation',true);
    n = length(D);
    Dicp = Ricp * D+ repmat(Ticp,1,n);
    M2 = [Dicp M2];   
end   

 %figure;
 %pt2 = pointCloud(M2');
 %pcshow(pt2);
%% 
%M2 = pcCloudout;
[Ricp, Ticp, ER, t] = icp(M1, M2, iteration_num, 'Matching','kDtree', 'Extrapolation', true);
n = length(M2);
Dicp = Ricp * M2 +repmat(Ticp, 1, n);
M = [Dicp M1];
%figure;
%pt = pointCloud(M');   % ÂI¶³
%pcshow(pt);
 
%% rotation
theta = -80;
A = [cosd(theta), sind(theta) 0 0;
    -sind(theta), cosd(theta) 0 0;
    0 0 1 0;
    0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(ptA, tform);
%figure;
%pcshow(pcCloudout);
%% offset
M3(:,1) = pcCloudout.Location(:,1);
M3(:,2) = pcCloudout.Location(:,2);
M3(:,3) = pcCloudout.Location(:,3);
pt_M3 = pointCloud(M3);
%figure;
%pcshow(pt_M3);
%% Merge everything
[Ricp, Ticp, ER, t] = icp(M_30, M, iteration_num, 'Matching','kDtree', 'Extrapolation', true);
n = length(M);
Dicp = Ricp * M +repmat(Ticp, 1, n);
M_final = [Dicp M_30];
figure;
pt_final = pointCloud(M_final');   % 
pcshow(pt_final);


 
 