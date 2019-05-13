
R = 5;
Threshold = 1E-7;
dt = 0.01;
t = 0:dt:3;
alpha = 5*pi/6;
mag = 3;
X = 3;
Y = 2;
for idx =1:length(t)
if sqrt(X(idx)^2+Y(idx)^2) >= R-Threshold
    theta= pi-alpha;
    beta =pi/2 - theta;
    phi = (alpha-pi) - 2*beta;
    alpha =phi;
end
X(end+1) = X(idx)+ mag*cos(alpha)*dt;
Y(end+1) = Y(idx)+ mag*sin(alpha)*dt;
end

plot(X,Y)