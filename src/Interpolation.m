function resultat = Interpolation(f, Phi, xk, dk, s0, c1, nb_iter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Applique l'algorithme BFGS a f et retourne la solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entree - Phi         :  f(x + s*d)
% Entree - f           :  fonction du probleme
% Entree - xk          :  position au moment du calcul
% Entree - dk          :  direction de descente
% Entree - s0          :  pas de descente initial
% Entree - nb_iter     :  nombre maximum d'itération
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation des données
function y=phi(s)
    y=feval(f,xk+s*dk,1);
end
function y=dphi(s)
        y=feval(f,xk+s*dk,3)'*dk;
end  
fin=false;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Newton local %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (phi(s0)> phi(0)+c1*s0*dphi(0))
    s1=-dphi(0)*s0^2/(2*(phi(s0)-phi(0)-s0*dphi(0)));
        if (s1>1)
            s1=0.9;
        end
    if (phi(s1)>phi(0)+c1*s1*dphi(0))
        while(~fin)
            a=(s0^2*(phi(s1)-phi(0)-s1*dphi(0))-s1^2*(phi(s0)-phi(0)-s0*dphi(0)))/(s0^2*s1^2*(s1-s0));
            b=(-s0^3*(phi(s1)-phi(0)-s1*dphi(0))+s1^3*(phi(s0)-phi(0)-s0*dphi(0)))/(s0^2*s1^2*(s1-s0));
            x1=(-b+sqrt(b^2-3*a*dphi(0)))/(3*a);
            x2=(-b-sqrt(b^2-3*a*dphi(0)))/(3*a);
            if (imag(x1)==0)
                
                if (a*x1^3+b*x1^2+dphi(0)*x1<a*x2^3+b*x2^2+dphi(0)*x2)
                    s2=x1;
                else
                    s2=x2;
                end
            else
                s2=1;
            end
            if (s2>=s1)
                s2=s1/2;
            end
            if (phi(s2)>phi(0)+c1*s2*dphi(0))
                s0=s1;
                s1=s2;
            else
                s=s2;
                fin=true;
            end
        end
    else
        s=s1;
    end
else
    s=s0;
end

resultat=s;

end
%%%%%%%%%%%%8)%%%%%%%%%%%%%%%%  (fin) %%%%%%%%%%%%%%%%%%%%%%%

