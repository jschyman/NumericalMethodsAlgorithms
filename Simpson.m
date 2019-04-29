function I = Simpson(x,y)
%Jared Schymanski
%This Simpson's function calculates the integral of vector x and vector y.
%If there is a odd number of segments the function will use 1/3rd simpson's rule
%and one trapezoidal rule.  If there is a even number of segments the
%function will use only the 1/3rd simpson's rule.

%Length of x
xl = length(x);
%Length of y
yl = length(y);
%Even spacing of the x vector for error check
s = linspace(x(1),x(xl),xl);
%Error checking
if nargin > 2 || nargin < 2
    error('Simpson''s function requires 2 arguements')
    
%Error check for vectors x and y to be the same length
elseif xl ~= yl 
    error('x and y vectors must be the same length')
end
%Error check for x vector to spaced out evenly so 1/3rd simpson's rule can
%work properly
for z = 1:xl
 if x(z) ~= s(z)
    error('x vector needs to spaced out evenly')
 end
end
%Step size 
step = x(2)-x(1);
%Creating variables
evensum = 0;
oddsum = 0;
intervals = 0;
%Determines odd or even intervals
if rem((xl-1),2) == 0
    intervals = 0;
else 
    intervals = 1;
end

%Sum of the even segments
for k = 2:2:xl-1-intervals
    evensum = y(k) + evensum;
end

%Sum of the odd segments
for j = 3:2:yl-2-intervals
    oddsum = y(j) + oddsum;
end
%Trapizoide rule
trap = step*((y(yl)+y(yl-1))/2);

%Odd segments: 1/3rd simpsons and trapezoidal rule applied
if intervals ~= 0
    I = trap + ((step/3)*(y(1)+(4*evensum)+(2*oddsum)+y(yl-1)));
    disp('This used a partial trapezoidal rule because of odd number of segments')
%Even segments: 1/3rd simpsons rule applied
else
    I = (step/3)*(y(1)+(4*evensum)+(2*oddsum)+y(yl-1));
end
I
end
