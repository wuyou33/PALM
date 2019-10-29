function Data = load_mg

% This function loads the data set for the modeling
% of the Mackey-Glass Chaotic Time Series
% 
% Inputs: 
% Output: Data  ... data samples
%
% We want to predict x(t+85) from the past values of this time series
% x(t-18), x(t-12), x(t-6), and x(t).
% The training data format is [x(t-18), x(t-12), x(t-6), x(t); x(t+85]
% From t = 201 to 3200, we collect 3000 data pairs used for training.
% From t = 5001 to 5500, we collect 500 data pairs used for validation.

load mg-train.dat;
Dat = mg_train;
columns = 5;

% Preparation of the training data
% Inputs
start = 1;             % x(t-18)
Dat_tr(:, 1) = Dat(start:start+3000-1);
start = start + 6;    % x(t-12)
Dat_tr(:, 2) = Dat(start:start+3000-1);
start = start + 6;    % x(t-6)
Dat_tr(:, 3) = Dat(start:start+3000-1);
start = start + 6;    % x(t)
Dat_tr(:, 4) = Dat(start:start+3000-1);
% Output
start = start + 85;    % x(t+85)
Dat_tr(:, 5) = Dat(start:start+3000-1);

% Plot only the output
% x = (0:1:2999).'; % Vectorized code
% figure(1);
% plot(x, Dat_tr(:,5));
% title('Training Data Set of the Mackey-Glass Chaotic Time Series');
% xlabel('Time (s)');
% ylabel('x(t)');
% pause on;
% pause;

% Normalization of the data in [0 1]
for i=1:columns
     min_tr(i) = min(Dat_tr(:,i));
     max_tr(i) = max(Dat_tr(:,i));
     Dat_tr(:,i) = (Dat_tr(:,i)-min_tr(i))/(max_tr(i) - min_tr(i));
 end


% Preparation of the validation data
load mg-test.dat;
Dat = mg_test;

% Inputs
start = 1;           % x(t-18)
Dat_val(:, 1) = Dat(start:start+500-1);
start = start + 6;    % x(t-12)
Dat_val(:, 2) = Dat(start:start+500-1);
start = start + 6;    % x(t-6)
Dat_val(:, 3) = Dat(start:start+500-1);
start = start + 6;    % x(t)
Dat_val(:, 4) = Dat(start:start+500-1);
% Output
start = start + 85;    % x(t+85)
Dat_val(:, 5) = Dat(start:start+500-1);

% Plot only the output
x = (0:1:499).'; % Vectorized code
% figure;
% plot(x, Dat_val(:,5));
% title('Validation Data Set of the Mackey-Glass Chaotic Time Series');
% xlabel('Time (s)');
% ylabel('x(t)');
% pause on;
% pause;
% 
% Normalization of the data in [0 1]
for i=1:columns
     min_val(i) = min(Dat_val(:,i));
     max_val(i) = max(Dat_val(:,i));
     Dat_val(:,i) = (Dat_val(:,i)-min_val(i))/(max_val(i) - min_val(i));
 end

% Agregation of the training and validation data
Data = [Dat_tr; Dat_val];

