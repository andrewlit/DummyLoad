//#ifndef DisplayManager_h
#define DisplayManager_h

#include "LiquidCrystal595.h"
#include "Energia.h"





class DisplayObject 
{
  friend class DisplayManager;
  friend class DisplayList;
  DisplayObject *next;
  DisplayObject *prev;
  
  private:
  short x, y;
  int val;
  String text;
  public:
  DisplayObject (short xval, short yval, String t)
  {
    x = xval;
    y = yval;
    text = t;
    val = 0;
  }

  void setPos(short xval, short yval)
  {
    x = xval;
    y = yval;
  }

  void setText(String t)
  {
    text = t;
  }

  int nextX()
  {
    return x+text.length();
  }
};

class DisplayList
{
  private:
  DisplayObject *head, *tail;

  public:
  DisplayList()
  {
    head = NULL;
    tail = NULL;
  }

  void addObj(short xval, short yval, String t)
  {
    //Create a new display object
    DisplayObject *temp = new DisplayObject(xval, yval, t);
    temp->next = NULL;

    if(head == NULL)
    {
      head = temp;
      tail = temp;
      temp-> next = head;
      temp->prev = tail;
      temp = NULL;
    }
    else
    {
      tail->next = temp;
      tail = temp;
      tail->next = head;
      head->prev = tail;
    }
  }

  DisplayObject* getHead()
  {
    return head;
  }
};



class DisplayManager {
private:
  LiquidCrystal595* lcd;
  String content[4];
  bool mode;
  DisplayList items;
  DisplayObject* currentObject ;
  
  public:
  DisplayManager (LiquidCrystal595 *disp)
  {
    lcd = disp;
    mode = 0;
    currentObject = NULL;
    
    dispClear();
  }

  void dispClear()
  {
    //Initialize the array of lines
    for (int x = 0; x < 4; x ++)
      content[x] = "                    ";
  }

  void addObj(short xval, short yval, String t)
  {
    items.addObj(xval, yval, t);
    if (currentObject == NULL) 
      currentObject = items.getHead();
  }

  void addObj(DisplayObject o)
  {
    items.addObj(o.x, o.y, o.text);
    if (currentObject == NULL) 
      currentObject = items.getHead();
  }

  //Move to the next object
  void nextObj()
  {
    currentObject = currentObject->next;
  }

  //Move to the previous object
  void prevObj()
  {
    currentObject = currentObject->prev;
  }

  void objAppendVal(String append)
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->print(append);
  }

  void objAppendVal()
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->print(currentObject->val);
  }

  void objIncrementVal(int i)
  {
    currentObject->val +=i;
  }

  void objAppendCursor()
  {
 
    lcd->setCursor(currentObject->nextX(), currentObject->y);
  }

  void objAppendVal(int append)
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->print(append);
  }

  void add(DisplayObject o)
  {
    short startx = o.x;
    short len = o.text.length();
    for (int x = 0; x < len; x ++)
      content[o.y].setCharAt(startx+x, o.text.charAt(x));
  }

  void update()
  {
    DisplayObject* temp = currentObject;
    dispClear();
    do{
      add(*temp);
      temp = temp->next;
    }while (temp != currentObject);
    show();
  }

  void show()
  {
    lcd->noCursor();
    for (int x = 0; x < 4; x ++)
    {
      lcd->setCursor(0,x);
      lcd -> print(content[x]);
    }
  }
  
};


