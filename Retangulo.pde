public class Retangulo {

  public Ponto p1;
  public Ponto p2;
  
  public Retangulo(Ponto p1, Ponto p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  public int obterLargura() {
    return p2.x - p1.x;
  }
  
  public int obterAltura() {
    return p2.y - p1.y;
  }

}

public class Ponto {
  
  public int x;
  public int y;
  
  public Ponto(int x, int y) {
    this.x = x;
    this.y = y;
  }
}
