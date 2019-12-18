clear all; clc; close all;
format long;
%Bisection Method

f =@(x)x^3 + 2*x^2 + 10*x - 20;
bounds = [0 10];

error = 1000;
tolerance=1e-8;

iter = 0; %iteration number

while (error>tolerance && iter < 200)
    
    iter = iter + 1; %increas iteration number
    
    %values of the function at the bounds
    lbF = f(bounds(1));
    ubF = f(bounds(2));
    
    %new guess for the root
    newX = (bounds(1) + bounds(2))/2;
    newF = f(newX);
    arrayFx(iter) = newF;
    
    if (lbF*newF) < 0
        bounds(2) = newX;
    elseif (lbF*newF) > 0
        bounds(1) = newX;
    end
    
    error = abs(0-newF);
end

root = newX;

plot(1:iter,arrayFx);
legend('Bisection Method');
hold on;

