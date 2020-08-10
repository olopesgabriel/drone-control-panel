import javax.swing.*;
import controlP5.*;

public class BarraFerramenta {
  
  private PApplet parent;
  private EscolhedorCamera escolhedorCamera;
  private PainelCamera painelCamera;
  private ControlP5 controlP5;
  
  
  public BarraFerramenta(PApplet parent, EscolhedorCamera escolhedorCamera, PainelCamera painelCamera) {
     this.parent = parent;
     this.escolhedorCamera = escolhedorCamera;
     this.painelCamera = painelCamera;
     this.controlP5 = new ControlP5(parent);
  }
 
  public void renderizar() {
    controlP5
        .addButton("Mudar Camera")
        .setPosition(5, 0)
        .setSize(100, 35)
        .setValue(0)
        .onPress(new CallbackListener() { // a callback function that will be called onPress
          public void controlEvent(CallbackEvent theEvent) {
            escolhedorCamera.escolherCamera();
            painelCamera.inicializarCamera();
          }
        });
  }
}
