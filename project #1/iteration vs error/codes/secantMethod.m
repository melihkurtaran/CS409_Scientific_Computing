clc; clear arrayError;
format long;
%Secant Method

f =@(x)x^3 + 2*x^2 + 10*x - 20;
x(1) = 0; % first bound
x(2) = 10; % second bound

error = 1000;
tolerance=1e-8;

iter = 0; %iteration number
i = 3;
while (error>tolerance && iter < 200)
    x(i) = x(i-1) - (f(x(i-1)))*((x(i-1) - x(i-2))/(f(x(i-1)) - f(x(i-2))));
    iter = iter + 1; %increas iteration number
    arrayError(iter) = abs(x(i) - x(i-1));
    error = abs(x(i) - x(i-1));
    i = i + 1;
    root = x(i-1);
end

plot(1:iter,arrayError,'DisplayName','Secant Method');
hold on;