function s = quadracube(f, Phi, x, d, s0, c1, nb_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applique l'algorithme BFGS a f et retourne la solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  f(x + s*d)
% Entree - f           :  fonction du probleme
% Entree - x           :  position au moment du calcul
% Entree - d           :  direction de descente
% Entree - s0          :  pas de descente initial
% Entree - c1          :  constante 1 pour les conditions de Wolfe
% Entree - c2          :  constante 2 pour les conditions de Wolfe
        % 0 < c1 < c2 < 1
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des données
i = 0;             % indice de boucle
condition_de_boucle = (0 == 0);

s = 1;             % pas de descente
phi_0 = feval(Phi, x, 0, d, f, 1);
phi_prime_0 = feval(Phi, x, 0, d, f, 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Quadracube %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (feval(Phi, x, s0, d, f, 1) <= phi_0 + c1*s0*phi_prime_0);
    s = s0;
else coeff = (feval(Phi, x, s0, d, f, 1)-phi_0-s0*phi_prime_0)/(s0*s0);
     s1 = -phi_prime_0/(2*coeff);         
     if (coeff <= 0)
         if (phi_0 < coeff + phi_prime_0 + phi_0)
             s1 = 0;
         else 
             s1 = 1;
         end
     else
         if (s1 < 0 || s1 > 1)
             if (phi_prime_0 > 0)
                 s1 = 0;
                 else s1 = 1;
             end
         end
     end
     if (feval(Phi, x, s1, d, f, 1) <= phi_0 +c1*s1*phi_prime_0);
        s = s1;
     else
        while(condition_de_boucle && i < nb_iter) 
            s2 = equation_degre_2(Phi, f, x, d, s0, s1, phi_0, phi_prime_0);
            if (s2 >= s1)
                s2 = s1/2;
            end
            if (feval(Phi, x, s2, d, f, 1) <= phi_0 + c1*s2*phi_prime_0)
                s = s2;
                condition_de_boucle = (0 == 42);
            else
                s0 = s1;
                s1 = s2;
            end
            i = i+ 1;
        end
    end
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
