N = 1000;
deviation = 17;
data = randn(N,1)+ deviation;
fx = zeros(N,1);
x = linspace(min(data),max(data), N);

for idx = 1:N
    fx(idx) = exp(- (x(idx)- mean(data))^2/(2*std(data)^2) );
end

plot(x,fx)