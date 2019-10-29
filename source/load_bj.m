function [Data, n] = load_bj

% This function loads the data set for the modeling
% of the Box-Jenkins Time Series
% 
% Inputs: 
% Output: Data  ... data samples
%
% We want to predict y(t) from the past values of this time series
% u(t-4) and y(t-1). The training data format is [u(t-4) y(t-1); y(t)]
% We collect 290 data pairs, of the above format, 200 are used for training
% and 90 for validation.

% »»»»»»»»»»»»»»»»»»»»»»»
% Preparation of the data
% «««««««««««««««««««««««

load bj-data.dat;
Dat = bj_data(:,[9,2,1]);
columns = 3;


% Plot only the output
x = (0:1:289).'; % vectorized code
% figure(1);
% plot(x, Dat(:,columns));
% title('Box-Jenkins Time Series');
% xlabel('Time (s)');
% ylabel('x(t)');
% disp(sprintf('\nTo continue press any button, please'));
% pause on;
% pause;


% Normalization of the data in [0 1]
for i=1:columns
     min_(i) = min(Dat(:,i));
     max_(i) = max(Dat(:,i));
     Dat(:,i) = (Dat(:,i)-min_(i))/(max_(i) - min_(i));
 end

% Aggregation of data
Data = [Dat(:,1) Dat(:,2) Dat(:,3)];

n=2;