function M = lagrangien(v, f, c, u, l, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule et retourne la valeur de f1, sa hessienne ou 
% son gradient en x.
% function test_convergence(Pos, BH, NbIter, Critere);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - v     : vecteur colonne point où on calcule 
%   la hessienne.
% Entree - choix : 1 pour la fonction, 2 pour la 
% hessienne, 3 pour la derivee
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = v(1,1);
y = v(2,1);

if (choix==1)
    M = feval(f, v, 1)-l'*feval(c, v, 1)+(l'/2)*feval(c, v, 2);
elseif (choix==3)
    M = feval(f, v, 3) + l'*feval(c, v, 3) + u*feval(c, v, 3)*feval(c, v, 1);
end