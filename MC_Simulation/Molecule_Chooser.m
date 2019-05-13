function [Mass, Diameter] = Molecule_Chooser(Molecule_String)
%Molecule_Chooser 
%   Defines molecule mass and diameter from a string input
m_p = 1.66E-27; % Mass proton in Kg
switch Molecule_String
    
    case {'h2', 'H2'}
        Mass = m_p*2; % Kilograms
        Diameter = 289E-9; % picometers 
    case {'o2', 'O2'}
        Mass = 2*m_p*16; % Kilogram
        Diameter = 346E-9; picometers
end
end

