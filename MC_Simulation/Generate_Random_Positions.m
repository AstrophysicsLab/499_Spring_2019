function Position = Generate_Random_Positions(N, R)
%Generate_Random_Directions
%   Generates N random positions
X = zeros(N,1);
Y = zeros(N,1);
Z = zeros(N,1);
Position = zeros(N,3);
parfor idx = 1:N
    
    [X(idx),Y(idx), Z(idx)] = MC_Position(R);
end


Position(:,1) = X(:);
Position(:,2) = Y(:);
Position(:,3) = Z(:);
end

