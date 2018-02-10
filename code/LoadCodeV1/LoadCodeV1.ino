/*
 This is the main code for the electronic load.

 The LCD layout will be something like this:

 
++++++++++++++++
  Set: x.xxx A/W
  Cut: x.xxx A/W/V
x.xxx A  xx.xx V
xx.xx W  Logging
++++++++++++++++
 
 */
#include"LiquidCrystal595.h"
#include"DisplayManager.h"

//Pin Assignments
//DAC Shift Register; 16 bit serial
const int DAC_c = 2;
const int DAC_l = 3;
const int DAC_d = 4;
const int V_in = 5;

//Display shift register; 6 bit serial (takes 8 bits)
const int  DISP_l = 6;
const int DISP_c = 7;
const int DISP_d = 8;

//Rotary Encoder
const int ENC_1 = 14;
const int ENC_3 = 13;
const int ENC_button = 9;
int ENC_LAST = 0;

const int BUZZER = 10;

const int VIN = 5;



  unsigned short num1 = 32;
  unsigned short num2 = 60;
  unsigned short num3 = 3;
LiquidCrystal595 lcd ( DISP_d, DISP_l, DISP_c);


  DisplayManager dispman (&lcd);
void setup() {

  pinMode(V_in, INPUT);
  pinMode (DAC_c, OUTPUT);
  pinMode (DAC_l, OUTPUT);
  pinMode (DAC_d, OUTPUT);
  pinMode (BUZZER, OUTPUT);
  pinMode (ENC_1, INPUT_PULLUP);
  pinMode (ENC_3, INPUT_PULLUP);
  pinMode (ENC_button, INPUT_PULLUP);
  dacOut(0);

  digitalWrite(BUZZER, LOW);
  lcd.init();

  uint8_t cols = 20;
  uint8_t rows = 4;

  lcd.begin(cols, rows);
  lcd.home();
  lcd.print(0);

  //char name[] = "na1:";

  dispman.addObj(0,0, "hi",  &num1, 0, 2);
  //dispman.addObj(5,1, "Thing 2:",  &num2, 1, 3);
  //dispman.addObj(2,2, "Thing 3:", &num2, 0, 2);
  //dispman.addObj(0,3, "Thing 4:", &num1, 1,2);

  //dispman.update();
  dispman.show();
  lcd.cursor();
  //dispman.objAppendCursor();
  flash(2);
  delay(1000);
}

short inc = 1;
bool MODE = 0;

bool n = 0;

void loop() {
  
  if (digitalRead(ENC_1) != n)
  {
      ENC_LAST = n;
      n = digitalRead(ENC_1);
  }
  
  if ((ENC_LAST == HIGH) && (n == LOW))
  {
    ENC_LAST = n; // Do not execute this statement again until the encoder changes
    if (digitalRead(ENC_3) == LOW)
    {
      if (MODE) dispman.objIncrementVal(1);
      else 
      {
        dispman.nextObjCheck();
        dispman.objAppendCursor();
      }
    }
    else
    {
      if (MODE) dispman.objIncrementVal(-1);
      else
      {
        dispman.prevObjCheck();
        dispman.objAppendCursor();
      }
    }
    if(MODE) dispman.objAppendParam();
  }
  if (digitalRead(ENC_button) == LOW) 
  {
    MODE = !MODE;
    if (MODE) lcd.blink();
    else {
	    lcd.noBlink(); 
	    updateParams();
	    dispman.update();
    }
    delay(200);
  }
 
}
void flash(byte pin)
{
  digitalWrite(pin, HIGH);
  delay (500);
  digitalWrite(pin, LOW);
  delay (500);
}

void dacOut(int val)
{
  digitalWrite(DAC_l, LOW);
  shiftOut (DAC_d, DAC_c, MSBFIRST, val);
  shiftOut (DAC_d, DAC_c, MSBFIRST, val<<8);
  digitalWrite(DAC_l, HIGH);
}

//Turns out the buzzer actually has an internal oscillator, so all we have to
// do is pull the pin high
void beep(unsigned short duration)
{
  digitalWrite(BUZZER, HIGH);
  delay(duration);
  digitalWrite(BUZZER, LOW);
}

//Update and dependent parameters
void updateParams()
{
	num2 = 15*num1;
}





