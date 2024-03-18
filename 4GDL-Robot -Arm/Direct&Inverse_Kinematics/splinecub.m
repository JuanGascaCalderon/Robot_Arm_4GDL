function [f,vf,af,t] = splinecub(fa,fb,Tf,n)
    % Matriz A para el sistema de ecuaciones
    A = [0      0    0  1;
         Tf^3   Tf^2 Tf 1;
         0      0    1  0;
         3*Tf^2 2*Tf 1  0];

    % Matriz B para el lado derecho del sistema de ecuaciones
    B = [fa;
         fb;
         0;
         0];

    % Resuelve el sistema de ecuaciones para encontrar los coeficientes
    X = inv(A) * B;

    % Calcula el paso entre los puntos de evaluación
    dt = Tf / (n - 1);
    
    % Genera el vector de puntos de evaluación
    t = 0:dt:Tf;

    % Calcula los valores de la función, primera y segunda derivada
    f = X(1) * t.^3 + X(2) * t.^2 + X(3) * t + X(4);
    vf = 3 * X(1) * t.^2 + 2 * X(2) * t + X(3);
    af = 6 * X(1) * t + 2 * X(2);

%     % Graficar la función
%     figure;
%     subplot(3,1,1);
%     plot(t, f, 'b');
%     title('Spline Cúbico - Función');
%     xlabel('Tiempo');
%     ylabel('f(t)');
%     
%     % Graficar la primera derivada
%     subplot(3,1,2);
%     plot(t, vf, 'g');
%     title('Spline Cúbico - Primera Derivada (VELOCIDAD)');
%     xlabel('Tiempo');
%     ylabel('f''(t)');
%     
%     % Graficar la segunda derivada
%     subplot(3,1,3);
%     plot(t, af, 'r');
%     title('Spline Cúbico - Segunda Derivada (ACELERACIÓN)');
%     xlabel('Tiempo');
%     ylabel('f''''(t)');
end



