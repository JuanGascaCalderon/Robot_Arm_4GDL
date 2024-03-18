%% Espacio de Trabajo 3GDL 3D
%% Limite Exterior
% Caso q1 = 0
q1 = 0;
n=40;
dq2=pi/(n-1);
q2=0:dq2:pi;
q3=0;
n_q1 = 40; % Número de puntos para q1
q1_range = linspace(0, pi, n_q1);

% Inicializar matrices para almacenar las coordenadas (x, y, z) del espacio de trabajo
x_workspace = [];
y_workspace = [];
z_workspace = [];

for i = 1:n_q1
        q1 = q1_range(i);
        for i=1:n
            [x_le(i),y_le(i),z_le(i)] = CinDir3GDL_3D(q1,q2(i),q3);
        end     
        % Almacenar las coordenadas en las matrices de espacio de trabajo
        x_workspace = [x_workspace, x_le];
        y_workspace = [y_workspace, y_le];
        z_workspace = [z_workspace, z_le];
end
plot3(x_workspace,y_workspace,z_workspace)
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Espacio de Trabajo del Robot 3GDL');


%% Esfera perfil

xc = 0.75;
zc = 0.4;
dtheta = 2*pi/(n-1);
theta = 0:dtheta:2*pi;
R = 0.4;

x=xc+R*cos(theta);
z=zc+0.3+R*sin(theta);
y = zeros(1,n);
hold on
plot3(x,y,z,'r')

