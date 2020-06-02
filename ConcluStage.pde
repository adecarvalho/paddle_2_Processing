class ConcluStage extends ez2_Stage
{

  private PImage bkg=null;

  private ez2_Label labelEnter=null;
  private ez2_Label labelExit=null;
  private ez2_Label labelPoints=null;

  //
  ConcluStage(int screenWidth, int screenHeight)
  {
    super(screenWidth, screenHeight);

    bkg= gAssetsManager.getImage("bkg_gameOver");

    labelEnter= new ez2_Label(gAssetsManager.getFont("free_30"));
    labelEnter.setColorText(color(255, 172, 30));
    labelEnter.setText("Press Enter > play");

    labelExit= new ez2_Label(gAssetsManager.getFont("free_30"));
    labelExit.setColorText(color(255, 172, 30));
    labelExit.setText("Press Esc > exit");

    labelPoints= new ez2_Label(gAssetsManager.getFont("free_30"));
    labelPoints.setColorText(color(255, 161, 31));
    labelPoints.setText("Points:?");
  }

  //
  void update(float dt)
  {
    if (gInputManager.isKeyPressed(ENTER))
    {
      gStageManager.changeStage(new IntroStage(screenWidth, screenHeight), null);
    }
  }

  //
  void render()
  {
    image(bkg, 0, 0);

    labelPoints.render(200, height-200);

    labelEnter.render(width/6, height-100);
    labelExit.render(width/6, height-50);
  }

  //
  void onEnter(StringDict message)
  {
    if (message!= null && message.size()>0)
    {
      labelPoints.setText(message.get("NAME")+" win "+ message.get("SCORE")+" Pts");
    }
    //
    if (gMusicPlayer!= null)
    {
      gMusicPlayer.load("musics/menu.mp3");
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
