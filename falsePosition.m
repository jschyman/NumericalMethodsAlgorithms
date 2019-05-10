function [root, fx, ea, iter] = falsePosition(func,xl,xu,es,maxiter)
%Function for finding the root using the false position method
%Input:
%func = function that is being evaluated
%xl = lower bound 
%xu = upper bound
%es = desired relative error
%maxiter = desired maximum iterations

%for the function to run there is a required arguments of function, lower bound, and
%upper bound
if nargin < 3
    error('3 arguments are required')

%when there are only 3 arguments entered the function will set a default
%for the relative error and maximum iterations
elseif nargin == 3
    es = 0.0001;
    maxiter = 200;
%when the relative error agrument is entered and NO maximum iteration
%argument present
else nargin == 4;
    maxiter = 200;
end
%inital iteration for while loop
iter = 0;
%initalizing xr
xr = 0;
%while loop that calculates the root of the equation using the false
%postion approach
while 1
    %sets the previous root from previous iteration
    xrprev = xr;
    %finding the root with the false postion equation
    xr = xu-(((func(xu))*(xl-xu))/((func(xl))-(func(xu))));
    %finding the approximate relative error percent
    ea = abs((xr-xrprev)/xr)*100;
    %using the sign function to see if the signs of the bounds are equal to
    %xr to replace the bound with either the upper or lower
    if sign(func(xu)) == sign(func(xr))
        xu = xr;
    elseif sign(func(xl)) == sign(func(xr))
        xl = xr;
    else sign(func(xl)) == sign(func(xu))
        error('pick different bounds')
    end
    %iterations plus 1 counts the number of iterations ran by the loop
    iter = iter + 1;
    %breaking the loop when desired relative error or maximum iterations
    %are met
    if ea <= es || iter >= maxiter
        break
    end
end
%Outputs:
%root = root of function
%fx = value of root evaluated in function
%ea = approximate relative error
%iter = number of iterations performed
root = xr
fx = func(xr)
ea = ea
iter = iter
end









    
    
    

    
    
