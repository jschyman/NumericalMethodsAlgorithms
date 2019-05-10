function [L,U,P] = luFactor(A)
%Jared Schymanski
%The luFactor function will create a upper and lower triangular matrix with
%a pivoting matrix to show and keep tab on when the equations are switched
%around
%Maxtrix A is the inputed coefficient matrix 
%Error Check:  Matrix A must be a matrix
if isscalar(A) == 1
    error('Matrix must be greater that 1 row and column')
end
%Setting the size of the Matrix A
[n,m] = size(A);
%Error Check: Matrix A must be a matrix
if n ~= m
    error('Matrix must be a squared matrix')
end

%Preset Variables:
%Idendity Matrix that keeps track of the pivoting
P = eye(n);
%U is the altered matix
U = A;
%L is zeroed out and values will be inserted back in
L = zeros(n);

%Guass elimination and pivoting in a nested loop:
%Movement across the columns
for i = 1:n-1
      for k = i:n-1
          %Pivoting and creating locations (Indexes) for the upper and lower matrixes
          %while keeping track of pivoting
       [~,vindex] = max(abs(U(k:n,i)));
       vindex = vindex + k - 1;
       %Place holder location of upper triangular matrix
       r1 = U(k,:);
       r2 = U(vindex,:);
       %Place holder location of identity matrix
       P1 = P(k,:);
       P2 = P(vindex,:);
       %Place holder location of lower triangular matrix
       L1 = L(k,:);
       L2 = L(vindex,:);
       %Pivot of upper triangular matrix
       U(vindex,:) = r1;
       U(k,:) = r2;
       %Pivot of identity matrix
       P(vindex,:) = P1;
       P(k,:) = P2;
       %Pivot of lower triangular matrix
       L(vindex,:) = L1;
       L(k,:) = L2;
      end
      %Finding the actual values of L and U then, inserting them into the
      %matrix
      for j = i+1:n
       L(j,i) = U(j,i)/U(i,i);
       U(j,:) = U(j,:) - L(j,i)*U(i,:);
      end      
end
%Sense the L matrix is zero'ed out, the for-loop inserts 1's on the diagonal
for r = 1:n
    L(r,r) = 1;
end

L
U
P
         
end



    