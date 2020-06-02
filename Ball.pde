
class Ball extends ez2_Entity
{
  private final float speedMin=200.0;
  private final float speedMax=300.0;

  private int screenWidth=0;
  private int screenHeight=0;

  public static final int STATE_LOCKED=100;
  public static final int STATE_MOVE=110;
  public static final int STATE_LOST=120;

  private Paddle paddle=null;
  private float speedModule=0;


  Ball(int screenWidth, int screenHeight, Paddle paddle)
  {
    //
    super(paddle.getCenterX(), paddle.getBottom(), gAssetsManager.getImage("ball"));

    this.screenWidth=screenWidth;
    this.screenHeight= screenHeight;

    this.paddle=paddle;

    setSpeeds(0, 0);
    inflate(2, 2);

    setState(Ball.STATE_LOCKED);
    speedModule= random(speedMin, speedMax);
  }

  //
  float newSpeed()
  {
    return random(speedMin, speedMax);
  }

  //
  void setMove()
  {
    if (this.getState()==Ball.STATE_LOCKED)
    {
      this.setState(Ball.STATE_MOVE);

      setSpeedX(newSpeed());

      setSpeedY(newSpeed());
    }
  }

  //
  void removeX()
  {
    float dx= getSpeedX();

    float sp= newSpeed();

    if (dx >0)
    {
      sp=sp*(-1.0);
      setSpeedX(sp);
    } else
    {
      setSpeedX(sp);
    }
  }

  //
  void removeY()
  {
    float dy= getSpeedY();

    float sp= newSpeed();

    if (dy >0)
    {
      sp=sp*-1.0;

      setSpeedY(sp);
    } else
    {
      setSpeedY(sp);
    }
  }

  //
  void bump()
  {
    float dx= getSpeedX();
    float dy=getSpeedY();

    float x= getCenterX() - paddle.getCenterX();
    float w= paddle.getWidth();
    float angle=-(3*PI*x)/(4*w)+(PI/2);

    speedModule= sqrt(dx*dx+dy*dy);

    dx=speedModule*cos(angle);
    dy=-speedModule*sin(angle);

    setSpeeds(dx, dy);
  }

  //
  boolean isCollidePaddle()
  {
    if (this.paddle!= null)
    {
      if (this.isCollide(this.paddle) && getSpeedY()>0)
      {
        bump();
        return true;
      }
    }
    return false;
  }

  //
  void update(float dt)
  {
     super.update(dt);
     
    //locked
    if (getState()==Ball.STATE_LOCKED)
    {
      setBottom(this.paddle.getTop());
      setCenterX(this.paddle.getCenterX());
      setSpeeds(0,0);
    }


    //edges
    if (getTop() <0 && getSpeedY() <0)
    {
      removeY();
    } 
    //
    else if (getLeft() <0 && getSpeedX() <0)
    {
      removeX();
    } 
    //
    else if (getRight() > screenWidth && getSpeedX() >0)
    {
      removeX();
    } 
    //
    else if (getBottom() > screenHeight && getSpeedY() >0)
    {
      this.setState(Ball.STATE_LOST);
    }
    //
   
  }

  //
  void render()
  {
    super.render();

    //super.renderDebug();
  }
}
//end ball
