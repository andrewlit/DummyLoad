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
//#include"DisplayManager.h"

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
bool ENC_LAST = 0;

const int RES_SW = 12;
const int BUZZER = 10;
bool BUZZER_ON = 1;

const int VIN = 5;

//Struct for a basic on-screen parameter
struct parameter{
	byte x, y, dec, inc;
	unsigned short value;
} voltage, current, power, cutoff, enabled;



char DISP_OFF[4][21]=  {"Set:      A     load",
			"Cut:      V      off",	
			"Vlt:      V         ",
			"Pwr:      W         "};


char DISP_ON [4][21]=  {"Set:      A     load",
			"Cut:      V       on",	
			"Vlt:      V         ",
			"Pwr:      W        *"};

//Array of editable parameters
parameter* editParams[] {&current, &cutoff, &enabled};

//number of parameters to loop through
byte NUM_PARAMS = 2;


LiquidCrystal595 lcd ( DISP_d, DISP_l, DISP_c);


 // DisplayManager dispman (&lcd);
void setup() {

  pinMode(V_in, INPUT);
  pinMode (DAC_c, OUTPUT);
  pinMode (DAC_l, OUTPUT);
  pinMode (DAC_d, OUTPUT);
  pinMode (BUZZER, OUTPUT);
  pinMode (ENC_1, INPUT_PULLUP);
  pinMode (ENC_3, INPUT_PULLUP);
  pinMode (ENC_button, INPUT_PULLUP);
  pinMode (RES_SW, INPUT_PULLUP);
  dacOut(0);


  digitalWrite(BUZZER, LOW);
  dacOut(0);
  lcd.init();


  lcd.begin(20, 4);
  lcd.home();

  //Set up the parameter structs
  voltage.x = 4;
  voltage.y = 2;
  voltage.dec = 2;
  voltage.inc = 1;
  voltage.value = 0;

  current.x = 4;
  current.y = 0;
  current.dec=3;
  current.inc = 10;
  current.value=200;

  cutoff.x = 4;
  cutoff.y = 1;
  cutoff.inc = 1;
  cutoff.dec = 2;
  cutoff.value = 500;

  power.x=4;
  power.y=3;
  power.dec=2;
  power.inc=NULL;
  power.value=0;

  enabled.x=16;
  enabled.y=1;
  enabled.value=0;


  putDisplay(DISP_OFF);
  updateParams();
  showParam(&voltage);
  showParam(&current);
  showParam(&cutoff);
  showParam(&power);
  lcd.cursor();
  
}

bool MODE = 0;
bool n = 0;
word updateCount = 0;
unsigned short CURRENT_PARAM = 0;

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
      if (MODE)
      {
	      if(editParams[CURRENT_PARAM]==&enabled)
	      {
	      enabled.value = !enabled.value;
	      beep(100);
		      redraw();
		      putCursor();
	      }
      
	      else{
	      editParams[CURRENT_PARAM]->value+= editParams[CURRENT_PARAM]->inc;	      		
	      showParam(editParams[CURRENT_PARAM]);
	      }
      }
      
      else 
      {
	      if (CURRENT_PARAM == NUM_PARAMS) CURRENT_PARAM=0;
	      else CURRENT_PARAM ++;
	      lcd.setCursor(editParams[CURRENT_PARAM]->x,editParams[CURRENT_PARAM]->y);
      }
    }
    
    else
    {
      if (MODE)
      {
	      if(editParams[CURRENT_PARAM]==&enabled)
	      {
		      enabled.value = !enabled.value;
		      beep(100);
	      	redraw();
		putCursor();
	     }
	      else{
	      editParams[CURRENT_PARAM]->value-=editParams[CURRENT_PARAM]->inc;
	      showParam(editParams[CURRENT_PARAM]);
	      }
      }
     
    
      else
      {
	      if (CURRENT_PARAM == 0) CURRENT_PARAM=NUM_PARAMS;
	      else CURRENT_PARAM --;
	      lcd.setCursor(editParams[CURRENT_PARAM]->x,editParams[CURRENT_PARAM]->y);
      }
    }
  }
  

  if (digitalRead(ENC_button) == LOW) 
  {
    MODE = !MODE;
    if (MODE) lcd.blink();
    else lcd.noBlink(); 
    updateParams();
    delay(200);
  }

  if (digitalRead(RES_SW) == LOW)
  {
	  BUZZER_ON = !BUZZER_ON;
	  delay(500);
    }

  if (updateCount == 65000) updateCount=0;
  if (!MODE && updateCount++ == 0 ) updateParams();
}

void putDisplay(char data[4][21])
{
	for (int y = 0; y < 4; y++)
	{
		lcd.setCursor(0,y);
		lcd.print(data[y]);
	}
}

void showParam(parameter *p)
{
	lcd.setCursor(p->x, p->y);
	String s = String(p->value);

	//Pad with zeroes if needed
	s = String("0000").substring(0, 4-s.length())+s;
//	if (s.length()-p->dec == 2) s = "00" + s;
//	else if (s.length()-p->dec == 1) s="0" + s;

	//Add the decimal point
	s= s.substring(0, s.length()-p->dec) + "." + s.substring(s.length()-p->dec);
	
	lcd.print(s);
}

void updateParams()
{
	lcd.noCursor();
	power.value = (current.value/100)*(cutoff.value/10);
	voltage.value = analogRead(V_in)*2.52; //This is from the 1/7.8 voltage divider and the max value of 1023
	showParam(&power);
	showParam(&voltage);
	putCursor();
	lcd.cursor();
}

void redraw()
{
	if (enabled.value)
		putDisplay(DISP_ON);
	else putDisplay(DISP_OFF);
	updateParams();

  showParam(&voltage);
  showParam(&current);
  showParam(&cutoff);
  showParam(&power);
}


void putCursor()
{
	lcd.setCursor(editParams[CURRENT_PARAM]->x,editParams[CURRENT_PARAM]->y);
}

void putCursor(parameter* p)
{
	lcd.setCursor(p->x,p->y);
}

void flash(int pin)
{
  digitalWrite(pin, HIGH);
  delay (500);
  digitalWrite(pin, LOW);
  delay (500);
}

void dacOut(unsigned short val)
{
  digitalWrite(DAC_l, LOW);
  shiftOut (DAC_d, DAC_c, MSBFIRST, val);
  shiftOut (DAC_d, DAC_c, MSBFIRST, val<<8);
  digitalWrite(DAC_l, HIGH);
}

//Turns out the buzzer actually has an internal oscillator, so all we have to
// do is pull the pin high
void beep(int duration)
{
	if(!BUZZER_ON) return;

  digitalWrite(BUZZER, HIGH);
  delay(duration);
  digitalWrite(BUZZER, LOW);
}



