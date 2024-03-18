%% Matriz Jacobiana Robot 3GDL - 3D

function J=J3DL_3D(q1,q2,q3)

    L1=0.1;
    L2=1;
    L3=0.6;
    
    u=L2*cos(q2)+L3*cos(q2+q3);
    
    J11=-u*sin(q1);
    J12=-(L2*sin(q2)+L3*sin(q2+q3))*cos(q1);
    J13=-(L3*sin(q2+q3))*cos(q1);
    
    J21=u*cos(q1);
    J22=-(L2*sin(q2)+L3*sin(q2+q3))*sin(q1);
    J23=-(L3*sin(q2+q3))*sin(q1);
    
    J31=0;
    J32=L2*cos(q2)+L2*cos(q2+q3);
    J33=L3*cos(q2+q3);
    
    J = [J11, J12, J13;
         J21, J22, J23;
         J31, J32, J33];
end