%% Cinematica Directa Robot 3GDL 3D

function [x,y,z] = CinDir3GDL_3D(q1,q2,q3)

    L1 = 0.1;
    L2 = 1;
    L3 = 0.6;
    u = L2*cos(q2)+L2*cos(q2+q3);
    
    x = u*cos(q1);
    y = u*sin(q1);
    z = L1+L2*sin(q2)+L3*sin(q2+q3);

end