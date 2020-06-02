//
class Paddle extends ez2_Entity
{
  private float speedModule;

  public static final int MOVE_LEFT=10;
  public static final int MOVE_RIGHT=20;

  private int  screenWidth=0;
  private int screenHeight=0;


  //
  Paddle(int screenWidth, int screenHeight) {
    //
    super(screenWidth/2, screenHeight-50, gAssetsManager.getImage("paddle"));

    this.screenWidth= screenWidth;
    this.screenHeight= screenHeight;

    speedModule=350;
  }

  //
  void update(float dt) {

    super.update(dt);

    //edges
    if (getLeft() <0)
    {
      setLeft(0);
    }
    //
    if (getRight() > screenWidth)
    {
      setRight(screenWidth);
    }
  }

  //
  void move(int direction) {
    //
    if (direction==Paddle.MOVE_LEFT)
    {
      setSpeeds(-speedModule, 0);
    } 
    //
    else if (direction==Paddle.MOVE_RIGHT)
    {
      setSpeeds(speedModule, 0);
    }
  }

  //
  void stop() {
    setSpeeds(0, 0);
  }
  //
  void render() {
    super.render();
    super.renderDebug();
  }
}
