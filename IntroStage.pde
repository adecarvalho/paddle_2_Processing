
class IntroStage extends ez2_Stage
{
  private Background bg=null;

  private ez2_Label titre=null;
  
  private ez2_Label action=null;
  
  private ez2_Label author=null;

  private int tab[];

  private int indice;
  
  private float timer;
  
  private boolean toggle;
  

  IntroStage(int screenWidth, int screenHeight)
  {
    super(screenWidth, screenHeight);

    tab= new int[3];
    
    tab[0]=65;
    tab[1]=65;
    tab[2]=65;
    
    indice=0;
    timer=0.0;
    toggle=false;

    bg= new Background();

    titre= new ez2_Label(gAssetsManager.getFont("brick_60"));
    titre.setColorText(color(255, 161, 31));
    titre.setText("Paddle 2");

    action= new ez2_Label(gAssetsManager.getFont("brick_30"));
    action.setColorText(color(255, 161, 31));
    action.setText("Press Enter to start");


    author= new ez2_Label(gAssetsManager.getFont("brick_20"));
    author.setColorText(color(255, 161, 31));
    author.setText("A.DeCarvalho");
  }

  //
  void update(float dt)
  {
    //test mouse
    if(gInputManager.isMouseClicked())
    {
      println(gInputManager.getMousePositionX()+ " : "+gInputManager.getMousePositionY());
    }
    
    //
    timer+=dt;


    if (timer >0.2f)
    {
      timer=0;
      toggle= !toggle;
    }

    //
    if (gInputManager.isKeyPressed(LEFT) && indice>0)
    {
      indice=indice-1;
    }
    //
    if (gInputManager.isKeyPressed(RIGHT) && indice<2)
    {
      indice=indice+1;
    }
    //
    if (gInputManager.isKeyPressed(UP))
    {
      tab[indice]=tab[indice]+1;

      if (tab[indice] >90)
      {
        tab[indice]=65;
      }
    }
    //
    if (gInputManager.isKeyPressed(DOWN))
    {
      tab[indice]=tab[indice]-1;

      if (tab[indice] <65)
      {
        tab[indice]=90;
      }
    }

    //
    if (gInputManager.isKeyPressed(ENTER))
    {
      StringDict msg= new StringDict();
      msg.set("NAME", ""+char(tab[0]) + char(tab[1]) + char(tab[2]));

      gStageManager.changeStage(new GameStage(screenWidth, screenHeight), msg);
    }
  }

  //
  void render()
  {

    bg.render();

    titre.render(screenWidth/6, 100);

    action.render(screenWidth/6, screenHeight-200);

    author.render(screenWidth-300, screenHeight-50);

    afficheName();
  }

  //
  void onEnter(StringDict message)
  {
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

  //
  void afficheName()
  {
    int xp=screenWidth/3;
    int yp=screenHeight/3;

    //
    fill(255, 161, 31);

    textSize(50);

    //indice 0
    if (indice==0)
    {
      if (toggle)
      {
        text(char(tab[0]), xp, yp);
      }
      text(char(tab[1]), xp+50, yp);

      text(char(tab[2]), xp+100, yp);
    }
    //indice 1
    else if (indice==1)
    {
      if (toggle)
      {
        text(char(tab[1]), xp+50, yp);
      }
      text(char(tab[0]), xp, yp);

      text(char(tab[2]), xp+100, yp);
    }
    //
    else if (indice==2)
    {
      if (toggle)
      {
        text(char(tab[2]), xp+100, yp);
      }
      text(char(tab[0]), xp, yp);

      text(char(tab[1]), xp+50, yp);
    }
  }
}
//end
