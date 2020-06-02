//
class Bloc extends ez2_Entity {

  static final int BLOC_WIDTH=50;
  static final int BLOC_HEIGHT=25;

  static final int STATE_VISIBLE=10;
  static final int STATE_TOUCHED=20;

  static final int BLOC_TYPE_BLUE=100;
  static final int BLOC_TYPE_RED=200;
  static final int BLOC_TYPE_GREEN=300;
  static final int BLOC_TYPE_YELLOW=400;

  //
  Bloc(float px, float py, int type)
  {
    super(px, py, BLOC_WIDTH, BLOC_HEIGHT);

    setState(Bloc.STATE_VISIBLE);

    switch(type)
    {
      //
    case Bloc.BLOC_TYPE_BLUE:
      setImage(gAssetsManager.getImage("bloc_blue"));
      break;

      //
    case Bloc.BLOC_TYPE_RED:
      setImage(gAssetsManager.getImage("bloc_red"));
      break;

      //
    case Bloc.BLOC_TYPE_GREEN:
      setImage(gAssetsManager.getImage("bloc_green"));
      break;

      //yellow
    case Bloc.BLOC_TYPE_YELLOW:
      setImage(gAssetsManager.getImage("bloc_yellow"));
      break;

    default:
      setImage(gAssetsManager.getImage("bloc_blue"));
      break;
    }
    //
    inflate(5,5);
  }

  //
  void touched()
  {
    setState(Bloc.STATE_TOUCHED);
  }

  //
  void update(float dt)
  {
    super.update(dt);
  }

  //
  void render()
  {
    if (getState()==Bloc.STATE_VISIBLE)
    {
      super.render();
      super.renderDebug();
    }
  }
}
//end class
