int bacSize;
int bacShape;
Bacteria [] colony = new Bacteria[50];
int screenSize = 500;
boolean foodPlace = false;
color foodColor = color(((int)(Math.random()*100) + 75), ((int)(Math.random()*50) + 50), 0);
void setup()
{
	size(screenSize, screenSize);
	bacSize = 10;
	for (int c = 0; c < colony.length; c++)
		colony[c] = new Bacteria();
	frameRate(20);
}
void draw()
{
	background(0);
	for (int i = 0; i < colony.length; i++)
	{
		int bacShape = ((int)(Math.random()*2));
		colony[i].move();
		colony[i].show();
		colony[i].magnify();
	}
	if(foodPlace)
	{
		fill(foodColor);
		ellipse(mouseX, mouseY, bacSize, bacSize);
	}	
}
void mousePressed()
{
	foodPlace = true;
}
void mouseReleased()
{
	foodPlace = false;
}
class Bacteria
{
	int bacX, bacY;
	color bacColor = color(0, ((int)(Math.random()*100) + 75), ((int)(Math.random()*100) + 50));
	Bacteria()
	{
		bacX = ((int)(Math.random()*screenSize) + 1);
		bacY = ((int)(Math.random()*screenSize) + 1);
	}
	void move()
	{
		bacX = bacX + ((int)(Math.random()*3) - 1);
		bacY = bacY + ((int)(Math.random()*3) - 1);
		if(foodPlace)
		{
			if(bacX < mouseX && bacY < mouseY)
			{
				bacX = bacX + ((int)(Math.random()*5) - 1);
				bacY = bacY + ((int)(Math.random()*5) - 1);
			} else if(bacX > mouseX && bacY > mouseY)
			{
				bacX = bacX + ((int)(Math.random()*1) - 1);
				bacY = bacY + ((int)(Math.random()*1) - 1);
			} else if(bacX < mouseX && bacY > mouseY)
			{
				bacX = bacX + ((int)(Math.random()*5) - 1);
				bacY = bacY + ((int)(Math.random()*1) - 1);
			}  else if(bacX > mouseX && bacY < mouseY)
			{
				bacX = bacX + ((int)(Math.random()*1) - 1);
				bacY = bacY + ((int)(Math.random()*5) - 1);
			}
		}
		if(bacX > screenSize - 50)
		{
			bacX = bacX + ((int)(Math.random()*1) - 1);
		}
		if(bacX < -screenSize - 50)
		{
			bacX = bacX + ((int)(Math.random()*5) - 1);
		}
		if(bacY > screenSize - 50)
		{
			bacY = bacY + ((int)(Math.random()*1) - 1);
		}
		if(bacY < -screenSize - 50)
		{
			bacY = bacY + ((int)(Math.random()*5) - 1);
		}
	}
	void show()
	{
		fill(bacColor);
		if(bacShape == 1)
			ellipse(bacX, bacY, bacSize, bacSize);
		else
			rect(bacX, bacY, bacSize, bacSize);
	}
	void magnify()
	{
		fill(255, 255, 255, 1);
		ellipse(mouseX, mouseY, bacSize*20, bacSize*20);
		if(bacX == mouseX + bacSize*20 && bacY == mouseY + bacSize*20)
			bacSize *= 3;
		else
			bacSize = 10;
	}
}
