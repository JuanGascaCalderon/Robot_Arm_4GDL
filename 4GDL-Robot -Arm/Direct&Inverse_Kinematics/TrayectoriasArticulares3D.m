%% Trayectorias Articulares

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

%% Trayectoria Articular
for i=1:n
    [q1J(i),q2J(i),q3J(i)]=CinInv3GDL_3D(xJ(i),yJ(i),zJ(i));
end

Tf = 5;
dt = Tf/(n-1);
t = 0:dt:Tf;
    
figure(4),plot(t,q1J),title('Articulación q1 (°)'), xlabel('tiempo (s)')
figure(5),plot(t,q2J),title('Articulación q2 (°)'), xlabel('tiempo (s)')
figure(6),plot(t,q3J),title('Articulación q3 (°)'), xlabel('tiempo (s)')