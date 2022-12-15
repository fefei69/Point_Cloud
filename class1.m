clc;
close all;
clear;
iteration_time = 130;
%%
data1 = csvread('data_xyz_30.csv');  % �_�l���
M = data1';

for csv_num = 31:35
    i = int2str(csv_num);
    num = ['data_xyz_', i, '.csv'];
    data2 = csvread(num);
    D = unique(data2, 'rows');  % �������ƪ��I�A��ֹB��q
    D = D';
    
    [Ricp, Ticp, ER, t] = icp(M, D, iteration_time, 'Matching','kDtree', 'Extrapolation', true);
    n = length(D);
    Dicp = Ricp * D +repmat(Ticp, 1, n);
    M = [Dicp M];  % �N���G�P�I�����X   
end
    figure;
    pt = pointCloud(M');   % �I��
    pcshow(pt);

%%
data2 = csvread('data_xyz_36.csv');  % �_�l���
M2 = data2';

for csv_num = 37:40
    i = int2str(csv_num);
    num = ['data_xyz_', i, '.csv'];
    data2 = csvread(num);
    D2 = unique(data2, 'rows');  % �������ƪ��I�A��ֹB��q
    D2 = D2';
    
    [Ricp, Ticp, ER, t] = icp(M2, D2, iteration_time, 'Matching','kDtree', 'Extrapolation', true);
    n = length(D2);;
    Dicp = Ricp * D2 +repmat(Ticp, 1, n);
    M2 = [Dicp M2];  % �N���G�P�I�����X   
end
    figure;
    pt = pointCloud(M2');   % �I��
    pcshow(pt);
%%
    [Ricp, Ticp, ER, t] = icp(M, M2, iteration_time, 'Matching','kDtree', 'Extrapolation', true);
    n = length(M2);
    Dicp = Ricp * M2 +repmat(Ticp, 1, n);
    M = [Dicp M];
    figure;
    pt = pointCloud(M');   % �I��
    pcshow(pt);
%% 
% ����
theta = 30;
A = [cosd(theta), sind(theta) 0 0;
    -sind(theta), cosd(theta) 0 0;
    0 0 1 0;
    0 0 0 1];
tform = affine3d(A);
pcCloudout = pctransform(pt, tform);
figure;
pcshow(pcCloudout);
%%
% ����
M3(:,1) = pcCloudout.Location(:,1)-50;
M3(:,2) = pcCloudout.Location(:,2)+100;
M3(:,3) = pcCloudout.Location(:,3);
pt_M3 = pointCloud(M3);
figure;
pcshow(pt_M3);