#include <Servo.h>

// Definir pines para cada servo
int servoPin1 = 13;
int servoPin2 = 12;
int servoPin3 = 11;
int servoPin4 = 10;
int servoPin5 = 9;

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

bool figuraDetectada = false;  // Variable que indica si se detectó una figura
bool trayectoriaEjecutada = false;  // Variable que indica si la trayectoria ya se ejecutó

void setup() {
  Serial.begin(9600);

  // Inicializar los servos
  servo1.attach(servoPin1);
  servo2.attach(servoPin2);
  servo3.attach(servoPin3);
  servo4.attach(servoPin4);
  servo5.attach(servoPin5);

  // Posición Gripper
  mover_gripper(0);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);
}

void loop() {
  if (Serial.available() > 0) {
    byte data = Serial.read();  // Cambia char a byte
    Serial.print("Dato recibido: ");
    Serial.println(data);

    if (data == '1') {
      Serial.println("Encendiendo LED TRIANGULO");
      delay(1000);
      
      if (!figuraDetectada && !trayectoriaEjecutada) {
        ejecutar_trayectorias_2();
        figuraDetectada = true;  // Marcar que se detectó una figura
        trayectoriaEjecutada = true;  // Marcar que la trayectoria se ejecutó
        delay(1000);
      }
    } else if (data == '5') {
      Serial.println("Encendiendo LED RECTANGULO");
      delay(1000);

      if (!figuraDetectada && !trayectoriaEjecutada) {
        ejecutar_trayectorias();
        figuraDetectada = true;  // Marcar que se detectó una figura
        trayectoriaEjecutada = true;  // Marcar que la trayectoria se ejecutó
        delay(1000);
      }
    } else if (data == '2') {
      Serial.println("Encendiendo LED CIRCULO");
      delay(1000);
      
      if (!figuraDetectada && !trayectoriaEjecutada) {
        ejecutar_trayectorias_3();
        figuraDetectada = true;  // Marcar que se detectó una figura
        trayectoriaEjecutada = true;  // Marcar que la trayectoria se ejecutó
        delay(1000);
      }
    } else {
      // Restablecer a la posición inicial si no se detecta ninguna figura
      mover_a_posicion(80, 50, 120, 0, 180);
      figuraDetectada = false;  // Reiniciar la variable de detección
      trayectoriaEjecutada = false;  // Reiniciar la variable de la trayectoria
      delay(1000);
    }
  }
}

void ejecutar_trayectorias() {
  // Posición Gripper
  mover_gripper(0);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);

  // Posición Secundario
  mover_a_posicion(80, 160, 150, 120, 180);

  // Posición Tercera
  mover_a_posicion(0, 160, 150, 120, 180);

  // Posición Agarrar
  mover_a_posicion(0, 90, 110, 180, 0);

  // Posición traslado objeto
  mover_a_posicion(0, 50, 110, 180, 180);

  // Subir Objeto
  mover_a_posicion(0, 160, 150, 120, 180);

  // Mover Objeto
  mover_a_posicion(180, 160, 150, 120, 180);

  // Dejar Objeto 1
  mover_a_posicion(180, 90, 110, 180, 180);

  // Dejar Objeto 2
  mover_a_posicion(180, 80, 110, 180, 180);

  // Dejar Objeto 3
  mover_a_posicion(180, 180, 110, 180, 0);

  //Posicición Inicial
  mover_a_posicion(80,160,150, 120,180);

  // Posición Gripper
  mover_gripper(180);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);

}

void ejecutar_trayectorias_2() {
  // Posición Gripper
  mover_gripper(0);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);

  // Posición Secundario
  mover_a_posicion(80, 160, 150, 120, 180);

  // Posición Tercera
  mover_a_posicion(0, 160, 150, 120, 180);

  // Posición Agarrar
  mover_a_posicion(0, 90, 110, 180, 0);

  // Posición traslado objeto
  mover_a_posicion(0, 50, 110, 180, 180);

  // Subir Objeto
  mover_a_posicion(0, 160, 150, 120, 180);

  // Mover Objeto
  mover_a_posicion(180, 160, 150, 120, 180);

  // Dejar Objeto 1
  mover_a_posicion(140, 60, 90, 180, 180); 

  // Dejar Objeto 2
  mover_a_posicion(140, 90, 110, 180, 180); 

  // Dejar Objeto 3
  mover_a_posicion(140, 90, 110, 180, 0);

  //Posicición Inicial
  mover_a_posicion(80,160,150, 120,180);

  // Posición Gripper
  mover_gripper(180);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);
  trayectoriaEjecutada = false;
}


void ejecutar_trayectorias_3() {
  // Posición Gripper
  mover_gripper(0);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);

  // Posición Secundario
  mover_a_posicion(80, 160, 150, 120, 180);

  // Posición Tercera
  mover_a_posicion(0, 160, 150, 120, 180);

  // Posición Agarrar
  mover_a_posicion(0, 90, 110, 180, 0);

  // Posición traslado objeto
  mover_a_posicion(0, 50, 110, 180, 180);

  // Subir Objeto
  mover_a_posicion(0, 160, 150, 120, 180);

  // Mover Objeto
  mover_a_posicion(180, 160, 150, 120, 180);

  // Dejar Objeto 1
  mover_a_posicion(120, 60, 90, 180, 180);

  // Dejar Objeto 2
  mover_a_posicion(120, 80, 90, 180, 180);

  // Dejar Objeto 3
  mover_a_posicion(120, 80, 90, 180, 0);

  //Posicición Inicial
  mover_a_posicion(80,160,150, 120,180);

  // Posición Gripper
  mover_gripper(180);

  // Posición Inicial
  mover_a_posicion(80, 50, 120, 0, 180);
  trayectoriaEjecutada = false;
}

void mover_gripper(int angulo1) {
  servo4.write(angulo1);
  delay(500);  // Puedes ajustar este retardo según sea necesario
}

void mover_a_posicion(int angulo1, int angulo2, int angulo3, int angulo4, int angulo5) {
  int paso = 1; // Define el incremento o decremento en cada paso
  int tiempo_entre_pasos = 10; // Define el tiempo entre cada paso

  int actual1 = servo1.read();
  int actual2 = servo2.read();
  int actual3 = servo3.read();
  int actual4 = servo4.read();
  int actual5 = servo5.read();

  // Interpolación lineal para suavizar el movimiento
  for (int i = 0; i <= 100; i += paso) {
    int pos1 = actual1 + i * (angulo1 - actual1) / 100;
    int pos2 = actual2 + i * (angulo2 - actual2) / 100;
    int pos3 = actual3 + i * (angulo3 - actual3) / 100;
    int pos4 = actual4 + i * (angulo4 - actual4) / 100;
    int pos5 = actual5 + i * (angulo5 - actual5) / 100;

    servo1.write(pos1);
    servo2.write(pos2);
    servo3.write(pos3);
    servo4.write(pos4);
    servo5.write(pos5);

    delay(tiempo_entre_pasos);
  }
}
