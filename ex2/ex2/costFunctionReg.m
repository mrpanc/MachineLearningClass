function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J = (-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))/m + ...
    lambda*(sum(power(theta(2:size(theta)), 2)))/(2*m);
for j = 1:size(theta)
    temp = 0;
    for i = 1:m
        temp = temp + (sigmoid(X(i,:)*theta)-y(i))*X(i,j);
    end
    if j > 1
        temp = temp + lambda*theta(j);
    end
    grad(j) = temp / m;
end

% =============================================================

end
