# CS409_Scientific_Computing
Sabancı University CS409 Course Projects for 2019-2020 Fall Term

# Project #1 

Five different method has been applied to find the root of the non-linear equation  

These methods are:

•	Bisection Method

•	False Position Method

•	Modified False Position Method

•	Secant Method

# Bisection Method

For a given function f(x), the Bisection Method algorithm works as follows:
1.	two bounds are chosen as a and b for which f(a) > 0 and f(b) < 0 (vice versa)
2.	a midpoint c is calculated as the mean of a and b, c = (a + b) / 2
3.	the function f is evaluated for the value of c
4.	if f(c) = 0 means that we found the root of the function, which is c
5.	if f(c) ≠ 0 we check the sign of f(c):
	if f(c) has the same sign as f(a) we replace a with c, and we keep the same value for b
	if f(c) has the same sign as f(b), we replace b with c, and we keep the same value for a
6.	we go back to step 2. and recalculate c with the new value of a or b
The algorithm ends when the values of f(c) is less than a defined tolerance (e.g. 10-6). In this case we say that c is close enough to be the root of the function for which f(c) ~= 0.
In order to avoid too many iterations, we can set a maximum number of iterations (e.g. 200) and even if we are above the defined tolerance, we keep the last value of c as the root of our function.

# False Position Method

 The algorithm is the same with the bisection method except the step 2. In bisection method, we find c value as the mean of and b but for the false position method, c value calculated as weighted average of and b. ( c = (|f(b)|*a + |f(a)|*b) / (|f(a)| + |f(b)|) )

# Modified False Position Method

 The algorithm is the same with the false position method but with one difference. The difference is that modified false position algorithm can detect when one of the bounds is stuck and if this occurs, the function at the bound can be divided into half. We add a counter to determine if one of the bounds stay fixed for two iterations and if the counter reached to 2 then divide the boundary by 2.

# Secant Method

First three methods were closed-bracket techniques, but secant method and newton method are open-bracket techniques, so they do not necessarily enclose the solution, in other words they do not worry about the signs of bounds. 

# Newton Method

 The idea is starting with an initial guess which is reasonably close to the true root, then to approximate the function by its tangent line using calculus, and finally to compute the x-intercept of this tangent line by elementary algebra. This x-intercept will typically be a better approximation to the original function's root than the first guess, and the method can be iterated.

# Project #2 

  I developed a recursive adaptive integration MATLAB code that calculates the integral over an equilateral triangular domain.

The purpose of adaptive methods:
  In Simpson’s method, choosing the discretization steps is not easy because if it is chosen as too large, the calculated integration value will be inaccurate due to fast oscillation areas. However, if it is chosen as too small the result will be more accurate, but the amount of computation will increase, and we may do some unnecessary calculations for smooth areas. The motivation of adaptive methods is that different discretization will be selected at different areas of the function. For example, it will be small for oscillatory areas but will be large for smooth areas. 

  My code calculates the integration for different discretization steps for different areas in triangular domain.
  The inputs: 
  
•	f(x,y): the function to evaluate integral

•	h: determines the size of the triangle

•	tolerance: the minimum error which we demand

  The outputs:
  
•	The value of integration

•	The graph to observe which part of the triangle called more

The total area has been called as S1 and smaller triangles called as S21, S22, S23 and S24. I calculated the error as
Error = S1 – (S21+S22+S23+S24)/4
 For every iteration the error and the tolerance has been compared and also the tolerance is divided by 4. If the value of error is bigger than the tolerance the function calls itself for smaller triangles until when the value of the error reached smaller value than the value of tolerance.

 The function calls itself for every 4 equilateral triangles. For some triangles it converges faster but for some triangles it is slower hence the function calls itself more which causes that triangle divided into more triangles 

Sometimes, the function does not converge so the tolerance value which we divide into 4 for every iteration get smaller faster. To solve this problem, I defined a minTolerance variable which equals to square of the tolerance. I designed the recurrence not to decrease the tolerance than minTolerance, if tolerance reached minTolerance the function does not keep calling itself, it saves the function from infinite recursion call.


