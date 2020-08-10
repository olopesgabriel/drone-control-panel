import processing.core.PApplet;

public abstract class Painel {
  
    protected PApplet parent;
    protected Retangulo retangulo;
    
    public Painel(PApplet parent, Retangulo retangulo) {
      this.parent = parent;
      this.retangulo = retangulo;
    }
    
    public void renderizar() {
      if (dadosEstaoDisponiveis()) {
        renderizarPainelComDados(retangulo);
      } else {
        renderizarPainelVazio(retangulo);
      }
    }
    
    protected abstract boolean dadosEstaoDisponiveis();
    protected abstract void renderizarPainelComDados(Retangulo retangulo);
    protected abstract void renderizarPainelVazio(Retangulo retangulo);
}
