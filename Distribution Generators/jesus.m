phi = (1/sqrt(3))*[1 1 0 0 0 0 1 0]';
a = phi(1,1);
b = phi(2,1);
c = phi(3,1);
d = phi(4,1);
e = phi(5,1);
f = phi(6,1);
g = phi(7,1);
h = phi(8,1);
Phi_array = [a,b,c,d,e,f,g,h];
r = rand;
q = (abs(a))^2;
if r < q 
    disp('|000>')%[1 0 0 0 0 0 0 0]
else 
    q = q + (abs(b))^2;
    if r < q
       disp('|001>')%[0 1 0 0 0 0 0 0]
    else
        q = q + (abs(c))^2;
        if r < q
            disp('|010>')%[0 0 1 0 0 0 0 0]
        else
            q = q + (abs(d))^2;
            if r < q
                  disp('|011>')%[0 0 0 1 0 0 0 0]
            else
                q = q + (abs(e))^2;
                if r < q
                     disp('|100>')%[0 0 0 0 1 0 0 0]
                else
                    q = q + (abs(f))^2;
                    if r < q
                        disp('|101>')%[0 0 0 0 0 1 0 0]
                    else
                        q = q + (abs(g))^2;   
                        if r < q
                             disp('|110>')%[0 0 0 0 0 0 0 1]
                        else
                             q = q + (abs(h))^2;
                             if r < q
                                disp('|111>')%[0 0 0 0 0 0 1 0]
                             end   
                        end
                    end
                end
            end    
        end
    end
end


























