%% Espacio de trabajo Robot 3GDL 3D

%% Limite Exterior
% Caso q1=0
q1=0;

n=40;
dq2=pi/(n-1);

q2=0:dq2:pi;
q3=0;

for i=1:n
    
    [x_le(i),y_le(i),z_le(i)]=CinDir3GDL_3D(q1,q2(i),q3);
    
end

figure,scatter3(x_le,y_le,z_le, 'r')
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Espacio de Trabajo del Robot 3GDL');
%% Esfera

xc=0.75;
zc=0.4;
dtheta=2*pi/(n-1);
theta=0:dtheta:2*pi;
R=0.4;

x=xc+R*cos(theta);
z=zc+0.1+R*sin(theta);
y=zeros(1,n);

hold on 
scatter3(x,y,z,'k') 

