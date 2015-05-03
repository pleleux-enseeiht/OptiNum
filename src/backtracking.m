function s = backtracking(f, x, d, p, nb_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule le pas par une méthode de backtracking et le retourne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - f           :  fonction du probleme
% Entree - x           :  position au moment du calcul
% Entree - d           :  direction de descente
% Entree - p           :  0 < p < 1
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des données
i = 0;             % indice de boucle
s = 1;             % pas de descente

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while((feval(f, (x+s*d), 1) > feval(f, x, 1) + p*s*d'*feval(f, x, 3)) && i < nb_iter)
    s = p*s;
    i = i + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

