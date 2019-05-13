function [mean, standard_deviation, sm] = Deviation(data)
%Deviation 
%   function calcs the mean, deviation and deviation from the mean
n = length(data);
sum_data = 0;
data_minus_mean_sq = zeros(1, length(data));
data = sort(data);
for idx = 1:n
  sum_data = sum_data + data(idx); 
end
mean = sum_data/n;
for idx = 1:n
    data_minus_mean_sq(idx) = (data(idx)- mean)^2;
end
standard_deviation = sqrt((sum(data_minus_mean_sq))/(n-1));
sm = standard_deviation/sqrt(n);

Negative_3_Sigma = mean - 3 * standard_deviation;
Negative_2_Sigma = mean - 2 * standard_deviation;
Negative_1_Sigma = mean - 1 * standard_deviation;
Positive_3_Sigma = mean + 3 * standard_deviation;
Positive_2_Sigma = mean + 2 * standard_deviation;
Positive_1_Sigma = mean + 1 * standard_deviation;

subplot(2,1,1)
data_fit = histfit(data,10,'normal');
ylimit = ylim;
line([mean, mean], ylimit, 'Color', [0, 0, 0], 'LineWidth', 3);
title('Histogram Fit of Data')
xlabel('x','FontSize',12,'FontWeight','bold')
ylabel('Occurences','FontSize',12,'FontWeight','bold')
grid on;
 
line_data = data_fit(2);
x_data = line_data.XData;
y_data = line_data.YData;
 
N_3 = [ min(find( x_data > Negative_3_Sigma)),  max(find(x_data < Negative_2_Sigma))];
N_2 = [ min(find( x_data > Negative_2_Sigma)),  max(find(x_data < Negative_1_Sigma))];
N_1 = [ min(find( x_data > Negative_1_Sigma)),  max(find(x_data < Positive_1_Sigma))];
P_2 = [ min(find( x_data > Positive_1_Sigma)),  max(find(x_data < Positive_2_Sigma))];
P_3 = [ min(find( x_data > Positive_2_Sigma)),  max(find(x_data < Positive_3_Sigma))];

subplot(2,1,2)
plot(x_data, y_data)
hold on
grid on
title('Gaussian Distribution of Data')
xlabel('x','FontSize',12,'FontWeight','bold')
ylabel('f(x)','FontSize',12,'FontWeight','bold')
area( x_data( N_3(1):N_3(2) ), y_data( N_3(1):N_3(2) ), 'FaceColor', [0.8 1 0.89] );
area( x_data( N_2(1):N_2(2) ), y_data( N_2(1):N_2(2) ) , 'FaceColor', [0 0.8 0.8] );
area( x_data( N_1(1):N_1(2) ), y_data( N_1(1):N_1(2) ) , 'FaceColor', [0 0.4 0.8] );
area( x_data( P_2(1):P_2(2) ), y_data( P_2(1):P_2(2) ) , 'FaceColor', [0 0.8 0.8] );
area( x_data( P_3(1):P_3(2) ), y_data( P_3(1):P_3(2) ) , 'FaceColor', [0.8 1 0.89] );
line([mean, mean], ylimit, 'Color', [1, .5, 0], 'LineWidth', 3);
end

