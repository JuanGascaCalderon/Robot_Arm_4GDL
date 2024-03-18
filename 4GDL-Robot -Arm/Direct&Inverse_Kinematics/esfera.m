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

for i=1:n
    [q1(i),q2(i),q3(i),q4(i)] = CinInv4GDL_3D(xJ(i),yJ(i),zJ(i),0,0)
end


hold on
plot3(xJ,yJ,zJ,'*r')