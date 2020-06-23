function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

k =1 ; j = 1 ; i =0;
m = size(Xval, 1); 
predict = zeros(m,1);
range = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; 
ln_list = size(range, 1);
err = zeros (ln_list,ln_list);
for C = range, 
	for sigma = range, 
		i=i+1;
		fprintf('Executing %d of 64\n', i);
		model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
		predict =svmPredict(model,Xval);
		err(k,j) = mean(double(predict ~= yval));
		j += 1;
	end 
	j = 1; 
	k +=1; 
end

[min_value, column_index] = min(err(:));
[row, col] = ind2sub(size(err),column_index);

C = range(1, row); 
sigma = range(1, col);

% =========================================================================

end
