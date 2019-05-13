function Open_Figure(Fig_String)
%Open_Figure 
%   Open non-visible figure given the name
switch Fig_String
    case 'all'
        openfig('Velocitiy_Distibution.fig','new','visible')
        openfig('Position_Distibution.fig','new','visible')
    otherwise
        Figure_string = [Fig_String, '.fig'];
        openfig(Figure_string,'new','visible')

end
end

