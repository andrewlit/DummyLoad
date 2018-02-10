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
  byte x, y;
  unsigned short* param;
  byte decimal;
  byte nx;
  bool displayOnly;

  public:
  DisplayObject (byte xval, byte yval, char t[])
  {
    x = xval;
    y = yval;
    param=NULL;
    displayOnly = 0;
    decimal = 2;
    nx=x;
  }

  DisplayObject (byte xval, byte yval, byte nextX, unsigned short* p)
  {
    x = xval;
    y = yval;
    nx=x;
    param=p;
    displayOnly = 0;
    decimal=2;

  }

  void setDisplayOnly(bool d)
  {
	  displayOnly = d;
  }

  void setDecimal(byte d)
  {
	  decimal = d;
  }

  void setPos(byte xval, byte yval)
  {
    x = xval;
    y = yval;
  }

  void setParam(unsigned short* p)
  {
	  param=p;
  }
  void incParam(unsigned short increment)
  {
	  *param += increment;
  }

  unsigned short* getParam()
  {
	  return param;
  }
  
  int getParamVal()
  {
	  return *param;
  }



  void setNextX(byte n)
  {
	  nx = n;
  }

  byte nextX()
  {
    return nx;
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

  void addObj(short xval, short yval, byte nextx, unsigned short* param, bool dispOnly, byte decimal)
  {
    //Create a new display object
    DisplayObject *temp = new DisplayObject(xval, yval, nextx, param);
	    
    temp->setDisplayOnly(dispOnly);
    temp->setDecimal(decimal);

    temp->next = NULL;
    temp->prev=NULL;

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
      temp->prev = tail;
      temp->next = head;
      head->prev=temp;
      tail = temp;
      temp=NULL;
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
  char content[4][20];
  DisplayList items;
  DisplayObject* currentObject ;
  
  public:
  DisplayManager (LiquidCrystal595 *disp)
  {
    lcd = disp;
    currentObject = NULL;
    
    dispClear();
  }

  void dispClear()
  {
    //Initialize the array of lines
    for (byte x = 0; x < 4; x ++)
    {
	    for (byte y = 0; y < 20; y++)
      		content[x][y] = ' ';
    }
  }

  void addObj(short xval, short yval, char t[], unsigned short* param, bool d, byte dec)
  {
    items.addObj(xval, yval,xval+sizeof(t), param, d, dec);
    //Add the text
    for (int x =0; x < sizeof(t); x++)
	content[yval][x]=t[x+xval];

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

  //Move to the next object, paying attention to editability
  void nextObjCheck()
  {
    currentObject = currentObject->next;
    if (currentObject->displayOnly) nextObjCheck();
  }

  //Move to the previous object, paying attention to editability
  void prevObjCheck()
  {
    currentObject = currentObject->prev;
    if (currentObject->displayOnly) prevObjCheck();
  }

  void objAppendVal(String append)
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->print(append);
  }

  void objAppendParam()
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->print(addDecimal(currentObject->getParamVal(),currentObject->decimal));
  }

  void objAppendParam(DisplayObject* o)
  {
    lcd->setCursor(o->nextX(), o->y);
    lcd->print(addDecimal(o->getParamVal(),o->decimal));
  }

  void objBufferParam(DisplayObject* o)
  {
	short startx=o->nx;
	String s=addDecimal(o->getParamVal(),o->decimal);
	
	
	for (byte x = 0; x<s.length(); x++)
		content[o->y][startx+x]= s.charAt(x);
  }

  unsigned short* objIncrementVal(unsigned short i)
  {
    currentObject->incParam(i);
    return currentObject->param;
  }

  void objAppendCursor()
  {
 
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    lcd->cursor();
  }

  void objAppendVal(unsigned short append)
  {
    lcd->setCursor(currentObject->nextX(), currentObject->y);
    String ap = String(append);
    lcd->print(ap.substring(0, ap.length()-2)+"."+ap.substring(ap.length()-2));
  }


  void update()
  {
    DisplayObject* temp = currentObject;
    //dispClear();
    do{
      //add(*temp);
     objBufferParam(temp);
      temp = temp->next;
    }while (temp != currentObject);
    show();
  }

  void show()
  {
    lcd->noCursor();
    for (byte x = 0; x < 4; x ++)
    {
      lcd->setCursor(0,x);
      lcd -> print(content[x]);
    }
  }

  String addDecimal(unsigned short n, byte places)
  {
    String s = String(n);
    String zeroes="";
    if(s.length()>places)
    	s=s.substring(0, s.length()-places)+"."+s.substring(s.length()-places);
    else
    {
	    for (byte x = 0; x < places-s.length(); x++)
		    zeroes+="0";
	    s ="."+ s+zeroes;
    }
    zeroes="";

    for (byte x =5; x >s.length(); x--)
	    zeroes += "0";

    return zeroes+s;
  }
  
};


