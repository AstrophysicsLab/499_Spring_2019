function Direction = Generate_Random_Directions(N)
%Generate_Random_Directions
%   Generates N random Direction

Direction = zeros(N,3);
parfor idx = 1:N
    Direction(idx,:) = Random_Direction()
end

end

