#include <Wire.h>
#include <LiquidCrystal_I2C.h>

static constexpr unsigned long TimeChunk = 2 * 1000;

static LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
static unsigned long endTime;
static bool previousPressed;

void setup()
{
	lcd.begin(16,2);
	lcd.backlight();

	pinMode(A0, INPUT_PULLUP);
	delay(10);

	endTime = millis() + 10000 * TimeChunk;
	previousPressed = HIGH;
}

void loop()
{
	lcd.setCursor(0,0);

	unsigned long currentTime = millis();
	if (currentTime >= endTime)
	{
		lcd.print("GAME OVER!");
	}
	else
	{
		bool currentPressed = digitalRead(A0);
		if (currentPressed && !previousPressed)
		{
			endTime += 10 * TimeChunk;
		}
		previousPressed = currentPressed;

		unsigned long remainingChunk = (endTime - currentTime) / TimeChunk;
		char buf[12];
		lcd.print(itoa(remainingChunk, buf, 10));
	}

	delay(10);
}
