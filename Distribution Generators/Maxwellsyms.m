
%f = 4*pi*x^2*(m/(2*pi*K*T))^(3/2)* exp(- (m*x^2)/(2*K*T));

for idx =1:100

int(f, x, 0, idx);
end