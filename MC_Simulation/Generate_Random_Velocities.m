function [Velocities, Probabilities] = Generate_Random_Velocities(N, T, m)
%Generate_Random_Velocities 
%   Generates random Maxwell-Boltzmann Distribution of velocities 
%   using a Monte Carlo rejection method given the number of particles 
%   and the temperature and mass
K = 1.38E-23; % Boltzmann constant in Joules

Velocity_upper_Limit = 5000; % m/s
% Define Maxwell-Boltzmann equation
f_v = @(x) 4*pi.*x.^2.*(m/(2*pi*K*T))^(3/2)* exp(- (m.*x.^2)./(2*K*T)); 
% Create probabilty array for analysis of min and max
Distribution_Values = zeros(Velocity_upper_Limit,1);
for idx = 1:Velocity_upper_Limit
Distribution_Values(idx) = feval(f_v,idx);
end
% Define maximum probability
Max_P_v = max(Distribution_Values);

velocities = zeros(N,1);
Probability = zeros(N,1);
for idx =1:N
    
  [velocities(idx), Probability(idx)] = MC_MaxwellBoltzmann(f_v,Velocity_upper_Limit,Max_P_v);
end

Velocities = velocities;
Probabilities = Probability;
% f = figure('visible','off');
% subplot(2,1,1)
% scatter(Velocities(:),Probability(:))
% subplot(2,1,2)
% hist(Velocities(:))
% saveas(f,'Velocitiy_Distibution','fig')
end

