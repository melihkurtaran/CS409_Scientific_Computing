clc; clear arrayFx;
format long;
%False Position Method

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
    newX = (abs(lbF)*bounds(2) + abs(ubF)*bounds(1)) / (abs(lbF) + abs(ubF));
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

plot(1:iter,arrayFx,'DisplayName','False Position Method');
hold on;