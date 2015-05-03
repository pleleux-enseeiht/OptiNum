function x = algo_newton(Phi, f, x0, ro, c1, c2, Critere, nb_iter, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applique la méthode de Newton locale a f et retourne la solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  fonction f(x + s*d) utilisee par quadracube et approche
% Entree - f           :  fonction du probleme
% Entree - x0          :  point de départ de l'algorithme
% Entree - c1          :  constante 1 pour les conditions de Wolfe
% Entree - c2          :  constante 2 pour les conditions de Wolfe
        % 0 < c1 < c2 < 1
% Entree - Critere     :  critere d'arret de la fonction
% Entree - nb_iter     :  nombre d'iterations maximum de l'algo
% Entree - choix       :  choix de la fonction pour decider le pas
%		(1 backtracking, 2 bisection, 3 quadracube, 4 approche sinon pas fixe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global iter;

t = cputime;

x = x0;             % initialisation de la solution
s = 1;              % pas de descente 

res1 = Critere*norm(x, 2) + 1;          % écart relatif entre xk et xk+1
res2 = Critere*abs(feval(f, x, 1)) + 1; % écart relatif entre f(xk) et f(xk+1)
iter = 0;                                  % indice de boucle

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(res1 > Critere*norm(x, 2) && res2 > Critere*abs(feval(f, x, 1)) && iter < nb_iter)
    % Memorisation de la valeur de x
    old_x = x;
    
    % Calcul de la direction de descente
    d = -feval(f, x, 2)\feval(f, x, 3);

    % Calcul du pas de descente
	if (choix == 1)
		s = backtracking(f, x, d, ro, nb_iter);
	elseif (choix == 2) 
		s = bisection(f, x, d, c1, c2, nb_iter);
	elseif (choix == 3)
		s = quadracube(f, Phi, x, d, s, c1, nb_iter);
	elseif (choix == 4)
    	s = approche(Phi, f, x, d, c1, c2, nb_iter);
	end
    
    % Mise a jour
    x = x + s*d;
    
    % Test_convergence et incrémentation de l'indice i
    res1 = norm(x - old_x, 2);
    res2 = abs(feval(f, x, 1)-feval(f, old_x, 1));
    iter = iter + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

t = cputime - t;
sprintf('Nombre d iterations: %d\n', iter-1);
sprintf('temps: %d s\n',t);

