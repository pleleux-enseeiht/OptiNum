function M = c(v, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule et retourne la valeur de c, sa hessienne ou 
% son gradient en x.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - v     : vecteur colonne point où on calcule 
%   la hessienne.
% Entree - choix : 1 pour la fonction, 2 pour la 
% hessienne, 3 pour la derivee
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = v(1,1);
y = v(2,1);

if (choix == 1)
    M = x*x+y*y-1.5;
elseif (choix == 2)
    M = (x*x+y*y-1.5)*(x*x+y*y-1.5);
elseif (choix == 3)
    M = [2*x; 2*y];
end

