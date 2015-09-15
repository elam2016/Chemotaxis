int bacSize;
int i = ((int)(Math.random()*2));
//, bac2;
Bacteria [] colony = new Bacteria[50];
int screenSize = 300;
Bacteria bac1 = new Bacteria();
void setup()
{
	size(screenSize, screenSize);
	bacSize = 10;
	//bac2 = new Bacteria(screenSize/2, screenSize/2, bacColor);
	for (int i = 0; i < colony.length; i++)
	{
		colony[i] = new Bacteria ();
	}
}
void draw()
{
	background(120, 120, 120);
	bac1.show();
	bac1.move();
	//bac2.show();
	//bac2.move();
	for (int i = 0; i < colony.length; i++)
	{
		colony[i].move();
		colony[i].show();
	}
}
void mouseClicked()
{
	//poop.newFoodLocation();
}
class Bacteria
{
	int bacX, bacY;
	color bacColor = color(((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125));
	Bacteria()
	{
		bacX = screenSize/2;
		bacY = screenSize/2;
		//color bacColor = color(((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125), ((int)(Math.random()*100) + 125));;
	}
	void move()
	{
		bacX = bacX + ((int)(Math.random()*3) - 1);
		bacY = bacY + ((int)(Math.random()*3) - 1);
	}
	void show()
	{
		fill(bacColor);
		if(i == 1)
		{
			ellipse(bacX, bacY, bacSize, bacSize);
		} else {
			rect(bacX, bacY, bacSize, bacSize);
		}
	}
}
