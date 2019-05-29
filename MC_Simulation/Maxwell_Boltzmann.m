N = 1000; % Number of particles
K = 1.38E-23; % Boltzmann constant in Joules
T = 300; % Temperature in Kelvin   
m_p = 1.66E-27; % Mass Proton Kg
m_h2 = 2*m_p; 
m_CO2 = 7.308E-26;  % Mass CO2 in Kg
Max_Velocity = 5000; % m/s
fun = @(x) 4*pi.*x.^2.*(m_h2/(2*pi*K*T))^(3/2)* exp(- (m_h2.*x.^2)./(2*K*T)); % Define quation
 q = integral(fun,0,Inf,'ArrayValued',true);
 
 
 
Distribution_Values = zeros(Max_Velocity,1);
for idx = 1:Max_Velocity
Distribution_Values(idx) = feval(fun,idx);
end
Max_P_v = max(Distribution_Values);
%  a = 0;
% b = 1500;
 dv = 0.001;
Num_Particles = 1E4;
particles = zeros(Num_Particles,2);
found = 0;

vel = zeros(Num_Particles,1);
Prob = zeros(Num_Particles,1);
% 
% poolobj = gcp;
% addAttachedFiles(poolobj,{'MB_CONST.m'})
% m_h2 = parallel.pool.Constant(m_h2);
parfor idx =1:Num_Particles
    
  [vel(idx), Prob(idx)] = MC_MaxwellBoltzmann(fun,Max_Velocity,Max_P_v);
end

particles(:,1) = vel(:);
particles(:,2) = Prob(:);
%subplot(2,1,1)
scatter(particles(:,1),particles(:,2),'.')
%subplot(2,1,2)
grid on
title('Maxwell Boltzmann Distribution of Velocities','FontSize', 13)
xlabel('Velocity (m/s)','FontSize', 13 )
ylabel('Probability P(v)','FontSize', 13)
xlim([0 4500])
%hist(particles(:,1))