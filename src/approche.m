function s = approche(Phi, f, x, d, c1, c2, nb_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule le pas par la méthode de la bisection et le retourne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - f           :  fonction du probleme
% Entree - x           :  position au moment du calcul
% Entree - d           :  direction de descente
% Entree - c1          :  constante 1 pour les conditions de Wolfe
% Entree - c2          :  constante 2 pour les conditions de Wolfe
        % 0 < c1 < c2 < 1
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des données
s0 = 0;
s = 1;
smax = 1;
i = 0;             % indice de boucle
condition_de_boucle = (0 == 0);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(condition_de_boucle && i < nb_iter)
    
    phi_si = feval(Phi, x, s, d, f, 1);
    phi_primesi = feval(Phi, x, s, d, f, 2);
    phi_simoins1 = feval(Phi, x, s0, d, f, 1);
    phi_0 = feval(Phi, x, 0, d, f, 1);
    phi_prime0 = feval(Phi, x, 0, d, f, 2);
    
    if ( phi_si > (phi_0 + c1*s*phi_prime0) || (phi_si >= phi_simoins1 && i > 1))
        s = finition(Phi, f, x, d, s0, s, c1, c2, nb_iter);
        condition_de_boucle = (0==42);
    elseif (abs(phi_primesi) <= -c2*phi_prime0)
        condition_de_boucle = (0==42);
    elseif (phi_primesi >= 0)
        s = finition(Phi, f, x, d, s, s0, c1, c2, nb_iter);
        condition_de_boucle = (0==42);
    else
        s0 = s;
        s = bisection(f, x, d, c1, c2, nb_iter);
        i = i + 1;
    end
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

