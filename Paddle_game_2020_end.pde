/**
 Projet Paddle Processing
 with ez2Lib
 Mai 2020
 A.DeCarvalho
 */

import java.util.*;
import ddf.minim.*;

//
ez2_InputManager gInputManager=null;

ez2_StageManager gStageManager=null;

ez2_AssetsManager gAssetsManager=null;

ez2_MusicPlayer gMusicPlayer=null;

Minim gMinim=null;

ez2_Game game=null;

//************
void setup() {
  //
  final int SCREEN_WIDTH=700;
  final int SCREEN_HEIGHT=500;

  //
  size(700, 500);

  gMinim= new Minim(this);

  gStageManager= new ez2_StageManager();

  gInputManager= new ez2_InputManager();

  gMusicPlayer= new ez2_MusicPlayer(gMinim);

  gAssetsManager= new ez2_AssetsManager(gMinim);

  //load image
  gAssetsManager.putImage("background", "images/background.jpg");
  gAssetsManager.putImage("bkg_gameOver", "images/bkg_gameOver.jpg");
  gAssetsManager.putImage("ball", "images/ball.png");
  gAssetsManager.putImage("paddle", "images/paddle.png");
  gAssetsManager.putImage("bloc_blue", "images/bloc_blue.png");
  gAssetsManager.putImage("bloc_red", "images/bloc_red.png");
  gAssetsManager.putImage("bloc_green", "images/bloc_green.png");
  gAssetsManager.putImage("bloc_yellow", "images/bloc_yellow.png");

  //load sounds
  gAssetsManager.putSound("explosion", "sounds/explosion.wav", 256);
  gAssetsManager.putSound("spawn", "sounds/spawn.wav", 256);
  gAssetsManager.putSound("bump", "sounds/bump.wav", 256);

  //load fonts
  gAssetsManager.putFont("brick_60", "fonts/brick.ttf", 60);
  gAssetsManager.putFont("brick_30", "fonts/brick.ttf", 30);
  gAssetsManager.putFont("brick_20", "fonts/brick.ttf", 20);
  gAssetsManager.putFont("free_30", "fonts/free.ttf", 30);

  //
  gStageManager.addStage(new IntroStage(SCREEN_WIDTH, SCREEN_HEIGHT));

  game= new ez2_Game(gStageManager, gInputManager);
  
  game.start();
}

//***********
void draw() {
  game.action();
}


//*****************
void keyPressed() 
{
  gInputManager.setKeyboardPressed(keyCode);
}

//******************
void keyReleased() 
{
  gInputManager.setKeyboardReleased(keyCode);
}

//*******************
void mousePressed() {
  gInputManager.setMouseClicked(mouseX, mouseY);
}

//*******************
void mouseReleased() {
  gInputManager.setMouseReleased(mouseX, mouseY);
}
