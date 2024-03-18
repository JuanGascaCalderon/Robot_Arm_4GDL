function [x,z] = CinDir2GDL(q1,q2)



l1 = 2.5;
l2 = 1.5;

x = l1*cos(q1)+l2*cos(q1+q2);
z = l1*sin(q1) + l2*sin(q1+q2);