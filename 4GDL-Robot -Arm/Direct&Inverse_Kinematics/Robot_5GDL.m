%% Creacion del robot 
%Creacion matriz homogenea
L(1) = Revolute('d', 0.36, 'a', 0, 'alpha', pi/2);
L(2) = Revolute('d', 0, 'a', -0.32, 'alpha', 0);
L(3) = Revolute('d', 0.55, 'a', 0, 'alpha', 0); 
L(4) = Revolute('d', 0.27, 'a', 0, 'alpha', pi/2);
L(5) = Revolute('d', 0, 'a', 0.27, 'alpha', 0);

% Conectar el último eslabón al cuarto
L(4).qlim = [-pi, pi];
L(5).qlim = [-pi, pi];

robot = SerialLink(L);
robot.plot([0, -pi/2, 0, 0, pi/2]);


R5D = SerialLink(L);
%Creacion robot
R5D.plot([0 -pi/2 0 0 pi/2]);