N = 1;
V = 0.0177; % 17.7 L
H_2_g_mol = 2.01588;

Avogadro = 6.022140857E23; % mol-1
H2_g = H_2_g_mol*1/Avogadro;
H2_Kg = H_2_g_mol*1/Avogadro *1/1000;
H2_Kg = H_2_g_mol*1/Avogadro *1/1000;
T= 300;
A = (pi*0.01^2)*2;
 Mean_Velocity = Mean_Thermal_Velocity(H2_Kg, T)
 
part = N/V*Mean_Velocity*A