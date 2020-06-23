clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the 
%  the problem we are working with.

fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);

%plotData(X, y);


%z = [-7, -5, -4 ,-3, -2.5,-2,-1.5, -1, -0.45,-0.22,-0.10,0.10,0.22,0.45,1,1.5,2,2.5,2.7,3,4,5.0,7];
%sig = sigmoid(z);
%figure; hold on; 
%plot(z, sig,'LineWidth',2);
%axis([-7 7 0 1])
%hold off;

[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
theta = [-24; 0.2; 0.2];

[cost, grad] = costFunction(theta, X, y);


