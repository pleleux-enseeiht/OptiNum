% Programme de test d'optimisation numérique

function testParametre(f2, Phi)

sid = fopen('fichierTestParametre', 'w');

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'-------------  PROGRAMME DE TEST: OPTIMISATION NUMERIQUE  -----------------\n');
fprintf(sid,'---------------------  INFLUENCE DES PARAMETRES  --------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');

% Valeurs des paramètres

ro = [0.001; 0.1; 0.5; 0.9; 0.95];
c = [0.1 0.2; 0.1 0.9; 0.5 0.9; 0.8 0.9; 0.000001 0.000002; 0.4 0.5; 0.98 0.99]; 

% Fonctions

global nfev;
global ngev;
global nhev;
global iter;

Eps = 1e-10;
nb_iter = 100000;

nfev = 0;
ngev = 0;
nhev = 0;
iter = 0;

fprintf(sid, 'Les tests seront effectués sur l algorithme de Newton appliqué à f2 au point [10, 10] avec \n');
fprintf(sid, '\t- backtracking pour tester l influence du paramètre de contraction\n');
fprintf(sid, '\t- bisection pour tester l inluence de c1 et c2\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Tests sur l influence du paramètre de contraction ro :\n');
for i=1:1:5
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Valeur du paramètre : ro = %d\n', ro(i, 1));
	x = algoNewton(Phi, f2, [10; 10], ro(i, 1), c(6, 1), c(6, 2), Eps, nb_iter, 1);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Tests sur l influence des paramètres c1 et c2 :\n');
for i=1:1:7
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Valeur des paramètres : c1 = %d, c2 = %d\n', c(i, 1), c(i, 2));
	x = algoNewton(Phi, f2, [10; 10], ro(3, 1), c(i, 1), c(i, 2), Eps, nb_iter, 2);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

fclose(sid);

end
