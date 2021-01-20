clear;
load('ex6data3.mat');
C = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma = [0.01 0.03 0.1 0.3 1 3 10 30];
model = [];
pair = [];
prediction = [];
er = [];
for i=1:length(C)
  for j=1:length(sigma)
    model = [model ;svmTrain(Xval, yval, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)))];
    pair = [pair ;C(i) sigma(j)];
  endfor
endfor
for i=1:length(model)
  prediction = svmPredict(model(i), Xval);
  er = [er ;mean(double(prediction ~= yval))];
endfor