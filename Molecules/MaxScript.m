v = linspace(0,2000,500);
H_2_g_mol = 2.01588;
Avogadro = 6.022140857E23; % mol-1
H2_g = H_2_g_mol*1/Avogadro;
H2_Kg = H_2_g_mol*1/Avogadro *1/1000;
m = H2_Kg;
K = 1.38E-23;
T = 10;
fv = zeros(1,length(v));
for idx=1:length(v)
    fv(idx) =  4/sqrt(pi) * (m/(2*K*T))^(3/2)*v(idx)^2 *exp(-(m* v(idx)^2)/ (2*K*T));
end

plot(v,fv)