function s = finition(Phi, f, x, d, smin, smax, c1, c2, nb_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule le pas par la méthode de la bisection et le retourne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - f           :  fonction du probleme
% Entree - x           :  position au moment du calcul
% Entree - d           :  direction de descente
% Entree - smin        :  valeur minimum du pas
% Entree - smax        :  valeur maximum du pas
% Entree - c1          :  constante 1 pour les conditions de Wolfe
% Entree - c2          :  constante 2 pour les conditions de Wolfe
        % 0 < c1 < c2 < 1
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des données
i = 0;             % indice de boucle
condition_de_boucle = (0 == 0);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(condition_de_boucle && i < nb_iter);
    s = bisection(f, x, d, c1, c2, nb_iter);
    if(s < smin) s = smin;
    elseif (s > smax) s = smax;
    end
    
    phi_s = feval(Phi, x, s, d, f, 1);
    phi_primes = feval(Phi, x, s, d, f, 2);
    phi_0 = feval(Phi, x, 0, d, f, 1);
    phi_smin = feval(Phi, x, smin, d, f, 1);
    phi_prime0 = feval(Phi, x, 0, d, f, 2);
    
    if (phi_s > (phi_0 + c1*s*phi_prime0) || phi_s >= phi_smin)
        smax = s;
    else
        if (abs(phi_primes) <= -c2*phi_prime0)
            condition_de_boucle = (0==42);
        else if (phi_primes*(smax-smin) >= 0)
                smax = smin;
             smin = s;
            end
        end
    i = i + 1;
    end
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%
