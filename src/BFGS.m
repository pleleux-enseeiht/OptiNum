function x = BFGS(Phi, f, x0, ro, c1, c2, Critere, nb_iter, choix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applique l'algorithme BFGS a f et retourne la solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  f(x + s*d)
% Entree - f           :  fonction du probleme
% Entree - x0          :  premiere approx de la solution
% Entree - c1          :  constante 1 pour les conditions de Wolfe
% Entree - c2          :  constante 2 pour les conditions de Wolfe
        % 0 < c1 < c2 < 1
% Entree - Critere     :  critere d'arret de la fonction
% Entree - nb_iter     :  nombre maximum d'itération
% Entree - choix       :  choix de la fonction pour decider le pas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global iter;

% Initialisation des données
x = x0;             % initialisation de la solution
% initialisation de B approx de l'inverse de la matrice 
% hessienne en x0 (ou B = I2)
    % n = size(x);
    % B = eye(n(1,1));
B = eye(2);
s = 1;

res1 = Critere*norm(x, 2) + 1;          % écart relatif entre xk et xk+1
res2 = Critere*abs(feval(f, x, 1)) + 1; % écart relatif entre f(xk) et f(xk+1)
iter = 0;              % indice de boucle


%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(norm(feval(f, x, 3))>Critere&&iter<nb_iter)
    
    % Memorisation de la valeur de x
    old_x = x;
    
    % Calcul de la direction de descente
    d = -B*feval(f, x, 3);
    
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
    
    % Mise a jour de x
    x = x + s*d;
    
    % Mise a jour de y
    y = feval(f, x, 3) - feval(f, old_x, 3);
    
    % Mise a jour de B
    a1 = d'*y;
    a2 = s*d-B*y;
    B = B +((a2*d'+d*a2')/a1)-((a2'*y)/(a1*a1))*d*d';
    
    % Test_convergence et incrémentation de l'indice i
    % Test_convergence et incrémentation de l'indice i
    res1 = norm(x - old_x, 2);
    res2 = abs(feval(f, x, 1)-feval(f, old_x, 1));
    iter = iter + 1;
end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

