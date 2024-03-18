% Solicitar al usuario que ingrese el tipo de figura
tipo_figura = input('Ingrese el tipo de figura (cuadrado, rectangulo o circulo): ', 's');

% Definir los puntos iniciales y finales en función del tipo de figura
if strcmp(tipo_figura, 'cuadrado')
    x_inicial = 0.2;
    y_inicial = -0.1;
    z_inicial = 0;

    x_final = 0.18;
    y_final = 0.1;
    z_final = 0.2;
elseif strcmp(tipo_figura, 'rectangulo')
    x_inicial = 0.2;
    y_inicial = -0.1;
    z_inicial = 0;

    x_final = 0.2;
    y_final = 0.1;
    z_final = 0.2;
elseif strcmp(tipo_figura, 'circulo')
    x_inicial = 0.2;
    y_inicial = -0.1;
    z_inicial = 0;

    x_final = 0.22;
    y_final = 0.1;
    z_final = 0.2;
else
    error('Tipo de figura no válido. Debe ser cuadrado, rectangulo o circulo.');
end

% Número de puntos intermedios
n = 40;

% Calcular coordenadas intermedias
x_intermedias = linspace(x_inicial, x_final, n);
y_intermedias = linspace(y_inicial, y_final, n);
z_intermedias = linspace(z_inicial, z_final, n);

% Cinemática inversa y cálculo de articulaciones
q1 = zeros(1, n);
q2 = zeros(1, n);
q3 = zeros(1, n);
q4 = zeros(1, n);

for i = 1:n
    [q1(i), q2(i), q3(i), q4(i)] = CinInv4GDL_3D(x_intermedias(i), y_intermedias(i), z_intermedias(i), 0, 0);
end

% Visualización de la trayectoria lineal
figure;
hold on;
plot3(x_intermedias, y_intermedias, z_intermedias, 'or');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Trayectoria Lineal del Robot');


