function XYZ = Random_Direction()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Theta =(-180 +(180+180) *rand(1)) *pi/180;
Phi =(-360 +(360+360) *rand(1)) *pi/180;
R = 1;
[x,y,z] = sph2cart(Phi,Theta,R);
magnitude = sqrt(x^2+y^2+z^2);
x = x/magnitude;
y = y/magnitude;
z = z/magnitude;
XYZ = [x,y,z];
end

