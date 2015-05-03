% Programme de test d'optimisation numérique

function test(f1, f2, Phi)

sid = fopen('fichierTest', 'w');

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'-------------  PROGRAMME DE TEST: OPTIMISATION NUMERIQUE  -----------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');

% Points initiaux

X = [0 0;0 1;1 0;1 3;3 1;10 10];

% Fonctions

global nfev;
global ngev;
global nhev;
global iter;

ro = 0.5;
c1 = 0.4;
c2 = 0.5;
Eps = 1e-10;
nb_iter = 100000;

nfev = 0;
ngev = 0;
nhev = 0;
iter = 0;

fprintf(sid, 'Tests pour l algorithme de Newton de critères d arrêts : \n\t- | ||xk+1||-||xk|| |<Eps\n\t- | ||f(xk+1)||-||f(xk)|| |<Eps\n\t- iter > nb_iter\n');

fprintf(sid,'Algorithme de Newton avec pas fixe :\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 42);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n\n', iter);
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
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec pas fixe :\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 42);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec backtracking :\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 1);
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
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec backtracking\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 1);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec bisection:\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 2);
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
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec bisection:\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 2);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec interpolation quadratique\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 3);
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
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec interpolation quadratique\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 3);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d\n', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec approche et finition\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = algoNewton(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 4);
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
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme de Newton avec finition et approche\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	if (i==5||i==6)
		  fprintf(sid,'L algorithme ne marche pas avec ce point, il boucle\n');
	else  
		  x = algoNewton(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 4);
		  fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
		  fprintf(sid, 'nombre d itérations : %d\n', iter);
		  fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
		  t = cputime - t;
		  fprintf(sid,'durée d exécution : %d', t);
	end
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');

fprintf(sid, 'Tests pour l algorithme de Newton de critères d arrêts : \n\t- norm(grad f(xk))<Eps\n\t- iter > nb_iter\n');

fprintf(sid,'Algorithme BFGS avec pas fixe:\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 42);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec pas fixe:\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	if (i==6)
		  fprintf(sid,'L algorithme ne marche pas avec ce point, il boucle\n');
	else  
		  x = BFGS(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 42);
		  fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
		  fprintf(sid, 'nombre d itérations : %d\n', iter);
		  fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
		  t = cputime - t;
		  fprintf(sid,'durée d exécution : %d', t);
	end
	nfev = 0;
	ngev = 0;
	nhev = 0;
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec backtracking\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 1);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec backtracking\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 1);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec bisection:\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 2);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec bisection:\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 2);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec interpolation quadratique\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	x = BFGS(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 3);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec interpolation quadratique\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	if (i==2)
		  fprintf(sid,'L algorithme ne marche pas avec ce point, il boucle\n');
	else  
		  x = BFGS(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 3);
		  fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
		  fprintf(sid, 'nombre d itérations : %d\n', iter);
		  fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
		  t = cputime - t;
		  fprintf(sid,'durée d exécution : %d', t);
	end
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');

fprintf(sid,'Algorithme BFGS avec approche et finition\n');
fprintf(sid,'f1(x) = 2*(x+y-2)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	fprintf(sid,'L algorithme ne marche pas avec ce point, il boucle\n');  
	x = BFGS(Phi, f1, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 4);
	fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
	fprintf(sid, 'nombre d itérations : %d\n', iter);
	fprintf(sid,'nombre d évaluations des fonctions : \n\t- f1 : %d\n\t- grad f1 : %d\n\t- Hessienne f1 : %d\n', nfev, ngev, nhev);
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
	t = cputime - t;
	fprintf(sid,'durée d exécution : %d', t);
end

%pause

fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n');
fprintf(sid,'---------------------------------------------------------------------------\n\n');
fprintf(sid,'Algorithme BFGS avec approche et finition\n');
fprintf(sid,'f2(x) = 100*(y-x²)²+(1-x)²\n');
for i=1:1:6
	t = cputime;
	fprintf(sid,'---------------------------------------------------------------------------\n');
	fprintf(sid,'Point initial: [%d, %d]\n',X(i,1),X(i,2));
	if (i==2||i==5||i==6)
		  fprintf(sid,'L algorithme ne marche pas avec ce point, il boucle\n');
	else
		  x =BFGS(Phi, f2, [X(i,1);X(i,2)], ro, c1, c2, Eps, nb_iter, 3);
		  fprintf(sid,'résultat : [%d, %d]\n', x(1,1), x(2,1));
		  fprintf(sid, 'nombre d itérations : %d\n', iter);
		  fprintf(sid,'nombre d évaluations des fonctions : \n\t- f2 : %d\n\t- grad f2 : %d\n\t- Hessienne f2 : %d\n', nfev, ngev, nhev);
		  t = cputime - t;
		  fprintf(sid,'durée d exécution : %d', t);
	end   
	nfev = 0;
	ngev = 0;
	nhev = 0;
	iter = 0;
end

%pause

fclose(sid);

end

