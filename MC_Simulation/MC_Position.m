function [X,Y, Z] = MC_Position(R)
% Funtion to generate random position within a sphere of
% radius R

found = 0; % Intialize loop condition to false 
while found == 0 
    rand_X = (R-(-R)).*rand(1,1) + (-R); % Genrate random X, Y Z
    rand_Y = (R-(-R)).*rand(1,1) + (-R);
    rand_Z = (R-(-R)).*rand(1,1) + (-R);
    
    % If the magnitude of the position is outside the sphere reject it 
    % if inside the sphere keep it and end
    if sqrt(sqrt(rand_X^2+rand_Y^2+ rand_Z^2)) < R 
        X = rand_X;
        Y = rand_Y;
        Z = rand_Z;
        found = 1;        
    end
end