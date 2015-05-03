function M = f1(v, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule et retourne la valeur de f1, sa hessienne ou 
% son gradient en x.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - v     : vecteur colonne point où on calcule 
%   la hessienne.
% Entree - choix : 1 pour la fonction, 2 pour la 
% hessienne, 3 pour la derivee
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global nfev;
global ngev;
global nhev;

x = v(1,1);
y = v(2,1);

if (choix == 1)
    M = 2*(x+y-2)*(x+y-2)+(x-y)*(x-y);
    nfev = nfev + 1;
elseif (choix == 2)
    M = [6, 2 ; 2, 6];
    nhev = nhev + 1;
else
    M = [6*x+2*y-8 ; 6*y+2*x-8];
    ngev = ngev + 1;
end

