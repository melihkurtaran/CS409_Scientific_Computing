clear all; clc; close all;
format long;
%Recursive Adaptive Integration Program

%the inputs
h = 1;
tolerance = 1e-3;
minTolerance = tolerance * tolerance;
f = @(x,y) exp(x);

X = -1:0.05:1;
y = -1:0.05:1;
Y = f(X,y);
plot(X,f(X,Y)); hold on;


w0 = 3/4;
w1 = 1/12;
w2 = 1/12;
w3 = 1/12;
x0 = 0; y0 = 0;
x1 = -1*h/2; y1 = h*sqrt(3)/2;
x2 = -1*h/2; y2 = -1*h*sqrt(3)/2;
x3 = h; y3 = 0;

S1 = (h*h*3*sqrt(3) / 4)*(w0*f(x0,y0) + w1*f(x1,y1) + w2*f(x2,y2) + w3*f(x3,y3));

integration = AdaptInt( f, x0, y0, x1, y1, x2, y2, x3, y3, tolerance, h, w0, w1, w2, w3, minTolerance);


function [ integration ] = AdaptInt( f, x0, y0, x1, y1, x2, y2, x3, y3, tolerance, h, w0, w1, w2, w3, minTolerance)
%   Adaptive composite integration method 'AdaptInt'
%   16 params: integrand (FUNCTIONHANDLE) 'func', 8 bounds 
%   required tolerance and minTolerance
S1 = (h*h*3*sqrt(3) / 4)*(w0*f(x0,y0) + w1*f(x1,y1) + w2*f(x2,y2) + w3*f(x3,y3));

%plotting the points
plot(x0,y0,'.'); hold on; 
plot(x1,y1,'.'); hold on; 
plot(x2,y2,'.'); hold on; 
plot(x3,y3,'.'); hold on; 
grid minor;

line([x1,x2], [y1, y2], 'Color', 'r'); hold on;
line([x2,x3], [y2, y3], 'Color', 'r'); hold on;
line([x3,x1], [y3, y1], 'Color', 'r'); hold on;


%S21 calculation
S21x1 = x1; S21y1 = y1;
S21x2 = (x1+x2)/2; S21y2 = (y1 + y2)/2;
S21x3 = (x1 + x3)/2; S21y3 = (y1 + y3)/2; 
S21x0 = (S21x1+S21x2+S21x3)/3; S21y0 = (S21y1+S21y2+S21y3)/3;
S21 = (h*h*3*sqrt(3) / 4)*(w0*f(S21x0,S21y0) + w1*f(S21x1,S21y1) + w2*f(S21x2,S21y2) + w3*f(S21x3,S21y3));

%S22 calculation
S22x1 = x2; S22y1 = y2;
S22x2 = (x1+x2)/2; S22y2 = (y1 + y2)/2;
S22x3 = (x2 + x3)/2; S22y3 = (y2 + y3)/2;
S22x0 = (S22x1+S22x2+S22x3)/3; S22y0 = (S22y1+S22y2+S22y3)/3;
S22 = (h*h*3*sqrt(3) / 4)*(w0*f(S22x0,S22y0) + w1*f(S22x1,S22y1) + w2*f(S22x2,S22y2) + w3*f(S22x3,S22y3));

%S23 calculation
S23x1 = x3; S23y1 = y3;
S23x2 = (x1+x3)/2; S23y2 = (y1 + y3)/2;
S23x3 = (x2 + x3)/2; S23y3 = (y3 + y2)/2; 
S23x0 = (S23x1+S23x2+S23x3)/3; S23y0 = (S23y1+S23y2+S23y3)/3;
S23 = (h*h*3*sqrt(3) / 4)*(w0*f(S23x0,S23y0) + w1*f(S23x1,S23y1) + w2*f(S23x2,S23y2) + w3*f(S23x3,S23y3));

%S24 calculation
S24x1 = (x1+x2)/2; S24y1 = (y1+y2)/2;
S24x2 = (x2+x3)/2; S24y2 = (y3+y2)/2;
S24x3 = (x1+x3)/2; S24y3 = (y1+y3)/2;
S24x0 = (S24x1+S24x2+S24x3)/3; S24y0 = (S24y1+S24y2+S24y3)/3;
S24 = (h*h*3*sqrt(3) / 4)*(w0*f(S24x0,S24y0) + w1*f(S24x1,S24y1) + w2*f(S24x2,S24y2) + w3*f(S24x3,S24y3));


integration = (S21 + S22 + S23 + S24)/4;
err = S1 - integration;
if ((abs(err) < tolerance) || (tolerance < minTolerance))   % if satisfies tolerance, apply Simpson formula
    integration = (S21 + S22 + S23 + S24)/4;
else    % else, divide into smaller parts
    tolerance = tolerance / 4;
    S21 = AdaptInt( f, S21x0, S21y0, S21x1, S21y1, S21x2, S21y2, S21x3, S21y3, tolerance, h, w0, w1, w2, w3, minTolerance);
    S22 = AdaptInt( f, S22x0, S22y0, S22x1, S22y1, S22x2, S22y2, S22x3, S22y3, tolerance, h, w0, w1, w2, w3, minTolerance);
    S23 = AdaptInt( f, S23x0, S23y0, S23x1, S23y1, S23x2, S23y2, S23x3, S23y3, tolerance, h, w0, w1, w2, w3, minTolerance);
    S24 = AdaptInt( f, S24x0, S24y0, S24x1, S24y1, S24x2, S24y2, S24x3, S24y3, tolerance, h, w0, w1, w2, w3, minTolerance);
    integration = (S21 + S22 + S23 + S24)/4;
end

end