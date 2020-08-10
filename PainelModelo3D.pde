class PainelModelo3D extends Painel {
  
  private PShape shape;
  
  public PainelModelo3D(PApplet parent) {
    super(parent, new Retangulo(
      new Ponto(4, 35),
      new Ponto(480, 475)  
    ));
    
    /*shape = parent.loadShape("/home/gabriel/sketchbook/APP_DRONE/exemplo_modelo_3d/Full_Size_Bed_with_White_Sheets_Black_V1.obj");
    shape.rotate(radians(180), 0, 0, radians(180));
    shape.rotate(radians(-25), radians(-25), 0, 0);
    shape.rotate(radians(60), 0, radians(60), 0);
    shape.translate(40, 30);*/
  }
  
  protected boolean dadosEstaoDisponiveis() {
    return true;
  }
  
  protected void renderizarPainelComDados(Retangulo retangulo) {
    parent.shape(shape, 100, 100, 100, 100);
  }
  
  protected void renderizarPainelVazio(Retangulo retangulo) {
    fill(71, 74, 81);
    quad(retangulo.p1.x, retangulo.p1.y, retangulo.p2.x, retangulo.p1.y, retangulo.p2.x, retangulo.p2.y, retangulo.p1.x, retangulo.p2.y);
    fill(255);
    textSize(40);  
    text("3D Model", width/11, height/3);
    textSize(15);
    text("Aguardando conexão", width/10, height/2.7);
  }
}
