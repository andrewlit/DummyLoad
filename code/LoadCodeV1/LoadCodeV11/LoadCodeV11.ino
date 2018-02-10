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

  
  dispman.addObj(0,0, "Param 1:");
  dispman.addObj(0,1, "Param 2:");
  dispman.addObj(4, 3, "Param 3:");
  dispman.update();
  lcd.cursor();
  dispman.objAppendCursor();
}

int x = 0;
int inc = 1;
bool MODE = 0;

int n = 0;

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
        dispman.nextObj();
        dispman.objAppendCursor();
      }
    }
    else
    {
      if (MODE) dispman.objIncrementVal(-1);
      else
      {
        dispman.prevObj();
        dispman.objAppendCursor();
      }
    }
    if(MODE) dispman.objAppendVal();
  }
  if (digitalRead(ENC_button) == LOW) 
  {
    MODE = !MODE;
    if (MODE) lcd.blink();
    else lcd.noBlink(); 
    delay(200);
  }
 
}

void flash(int pin)
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

void beep(int duration)
{
for (int x = 0; x < duration; x ++)
{
  digitalWrite(BUZZER, HIGH);
  delayMicroseconds(100);
  digitalWrite(BUZZER, LOW);
  delayMicroseconds(900);
}
}


