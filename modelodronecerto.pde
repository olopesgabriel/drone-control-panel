//sudo chmod a+rw /dev/ttyACM0 (para liberar porta serial arduino)
import processing.video.*;
import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;
  
PImage img;
PFont p;
String data="";
float roll, pitch,yaw;

Serial myPort;

Janela janela;
BarraFerramenta barraFerramentas;
PainelModelo3D painelModelo3D;
dat dadosDrone;
EscolhedorCamera escolhedorCamera;
PainelCamera painelCamera;

void setup(){
  fullScreen(P3D);

  janela = new Janela();
  painelModelo3D = new PainelModelo3D(this);
  dadosDrone = new dat();
  escolhedorCamera = new EscolhedorCamera();
  painelCamera = new PainelCamera(this, escolhedorCamera);
  barraFerramentas = new BarraFerramenta(this, escolhedorCamera, painelCamera);
  p = createFont("Azonix", 50);
  img = loadImage("logoapp.png");
  
  barraFerramentas.renderizar();
}

void draw(){
    janela.renderizar();
    painelModelo3D.renderizar();
    dadosDrone.Data();
    painelCamera.renderizar();
    
    //beginCamera();
    //endCamera();
}
class dat {
  //estrutura dados do drone
  void Data(){
    fill(71, 74, 81);
    quad(4,480, 480,480, 480,height-4, 4,height-4);
    fill(255);
    textSize(40);
    text("Data", width/8, height-150);
    textSize(15);
    text("Aguardando conexão", width/10, height-120);
  }
}

void serialEvent (Serial myPort) { 
  
  myPort = new Serial(this, "/dev/ttyACM0", 9600);
  myPort.bufferUntil('A');
  
  data = myPort.readStringUntil('A');
  if (data != null) {
    data = trim(data);
    String items[] = split(data, '/');
    if (items.length > 1) {  
      roll = float(items[0]);
      pitch = float(items[1]);
      yaw = float(items[2]);
    }
  }
}

void rotacaodrone(){
    rotateX(radians(-pitch));
    rotateZ(radians(roll));
    rotateY(radians(yaw));
}
