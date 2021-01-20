clear;
load('theta.mat');
load('ex3data1.mat');
X = [ones(size(X,1),1) X];
prediction = max(sigmoid(X*all_theta'),[],2) == sigmoid(X*all_theta');
A = [1:10];
B = (ones(size(prediction,1),size(prediction,2))).*A;
prediction = max(prediction.*B,[],2);
sum(prediction == y)