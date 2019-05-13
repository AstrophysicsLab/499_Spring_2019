K = 1.38E-23; % Boltzmann constant in Joules
T = 300; % Temperature in Kelvin   
m_p = 1.66E-27; % Mass Proton Kg
m_h2 = 2*m_p; 
m_CO2 = 7.308E-26;  % Mass CO2 in Kg
Max_Velocity = 5000; % m/s
fun = @(x) 4*pi.*x.^2.*(m_h2/(2*pi*K*T))^(3/2)* exp(- (m_h2.*x.^2)./(2*K*T)); % Define quation