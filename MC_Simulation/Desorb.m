clearvars
N = 1E6;
dt = 1E-4;
Time = 30;
Itterations = Time/dt;
K = 1.38E-23;
dT = 1E-2;
T_Low = 10;
T_High = 95;
%T=  linspace(T_Low,T_High,Itterations);
T = 10:1:100;
%Eb = abs(normrnd(0.034,0.01,N,1))*(1.6E-19);
%Eb = raylrnd(0.03,N,1)*(1.6E-19);
%Eb = wblrnd(.034,4,N,1)*(1.6E-19);
v0 = 1E-13;
Desorbed = 0;
Timecode = zeros(Itterations,3);
Time = dt;
% 
% for jdx =1:length(T)
    
   % for idx = 1:Itterations 
for idx = 1:length(T)
    Residency_Time = v0*exp(Eb/(K*T(idx)))-dt;

    Index = find(Residency_Time <0);
    if isempty(Index)==0
        Desorbed = Desorbed+length(Index);
        Eb(Index) = [];
        Timecode(idx,1) = Time;
        Timecode(idx,2) = length(Index);
        Timecode(idx,3) = T(idx);
    else
        Timecode(idx,1) = Time;
        Timecode(idx,2) = 0;
        Timecode(idx,3) = T(idx);
    end
    Time = Time+dt;
end

scatter(Timecode(:,3), Timecode(:,2))
  %  end

% 
% end



