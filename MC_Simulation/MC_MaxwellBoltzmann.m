function [Vel, P_v] = MC_MaxwellBoltzmann(fun,Max_Velocity,Max_P_v)
%UNTITLED7 Summary of this function goes here
 % Detailed explanation goes here
dv = 0.001;
K = 1.38E-23; % Boltzmann constant in Joules
T = 300; % Temperature in Kelvin   
m_p = 1.66E-27; % Mass Proton Kg
m_h2 = 2*m_p; 
m_CO2 = 7.308E-26;  % Mass CO2 in Kg
Max_Velocity = 5000; % m/s
%fun = @(x) 4*pi.*x.^2.*(m_h2/(2*pi*K*T))^(3/2)* exp(- (m_h2.*x.^2)./(2*K*T));
found = 0;

while found ==0
    randvel = (Max_Velocity-0).*rand(1,1) + 0;
    randp = (Max_P_v-0).*rand(1,1) + 0;
      %if randp < integral(fun,randvel,randvel+dv,'ArrayValued',true)
      if randp < feval(fun,randvel)
       Vel =randvel;
        P_v = randp;
        found = 1;
      end
    
end
    
end

