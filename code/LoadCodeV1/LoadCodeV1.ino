#include <LiquidCrystal595.h>

/* First revision of code for the electronic load. 
Features in this version:

1) Display functionality
2) Constant current mode, set by turning knob
3) Enable/disable load by pushing button

*/

//Pin Assignments
//DAC Shift Register; 16 bit serial
#define DAC_c 2
#define DAC_l 3
#define DAC_d 4

//Display shift register; 6 bit serial (takes 8 bits)
#define DISP_c P1_5
#define DISP_l P1_4
#define DISP_d P2_0

#define VIN 5

LiquidCrystal595 lcd ( DISP_d, DISP_l, DISP_c);

void setup() {

delay (1000);
  lcd.begin(20, 4);
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

