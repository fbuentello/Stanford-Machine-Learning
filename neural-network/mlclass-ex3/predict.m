function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Add ones to the X data matrix
a1 = [ones(m, 1) X];

% Calculate the first hidden layer of the NN
% size(Theta1) = 25 401
% size(a1) = 5000 401
% size(a1') = 401 5000
% size(Theta1 * a1') = 25 5000
a2 = sigmoid(Theta1 * a1');

% Add bias unit

% size(a2) = 25 5000
a2 = [ones(1, m); a2];

% Calculate the output layer of the NN
% size(a2) = 26 5000
% size(Theta2) = 10 26
% size(a2' * Theta2') = 5000 10
a3 = sigmoid(a2' * Theta2');

% Compute prediction
[pval, p] = max(a3, [], 2);

% =========================================================================

end
