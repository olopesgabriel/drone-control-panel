import javax.swing.*;

class EscolhedorCamera {
  
  private int cameraEscolhida = 0;
  
  public String obterCameraEscolhida() {
    return Capture.list()[cameraEscolhida];
  }
  
  public void escolherCamera() {
    String[] cameras = Capture.list();
    if (cameras.length == 0) {
      println("There are no cameras available for capture  .");
      exit();
    }
    
    int numeroCameraEscolhida = -1;
    while (numeroCameraEscolhida == -1) {
      numeroCameraEscolhida = pedirParaUsuarioEscolherCamera();
    }
    if (numeroCameraEscolhida > 0) {
      cameraEscolhida = numeroCameraEscolhida;
    }
  }
  
  private int pedirParaUsuarioEscolherCamera() {
    JFrame frame = new JFrame("Escolher câmera");

    String[] cameras = Capture.list();
    StringBuilder stringBuilder = new StringBuilder();
    
    for (int i = 0; i < cameras.length; i++) {
      stringBuilder.append(i);
      stringBuilder.append(") ");
      stringBuilder.append(cameras[i]);
      stringBuilder.append("\n");
    }

    String opcaoSelecionada = JOptionPane.showInputDialog(frame,
        "Escolha uma câmera abaixo:\n\n" + stringBuilder.toString(),
        "Encontramos mais de uma câmera",
        JOptionPane.QUESTION_MESSAGE);
        
        
    if (opcaoSelecionada == null) {
      return -2;
    }
    
    try {
      int cameraEscolhida = Integer.parseInt(opcaoSelecionada);
      if (cameraEscolhida < 0 || cameraEscolhida >= cameras.length) {
        return -1;
      }
      
      return cameraEscolhida;
    } catch (Exception ex) {
      return -1;
    }
  }
}
