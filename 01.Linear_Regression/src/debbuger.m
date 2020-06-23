

clear ; close all; clc; 

fprintf('Loading Data... \n'); 

dataset = load('ex1data2.txt'); 
X = dataset(:, 1:2); 
y = dataset(:, 3); 


m = length(y); 

[X,mu,sigma] = featureNormalize(X); 

X = [ones(m,1) X]; 
theta = zeros(size(X, 2), 1);

J = computeCostMulti(X,y, theta)