# OptiNum

**Implementation and tests of optimisation (minimisation) methods in matlab**

#Structure
* *f1.m* and *f2.m* contain the numerical functions used in the tests (we'll need their value, hessian matrix and gradient):
  * f1(x, y) = 2(x + y − 2)² + (x − y)²,
  * f2(x, y) = 100(y − x2 )² + (1 − x)²
* *equation_degre_2.m*, *lagrangien.m* and *Phi.m* contain sub functions,
* *test.m* and *testParametre.m* contain the tests of the functions,
* other files contain all optimisation methods.

#Optimisation methods
##Optimisation without constraints
We focus on 2 methods of descent which are linear research algorithm to solve constraint (minimisation) problems:
* Newton Method: *algo_newton.m*,
* Quasi-Newton method (variant of the first with no calculus of the Hessian matrix): *BFGS.m*.

These two methods require the calculus of a step with direction and length. The latter can be done by:
* backtracking: *backtracking.m*,
* bisection: *bisection.m*,
* interpolation: *interpolation.m*,
* approche: *approche.m*,
* finition: *finition.m*

##Optimisation under constraints
* Augmented Lagrangian method: *lagrangienAugmente.m*

**For more details, see OptiNum.pdf (in french)**
