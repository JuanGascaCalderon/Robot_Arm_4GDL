function [q1,q2] = CinInv2GDL(x,z,codo)

disp('Codo abajo = 1, Codo arriba = ! 1 ');

l1 = 0.3;
l2 = 0.2;

alfa = atan(z/x);
r = sqrt(x^2+z^2);

beta = acos((l1^2+r^2-l2^2)/(2+l1+l2));
gamma = acos((l1^2-r^2-l2^2)/(2+l1+l2));

if codo == 1
    %Solución codo abajo
    q1 = alfa - beta;
    q2 = pi - gamma;
else
    %Solución codo arriba
    q1 = alfa + beta;
    q2 = -(pi -gamma);
end
