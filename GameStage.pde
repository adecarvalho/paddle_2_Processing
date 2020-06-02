
class GameStage extends ez2_Stage
{

  private Background bg=null;
  private  Paddle paddle=null;
  private  Ball ball=null;
  private  Matrice matrice=null;

  private  ez2_ScoreManager score=null;

  //sounds
  private AudioSample spawn=null;
  private AudioSample explosion=null;
  private AudioSample bump=null;


  //
  GameStage(int screenWidth, int screenHeight)
  {
    super(screenWidth, screenHeight);

    bg=new Background();

    score= new ez2_ScoreManager("fonts/brick.ttf", color(255, 161, 31));

    paddle= new Paddle(screenWidth, screenHeight);

    ball= new Ball(screenWidth, screenHeight, this.paddle);

    matrice= new Matrice();

    score.setPoints(0);
    
    score.setLives(3);
    //
    explosion= gAssetsManager.getSound("explosion");
    spawn= gAssetsManager.getSound("spawn");
    bump= gAssetsManager.getSound("bump");
  }

  //
  void input()
  {
    //paddle
    if (gInputManager.isKeyPressed(LEFT))
    {
      paddle.move(Paddle.MOVE_LEFT);
    }
    //
    else if (gInputManager.isKeyPressed(RIGHT))
    {
      paddle.move(Paddle.MOVE_RIGHT);
    }
    //
    if (gInputManager.isKeyReleased(LEFT) || gInputManager.isKeyReleased(RIGHT))
    {
      paddle.stop();
    }

    //ball
    if (gInputManager.isKeyPressed(32))
    {
      ball.setMove();
    }
  }

  //
  void update(float dt)
  {
    input();

    if (score.isGameOver()==true)
    {
      StringDict msg= new StringDict();
      msg.set("NAME", ""+score.getName());
      msg.set("SCORE", ""+score.getPoints());

      gStageManager.changeStage(new ConcluStage(screenWidth, screenHeight), msg);
    }

    paddle.update(dt);

    ball.update(dt);

    //ball collide paddle
    if (ball.isCollidePaddle())
    {
      bump.stop();
      bump.trigger();
    }

    //ball lost
    if (ball.getState()== Ball.STATE_LOST)
    {
      spawn.stop();
      spawn.trigger();
      
      ball.setState(Ball.STATE_LOCKED);
      
      score.decrementLives();
    }

    //ball collide matrice
    if (matrice.isCollideBall(ball))
    {
      explosion.stop();
      explosion.trigger();
      
      ball.removeX();
      ball.removeY();
      
      score.incrementPoints(1);
    }
    //
    if (matrice.isAllDestroy())
    {
      spawn.stop();
      spawn.trigger();
      
      ball.setState(Ball.STATE_LOCKED);
    }
  }

  //
  void render()
  {
    bg.render();

    paddle.render();

    ball.render();

    matrice.render();

    score.render();
  }

  //
  void onEnter(StringDict message)
  {
    if (message != null && message.size()>0)
    {
      score.setName(message.get("NAME"));
    }
    //
    if (gMusicPlayer!= null)
    {
      gMusicPlayer.load("musics/song.mp3");
      gMusicPlayer.loop();
    }
  }

  //
  void onExit()
  {
    if (gMusicPlayer!= null)
    {
      gMusicPlayer.pause();
    }
  }
}
//end
