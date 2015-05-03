function x = lagrangienAugmente(u0, lam0, La, f, c, BFGS, Phi, x0, Critere, nb_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applique l'algorithme BFGS a f et retourne la solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  f(x + s*d)
% Entree - f           :  fonction du probleme
% Entree - x0          :  premiere approx de la solution
% Entree - Critere     :  critere d'arret de la fonction
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = x0;
u = u0;
lam = lam0;
res1 = Critere*norm(x, 2) + 1;          % écart relatif entre xk et xk+1
res2 = Critere*abs(feval(f, x, 1)) + 1; % écart relatif entre f(xk) et f(xk+1)
i = 0;              % indice de boucle


%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(norm(feval(La, x, f, c, u, lam, 3)) > Critere)
    % Memorisation de la valeur de x
    old_x = x;
    
    % Calcul d'une approximation du minimiseur du lagrangien
    x = BFGS(Phi, f, x, Critere, nb_iter);
    
    % Mise a jour de l
    lam = lam - u*feval(c, x, 1);
    
    % Mise a jour de u
    u = u + 100;
    
    % Test_convergence et incrémentation de l'indice i
    % Test_convergence et incrémentation de l'indice i
    res1 = norm(x - old_x, 2);
    res2 = abs(feval(f, x, 1)-feval(f, old_x, 1));
    i = i + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

