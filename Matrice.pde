
class Matrice
{
  private int nbCol=7;
  private int nbRow=4;
  private int nbBloc=0;

  Bloc[][] tabBlocs=null;

  //
  Matrice()
  {
    tabBlocs= new Bloc[nbRow][nbCol];

    createGrid();
    nbBloc=nbCol*nbRow;
  }

  //
  void update()
  {
    isAllDestroy();
  }

  //
  void createGrid()
  {
    int row=0;
    int py=50;
    createRow(row, py, Bloc.BLOC_TYPE_BLUE);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_RED);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_GREEN);

    py+=50;
    row++;
    createRow(row, py, Bloc.BLOC_TYPE_YELLOW);
  }

  //
  void createRow(int row, int yp, int type)
  {
    for (int i=0; i<this.nbCol; i++)
    {
      this.tabBlocs[row][i]= new Bloc(Bloc.BLOC_WIDTH/2+i*Bloc.BLOC_WIDTH*2, yp, type);
    }
  }

  //
  boolean isCollideBall(Ball ball)
  {
    Bloc item=null;
    int state=0;

    for (int j=0; j<this.nbRow; j++)
    {
      for (int i=0; i<this.nbCol; i++)
      {
        item=this.tabBlocs[j][i];
        state=item.getState();

        if (item!= null && state==Bloc.STATE_VISIBLE )
        {
          if (ball.isCollide(item))
          {
            item.setState(Bloc.STATE_TOUCHED);
            nbBloc--;
            return true;
          }
        }
      }
    }

    return false;
  }

  //
  boolean isAllDestroy()
  {

    if (nbBloc==0)
    {
      nbBloc=nbCol*nbRow;
      newWave();
      return true;
    }
    return false;
  }

  //
  void newWave()
  {
    for (int j=0; j<this.nbRow; j++)
    {
      for (int i=0; i<this.nbCol; i++)
      {
        this.tabBlocs[j][i].setState(Bloc.STATE_VISIBLE);
      }
    }
  }

  //
  void render()
  {
    for (int j=0; j<this.nbRow; j++)
    {
      for (int i=0; i<this.nbCol; i++)
      {
        Bloc bloc= this.tabBlocs[j][i];

        bloc.render();
      }
    }
  }
}
//end
