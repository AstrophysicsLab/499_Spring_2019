N = 1E4;
R = 1;
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

% scatter3(Position(:,1),Position(:,2),Position(:,3),'.')


A = Position(:,1) <0 &Position(:,2) <0 &Position(:,3) <0;
a = Position(A,:);
scatter3(a(:,1),a(:,2),a(:,3),'.')

hold on
B = Position(:,1) < 0 &Position(:,2) <0 &Position(:,3) >0;
b = Position(B,:);
scatter3(b(:,1),b(:,2),b(:,3),'.')

C = Position(:,1) < 0 &Position(:,2) >0 &Position(:,3) >0;
c = Position(C,:);
scatter3(c(:,1),c(:,2),c(:,3),'.')

D = Position(:,1) > 0 &Position(:,2) >0 &Position(:,3) >0;
d = Position(D,:);
scatter3(d(:,1),d(:,2),d(:,3),'.')

E = Position(:,1) > 0 &Position(:,2) >0 &Position(:,3) <0;
e = Position(E,:);
scatter3(e(:,1),e(:,2),e(:,3),'.')

F = Position(:,1) > 0 &Position(:,2) <0 &Position(:,3) >0;
f = Position(F,:);
scatter3(f(:,1),f(:,2),f(:,3),'.')

G = Position(:,1) > 0 &Position(:,2) <0 &Position(:,3) <0;
g = Position(G,:);
scatter3(g(:,1),g(:,2),g(:,3),'.')

H = Position(:,1) < 0 &Position(:,2) >0 &Position(:,3) <0;
h = Position(H,:);
scatter3(h(:,1),h(:,2),h(:,3),'.')





