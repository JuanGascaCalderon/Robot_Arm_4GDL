
%% Velocidades Angulares

n = 40;
Tf = 5;
dt =  Tf/(n-1);
t = 0:dt:Tf;
m = pi/Tf;
b = -pi/2;
theta =  m*t+b;
R = 0.4;

vx = zeros(1,n);
vy = R*m*((-2*theta)/2 + 4*theta.^3/factorial(4));
vz = R*m*((-3*theta).^2/factorial(3) + 5*theta.^4/factorial(5));

for i=1:n
    
    J=J3DL_3D(q1J(i), q2J(i), q3J(i));
    V = [vx(i),vy(i),vz(i)]';
    
    W = inv(J)*V;
    
    w1(i) = W(1);
    w2(i) = W(2);
    w3(i) = W(3);
    
end

figure(5),plot(t,w1),title('Velocidad Angular w1'), xlabel('tiempo (s)')
figure(4),plot(t,w2),title('Velocidad Angular w2'), xlabel('tiempo (s)')
figure(6),plot(t,w3),title('Velocidad Angular w3'), xlabel('tiempo (s)')

figure(7),plot(t,vx),title('Velocidad vx'), xlabel('tiempo (s)')
figure(8),plot(t,vy),title('Velocidad vy'), xlabel('tiempo (s)')
figure(9),plot(t,vz),title('Velocidad vz'), xlabel('tiempo (s)')