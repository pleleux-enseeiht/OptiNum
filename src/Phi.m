function M = Phi(x, s, d, f, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule et retourne la valeur de Phi ou sa dérivée 
% en x.
% function test_convergence(Pos, BH, NbIter, Critere);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - x           :  position au moment du calcul
% Entree - s           :  pas de descente
% Entree - d           :  direction de descente
% Entree - f           :  fonction du probleme
% Entree - choix : 1 pour la fonction, 2 pour la 
% derivee
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if (choix == 1)
    M = feval(f, (x + s*d), 1);
else
    M = d'*feval(f, (x + s*d), 3);
end

