


fun = @(x) 4*pi.*x.^2.*(m_h2/(2*pi*K*T))^(3/2)* exp(- (m_h2.*x.^2)./(2*K*T));

for idx = 1:1000
 integral(fun,0,idx,'ArrayValued',true);
end