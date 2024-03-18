%% Cinematica Inversa 3GDL 3D

function [q1,q2,q3] = CinInv3GDL_3D(x,y,z)
    
    L1 = 0.1;
    q1 = atan(y/x);
    u = sqrt(x^2+y^2);
    
    [q2,q3]=CinInv2GDL(u,z-L1,0);

end
    