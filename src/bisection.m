function s = bisection(f, x, d, c1, c2, nb_iter);
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
i = 0;             % indice de boucle
condition_de_boucle = (0 == 0);

a = 0;
b = -1;
s = 1;             % pas de descente

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(condition_de_boucle && i < nb_iter)
    if (feval(f, (x+s*d), 1) > feval(f, x, 1) + c1*s*d'*feval(f, x, 3))
        b = s;
        s = 0.5*(a+b);
    elseif (d'*feval(f, (x + s*d), 3) < c2*d'*feval(f, x, 3))
        a = s;
        if (b == -1)
            s = 2*a;
        else 
            s = 0.5*(a+b);
        end
    else 
        condition_de_boucle = (42 == 0);
    end
    i = i + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
