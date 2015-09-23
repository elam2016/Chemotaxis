int bacSize;
int bacShape;
int screenSize = 700;
Bacteria [] colony = new Bacteria[screenSize/5];
color foodColor = color(((int)(Math.random()*100) + 75), ((int)(Math.random()*50) + 50), 0);
boolean foodPlace = false;
void setup()
{
	size(screenSize, screenSize);
	bacSize = 10;
	for (int c = 0; c < colony.length; c++)
		colony[c] = new Bacteria();
	println(screenSize/5);
}
void draw()
{
	fill(0, 0, 0, 20);
	rect(0, 0, screenSize, screenSize);
	for (int i = 0; i < colony.length; i++)
	{
		bacShape = ((int)(Math.random()*2));
		colony[i].move();
		colony[i].show();
	}
	if(foodPlace)
	{
		fill(foodColor);
		ellipse(mouseX, mouseY, bacSize + 10, bacSize + 10);
	}	
}
void mousePressed()
{
	foodColor = color(((int)(Math.random()*100) + 75), ((int)(Math.random()*50) + 50), 0);
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
		noStroke();
		if(bacShape == 1)
			ellipse(bacX + bacSize/2, bacY + bacSize/2, bacSize, bacSize);
		else
			rect(bacX, bacY, bacSize, bacSize);
	}
}
