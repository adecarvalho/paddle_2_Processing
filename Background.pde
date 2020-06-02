//
class Background
{
  private PImage img_bg=null;


  Background() {
    //
    img_bg= gAssetsManager.getImage("background");
  }

  //
  void render() {

    imageMode(CORNER);
    image(img_bg, 0, 0);
  }
}
//end
