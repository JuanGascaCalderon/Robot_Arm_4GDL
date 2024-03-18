%% Crear una conexión con Arduino
a = arduino('COM5', 'Mega2560'); % Reemplaza 'COMxx' con el puerto COM correcto

% Definir los pines de los servos
servoPin1 = 'D13';  % Cambia 'D9' al número del pin correspondiente
servoPin2 = 'D12'; % Cambia 'D10' al número del pin correspondiente
servoPin3 = 'D11'; % Cambia 'D11' al número del pin correspondiente
servoPin4 = 'D10'; % Cambia 'D12' al número del pin correspondiente

% Crear objetos para los servos
servo1 = servo(a, servoPin1);
servo2 = servo(a, servoPin2);
servo3 = servo(a, servoPin3);
servo4 = servo(a, servoPin4);

%% Creacion del robot 
%Creacion matriz homogenea
L(1) = Revolute('d', 9.5, 'a', 0, 'alpha', pi/2);
L(2) = Revolute('d', 0, 'a', 10.5, 'alpha', 0);
L(3) = Revolute('d', 0, 'a', 9.8, 'alpha', 0);
L(4) = Revolute('d', 0, 'a', 15.5, 'alpha', 0);
R4D = SerialLink(L);

% ...

% Especificar una pose deseada para el robot
desiredPosition = [5 5 10]; % Cambia estos valores según tu caso
desiredOrientation = [0 0 0]; % Sin rotación en los ejes x, y, y z

desiredPose = transl(desiredPosition) * trotx(desiredOrientation(1)) * troty(desiredOrientation(2)) * trotz(desiredOrientation(3));

% Calcular las posiciones articulares usando cinemática inversa en grados
jointAngles_deg = R4D.ikine(desiredPose, 'mask', [1 1 1 0 0 0], 'degrees');

% Convertir las posiciones articulares a radianes
jointAngles_rad = deg2rad(jointAngles_deg);

% Visualizar el robot en la pose deseada
R4D.plot(jointAngles_rad);

% Mover los servos a las posiciones calculadas
writePosition(servo1, jointAngles_rad(1));
writePosition(servo2, jointAngles_rad(2));
writePosition(servo3, jointAngles_rad(3));
% servo4 no se utiliza en la cinemática inversa ya que es de revolución pura



%% AJUSTES
%Creacion robot
% R4D.plot([0 0 0 0]);
% %R4D.plot([25 10 -5 35]*pi/180);
% %Cinematica Directa con splinecub1
% tf = 5; 
% n = 50; 
% [q1,w1,a1,t]=splinecub(0,0*pi/180,tf,n);
% [q2,w2,a2,t]=splinecub(0,120*pi/180,tf,n);
% [q3,w3,a3,t]=splinecub(0,-100*pi/180,tf,n);
% [q4,w4,a4,t]=splinecub(0,90*pi/180,tf,n);
% R4D.plot([q1' q2' q3' q4']);
% % R4D.plot([q1 q2 q3 q4]);
% 
% % Modelo cinematico directo 
% % A= R4D.fkine([0 120 -100 90]*pi/180);
%  
%  
% %% Punto de Inicio
% % Define las coordenadas del punto en el espacio
% x_punto = 35.8; % Cambia las coordenadas según tus necesidades
% y_punto = 0; % Cambia las coordenadas según tus necesidades
% z_punto = 10; % Cambia las coordenadas según tus necesidades
% % Visualización del punto en el espacio
% hold on
% plot3(x_punto, y_punto, z_punto, '*k'); % 'og' representa un punto verde
% 
%  %% Punto de Final - Cuadrado
%  % Define las coordenadas del punto en el espacio
% x_c = 35.8; % Cambia las coordenadas según tus necesidades
% y_c = 0; % Cambia las coordenadas según tus necesidades
% z_c = 10; % Cambia las coordenadas según tus necesidades
% % Visualización del punto en el espacio
% hold on
% plot3(x_c, y_c, z_c, '*b'); % 'og' representa un punto verde
% 
%  %% Punto de Final - Rectangulo
%  % Define las coordenadas del punto en el espacio
% x_r = 0.2; % Cambia las coordenadas según tus necesidades
% y_r = 0.1; % Cambia las coordenadas según tus necesidades
% z_r = 0.2; % Cambia las coordenadas según tus necesidades
% % Visualización del punto en el espacio
% hold on
% plot3(x_r, y_r, z_r, '*g'); % 'og' representa un punto verde
% 
% 
%  %% Punto de Final - Circulo
%  % Define las coordenadas del punto en el espacio
% x_d = 0.22; % Cambia las coordenadas según tus necesidades
% y_d = 0.1; % Cambia las coordenadas según tus necesidades
% z_d = 0.2; % Cambia las coordenadas según tus necesidades
% % Visualización del punto en el espacio
% hold on
% plot3(x_d, y_d, z_d, '*c'); % 'og' representa un punto verde
% 
% %% Mostrar Trayectoria
% hold on
% plot3(x_intermedias, y_intermedias, z_intermedias, 'or');

