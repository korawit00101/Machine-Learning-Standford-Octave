data = load('ex1data1.txt');
y = data(:,2);
m = length(y);
x_original = data(:,1);

x_poly = [ones(m,1) data(:,1) (data(:,1).^2)];
theta_poly = zeros(2,1);

x_linear = [ones(m,1) data(:,1)];
theta_linear = zeros(2,1);

alpha = 0.001;
for i=1:10000

  derivative_poly(1) = (alpha*(1/m)) *(sum(((x_poly*[theta_poly ; theta_poly(2)])-y).*x_poly(:,1))); 
  derivative_poly(2) = (alpha*(1/m)) *(sum(((x_poly*[theta_poly ; theta_poly(2)])-y).*x_poly(:,2)));
  cost_poly(i) = (1/(2*m))*(sum(( x_poly*[theta_poly ; theta_poly(2)])-y).^2);
  theta_poly = theta_poly-derivative_poly';
  
  derivative_linear(1) = (alpha*(1/m)) *(sum(((x_linear*theta_linear)-y).*x_linear(:,1))); 
  derivative_linear(2) = (alpha*(1/m)) *(sum(((x_linear*theta_linear)-y).*x_linear(:,2)));
  cost_linear(i) = (1/(2*m))*(sum(( x_linear*theta_linear)-y).^2);
  theta_linear = theta_linear-derivative_linear';
  
  
endfor
  cost_poly = cost_poly';
  theta_poly = [theta_poly ;theta_poly(2)]
  input_val_poly = [(5:25)'];
  predict_poly = [ones(length(input_val_poly),1) input_val_poly input_val_poly.^2];
  plot(x_original,y,'rx');
  hold on;
  plot(input_val_poly,predict_poly*theta_poly,'g-');
  
  cost_linear = cost_linear';
  input_val_linear = [(5:25)'];
  predict_linear = [ones(length(input_val_linear),1) input_val_linear];
  plot(input_val_linear,predict_linear*theta_linear,'b-');
  
  
  
  