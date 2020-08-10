import java.awt.image.*;
import javax.imageio.*;
import java.io.*;

class PainelCamera extends Painel {
  
  private Capture video;
  private boolean temWebcamDisponivel;
  private EscolhedorCamera escolhedorCamera;
  
  public PainelCamera(PApplet parent, EscolhedorCamera escolhedorCamera) {
    super(parent, new Retangulo(
      new Ponto(485, 35),
      new Ponto(parent.width-5, parent.height-5)
    ));
    
    this.escolhedorCamera = escolhedorCamera;
    
    if (temCamera()) {
      inicializarCamera();
      temWebcamDisponivel = true;
    } else {
      temWebcamDisponivel = false;
    }
  }
  
  public void inicializarCamera() {
    if (video != null) {
      video.stop();
    }
    
    video = criarCapture();
    video.start();
  }
  
  private Capture criarCapture() {
    return new Capture(parent, retangulo.obterLargura() , retangulo.obterAltura(), escolhedorCamera.obterCameraEscolhida());
  }
  
  protected boolean dadosEstaoDisponiveis() {
    return temWebcamDisponivel;
  }
  
  private boolean temCamera() {
    String[] cameras = Capture.list();
    return cameras.length > 0;
  }
  
  protected void renderizarPainelComDados(Retangulo retangulo) {
    if (video.available()) {
      video.read();
      //byte[] imageBytes = converterUltimoFrameEmBytes();
    }
    image(video, retangulo.p1.x, retangulo.p1.y, retangulo.obterLargura(), retangulo.obterAltura());
  }
  
  private byte[] converterUltimoFrameEmBytes() {
    try {
      BufferedImage image = (BufferedImage) video.getImage();
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      ImageIO.write(image, "jpeg", baos);
      baos.flush();
      return baos.toByteArray();
    } catch (IOException ex) {
      return new byte[0];
    }
  }
  
  protected void renderizarPainelVazio(Retangulo retangulo) {
    fill(255);
    textSize(50);
    text("Camera", width-570, height/2);
    textSize(15);
    text("Aguardando conexão com drone", width-605, 415);
    
    renderizarCubos();
  }
  
  private void renderizarCubos() {
    translate(width/2, height/2);
 
    pushMatrix();
    translate(220, 80, 40);
    rotateX(frameCount*PI/200);
    rotateY(frameCount*PI/300);
    stroke(255);
    noFill();
    box(40,40,40);
    popMatrix();
  
    pushMatrix();
    translate(220, 80, 40);
    rotateX(frameCount*PI/-200);
    rotateY(frameCount*PI/200);
    stroke(255);
    noFill();
    box(20,20,20);
    popMatrix();   
  }
  
}
