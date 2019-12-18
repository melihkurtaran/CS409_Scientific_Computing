clc; clear arrayError;
format long;
%Modified False Position Method

f =@(x)x^3 + 2*x^2 + 10*x - 20;
bounds = [0 10];

error = 1000;
tolerance=1e-8;

iter = 0; %iteration number
counter1 = 0; %counter for left bound
counter2 = 0; %counter for right bound

%values of the function at the bounds
lbF = f(bounds(1));
ubF = f(bounds(2));

while (error>tolerance && iter < 200)
    
    iter = iter + 1; %increas iteration number
    
    
    %new guess for the root
    newX = (abs(lbF)*bounds(2) + abs(ubF)*bounds(1)) / (abs(lbF) + abs(ubF));
    newF = f(newX);
    arrayError(iter) = abs(0-newF);
    
    if (lbF*newF) < 0
        bounds(2) = newX;
        counter2 = 0;
        counter1 = counter1 + 1;
        ubF = f(bounds(2));
        if(mod(counter1,2) == 0)
            lbF = lbF / 2;
        end
    elseif (lbF*newF) > 0
        bounds(1) = newX;
        counter1 = 0;
        counter2 = counter2 + 1;
        lbF = f(bounds(1));
        if(mod(counter2,2) == 0)
            ubF = ubF / 2;
        end
    end
    
    error = abs(0-newF);
end

root = newX;

plot(1:iter,arrayError,'DisplayName','Modified False Position Method');
hold on;

