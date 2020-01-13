function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ======================  CODE  ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


h=zeros(size(y));
h=X*theta;
for i=1:size(y,1)
  J=J+(h(i)-y(i))^(2);
endfor
J=J/(2*m);

% =========================================================================

end
