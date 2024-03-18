function [x,z,qy] = CinDir3GDL(q1,q2,q3)

l3 = 0.15;

[xp,zp] = CinDir2GDL(q1,q2)

qy = q1+q2+q3;

x = xp+l3*cos(qy);
z = zp+l3*sin(qy);
