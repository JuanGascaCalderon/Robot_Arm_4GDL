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
yc = 0.2;   % Nueva coordenada Y del centro

n = 40;

dtheta = pi / (n - 1); % Dividir la semicircunferencia en n-1 segmentos
% Calcular los ángulos para la semicircunferencia
theta = -pi/2:dtheta:pi/2; % Rango de ángulos para la semicircunferencia vertical
R = 0.4;

% Cálculo de las coordenadas de la esfera de frente
xJ = xc * ones(1, length(theta)); % Coordenada Y constante
yJ = yc + R * cos(theta);
zJ = zc + R * sin(theta);

hold on
plot3(xJ,yJ,zJ,'or')

%% Comprobación semi esfera con cinematica directa
for i=1:n
    [x_test(i),y_test(i),z_test(i)]=CinDir3GDL_3D(q1J(i),q2J(i),q3J(i));
end
hold on
plot3(x_test,y_test,z_test,'*k');







