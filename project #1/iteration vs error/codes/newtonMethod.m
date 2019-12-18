clc; clear arrayError;
format long;
%Newton Method

f =@(x)x^3 + 2*x^2 + 10*x - 20;
df =@(x)3*x^2 + 4*x + 10; %derivative of f(x)

x(1) = 0; % first bound
x(2) = 10;%x(1) - (f(x(1))/df(x(1))); % second bound 
iter = 0; %iteration number
i = 3;

error = 1000;
tolerance=1e-8;

while (error>tolerance && iter < 200)
    x(i) = x(i-1) - (f(x(i-1))/df(x(i-1)));
    iter = iter + 1; %increas iteration number
    arrayError(iter) = abs(x(i) - x(i-1));
    error = abs(x(i) - x(i-1));
    i = i + 1;
    root = x(i-1);
end

plot(1:iter,arrayError,'DisplayName','Newton Method');
hold on;