#include"LiquidCrystal595.h"
//Pin Assignments
//DAC Shift Register; 16 bit serial
const int DAC_c = 2;
const int DAC_l = 3;
const int DAC_d = 4;

//Display shift register; 6 bit serial (takes 8 bits)
const int  DISP_l = 6;
const int DISP_c = 7;
const int DISP_d = 8;

const int VIN = 5;

LiquidCrystal595 lcd ( DISP_d, DISP_l, DISP_c);

void setup() {
  pinMode (DISP_l, OUTPUT);
  pinMode (DISP_c, OUTPUT);
  pinMode (DISP_d, OUTPUT);
  uint8_t cols = 20;
  uint8_t rows = 4;
/*
delay (1000);

digitalWrite(DISP_l, HIGH);
delay (5000);
digitalWrite(DISP_l, LOW);
digitalWrite(DISP_c, HIGH);
delay (5000);
digitalWrite(DISP_c, LOW);
digitalWrite(DISP_d, HIGH);
delay (5000);
digitalWrite(DISP_d, LOW);
*/

  lcd.begin(cols, rows);
  lcd.clear();
  lcd.home();
  lcd.print("Hello there");

}
int x =0;
void loop() {
delay (1000);
lcd.clear();
lcd.print(x);
x++;  
}
