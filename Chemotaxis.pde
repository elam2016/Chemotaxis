int bacSize;
int bacShape;
Bacteria [] colony = new Bacteria[50];
int screenSize = 500;
Bacteria bac1 = new Bacteria();
void setup()
{
	size(screenSize, screenSize);
	bacSize = 10;
	for (int c = 0; c < colony.length; c++)
		colony[c] = new Bacteria();
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
}
void mouseClicked()
{
	//bac1.newFoodLocation();
}
class Bacteria
{
	int bacX, bacY;
	color bacColor = color(((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125));
	Bacteria()
	{
		bacX = ((int)(Math.random()*screenSize) + 1);
		bacY = ((int)(Math.random()*screenSize) + 1);
	}
	void move()
	{
		bacX = bacX + ((int)(Math.random()*3) - 1);
		bacY = bacY + ((int)(Math.random()*3) - 1);
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
