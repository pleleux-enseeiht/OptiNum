function sol = equation_degre_2(Phi, f, x, d, s0, s1, phi_0, phi_prime_0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% resout une equation de degre 2 et la retourne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  f(x + s*d)
% Entree - f           :  fonction du probleme
% Entree - x           :  position au moment du calcul
% Entree - d           :  direction de descente
% Entree - s0          :  pas de descente initial a l'itération
% Entree - s1          :  argmin de Phiq
% Entree - phi_0       :  Phi(0)
% Entree - phi_prime_0 :  Phi'(0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
bla1 = (1/(s0*s0*s1*s1*(s1-s0)));
bla2 =[s0*s0, -s1*s1; -s0*s0*s0, s1*s1*s1];
bla3 =[feval(Phi, x, s1, d, f, 1)-phi_0-phi_prime_0*s1; feval(Phi, x, s0, d, f, 1)-phi_0-phi_prime_0*s0];
bla4 = bla1*bla2*bla3;
a = bla4(1,1);
b = bla4(2,1);


delta = 4*b*b - 12*a*phi_prime_0;

if (delta <= 0)
    sol = -1;
else
    sqrt_delta = sqrt(delta);
    sol1 = (-2*b + sqrt_delta)/(6*a);
    sol2 = (-2*b - sqrt_delta)/(6*a);
    if (a > 0)
        sol = max([sol1, sol2]);
        if (phi_0 < a*sol*sol*sol+b*sol*sol+phi_prime_0*sol+phi_0)
            sol = -1;
        end
    else
        sol = min([sol1, sol2]);
        if (a*s1*s1*s1+b*s1*s1+phi_prime_0*s1+phi_0 <= a*sol*sol*sol+b*sol*sol+phi_prime_0*sol+phi_0)
            sol = -1;
        end
    end
end
if (sol <=0)
    sol = s1 + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

