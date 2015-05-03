function M = hessienne_derivee_f2(v, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcule et retourne la valeur de la f2, sa hessienne 
% ou son gradient en x.
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
    M = 100*(y-x*x)*(y-x*x)+(1-x)*(1-x);
    nfev = nfev + 1;
elseif (choix == 2)
    M = [-400*y+1200*x*x+2, -400*x ; -400*x, 200];
    nhev = nhev + 1;
else
    M = [-400*x*y+400*x*x*x+2*x-2 ; 200*y-200*x*x];
    ngev = ngev + 1;
end

