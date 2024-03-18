function [q1,q2,q3] = CinInv3GDL(x,z,qy,codo)

l3 = 0.15;

xp = x - l3 * cos(qy);
zp = z - l3 * sin(qy);

[q1,q2] = CinInv2GDL(xp,zp,codo);

q3 = qy-q1-q2;

q1 = (q1 * pi)/180;
q2 = (q2 *pi)/180;
q3 = (q3 * pi)/180;
