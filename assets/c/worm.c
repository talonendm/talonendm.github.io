//*****************************************************************************
//*   Jaakko - Projekt WORM                                                   *
//*****************************************************************************
#include "allan.h"
#include "time.h"
//#include "stdio.h"
//*****************************************************************************
#define SQUARESCALE 8                     // you can select here size of square
#define MAPWIDTH (int)((SCREENWIDTH-1)/SQUARESCALE)
#define MAPHEIGHT (int)((SCREENHEIGHT-1-SQUARESCALE)/SQUARESCALE)
                                            // space for print points and level 
//*****************************************************************************
time_t now;                                    // We need this for showing time
int t,                                         // round number
    worms_in_game,                             // 
	level,                                     // speed level
    acceleration,                              // acceleration for worm
    inchar;                                    // for reading keyboard
char string[50];
int i,j;

int matrix[MAPWIDTH][MAPHEIGHT];  // map (9=walls 1..4=worm way 0=empty square)
//*****************************************************************************
struct Food {
	int x,y,grade;                    // coordinates and grade for wormfood
};
//*****************************************************************************
struct Worm {
	int x,y,vx,vy;                        // coordinates and speed for worm  
};
//*****************************************************************************
struct Wormplace {
	struct Worm f,b;
	char name[ 50 ];
	int points,length,grow,color;
};
//*****************************************************************************
struct Wormplace Player[2];
struct Food food;
//*****************************************************************************
void main()
{
	startplace:                  // loop, when worm dies program go to here 
    	Starting_data_for_game();
	Beginning();
    
	Open_screen();
    	Coordinates(0,0, SCREENWIDTH,SCREENHEIGHT);
	
	Draw_walls();
    	Text_change(Player[0].color);
  	New_food_place();
    	Game();
	
	goto startplace;
}
//*****************************************************************************
//*****************************************************************************
//*****************************************************************************
Give_direction(int vx, int vy)
{
	int suunta;
	if (vy==1) suunta=1;           // suunta is finnish and means direction
	if (vx==1) suunta=2;
	if (vy==-1) suunta=3;
	if (vx==-1) suunta=4;
	return suunta;
} 
//*****************************************************************************
Draw_square(int x, int y, int color)
{
	Color(color);
	Move_to(x,y);
	Line_to(x,y+SQUARESCALE-1);
	Line_to(x+SQUARESCALE-1,y+SQUARESCALE-1);
	Line_to(x+SQUARESCALE-1,y);
	Line_to(x,y);
	
	Line_to(x+SQUARESCALE-1,y+SQUARESCALE-1);
	Move_to(x,y+SQUARESCALE-1);
	Line_to(x+SQUARESCALE-1,y);	
	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
New_food_place()
{

	do
	{
		food.x=(int)(Random_float()*(MAPWIDTH-2)+1);
		food.y=(int)(Random_float()*(MAPHEIGHT-2)+1);
	} while (matrix[food.x][food.y]!=0);
	
	food.grade=(int)(Random_float()*3+1);
	Draw_square(food.x*SQUARESCALE,food.y*SQUARESCALE,food.grade+10);
	matrix[food.x][food.y]=8;
	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Text_change(int color)
{
	
	Locate(0,2);
	Color(color);

	sprintf(string,"Points=%d Level=%d",Player[0].points, level);
	Print(string);

	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Beginning()
{
	printf("WORM\np..Play\ns..view scorelist\ni..info\nESC..exit\n");
	printf("Check that u have numlock off\n");
	FOREVER
	{
		inchar=(char)Inkey();
		//printf("%d",(int)inchar);
  		
		if(inchar == 'p' )break;
		if((int)inchar == 27 )exit(0);
		
		switch (inchar) {
			case 's':  Scorelist(0); break;
			case 'i': Info(); break;
			
		}

	}
	
	return(TRUE);   //just returns something, if not compiler make warning
}

//*****************************************************************************
Scorelist(int what)
{
	FILE *in,*out;
	char filename[]={"pisteet.jaq"};
	char filename2[]={"nimet.jaq"};
        
	char nimi[10][50], namn2[10][50];
	int lista[10];                                     // 10 best points

	//int ret;
	
	in=fopen(filename,"r");
	
	for (i=0;i<10;i++)
		fscanf(in,"%d",&lista[i]);       // open list what we have (points)
    	
	fclose(in);

        	
	in=fopen(filename2,"r");

					// open list where names and dates are
	for (i=0;i<10;i++){			// each row ends word:  'sluta'
		fscanf(in,"%s",&nimi[i]);
		for (j=0;j<10;j++)
		{
			fscanf(in,"%s ", namn2[i]);
			if (strcmp(namn2	[i],"SLUTA")==0) break;
			strcat(nimi[i]," ");
			strcat(nimi[i], namn2[i]);
		}
	}

	fclose(in);
	
	if (what==0)
		for (i=0;i<10;i++)
			printf("%d. %s: %d points\n",i+1,nimi[i],lista[i]);
	

// here program saves list 
// what means just if we are saving what is 1
	
if (what==1) {

	for (i=0;i<10;i++){
		if (Player[0].points>lista[i]) {
			for (j=9;j>i;j--){
				lista[j]=lista[j-1];
				strcpy(nimi[j],nimi[j-1]);
			}
			lista[i]=Player[0].points;
			strcpy(nimi[j],Player[0].name);
			
			Player[0].points=-1000;
			
		}
		printf("%d. %s: %d points\n",i+1,nimi[i],lista[i]);
	}

	

	out=fopen(filename2,"w");
	for (i=0;i<10;i++){
		//Trim_space(nimi[i]);
		strcat(nimi[i]," SLUTA");
		fprintf(out,"%s " ,nimi[i]);
	}
	fclose(out);

	out=fopen(filename,"w");
	for (i=0;i<10;i++){
		fprintf(out,"%d " ,lista[i]);
	}
	fclose(out);

	
}

	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Info()
{
	printf("*****************************************\n");
	printf("* Jaakko Talonen's Wormgame 23.5.2002   *\n");
	printf("*****************************************");
	printf("\nYou are worm2002! Collect food and enjoy!\n");
	printf("8.. up\n");
	printf("2.. down\n");
	printf("4.. left\n");
	printf("6.. right\n");
	printf("b.. break\n");
	printf("*****************************************\n");
	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Starting_data_for_game()
{
	Start_random_gen(12345);
 	Player[0].f.x=4;	
	Player[0].f.y=(int)(MAPHEIGHT/2);  // Starting Y-position is in the middle   
	Player[0].f.vx=1;	
	Player[0].f.vy=0;
    matrix[Player[0].f.x][Player[0].f.y]=2;

		
	Player[0].b.x=Player[0].f.x;	
	Player[0].b.y=Player[0].f.y;	
	Player[0].b.vx=1;	
	Player[0].b.vy=0;

	Player[0].grow=9;                                 // grows to length of 10
	Player[0].length=1;                                     // starting length
	Player[0].color=14;                                              // YELLOW
	Player[0].points=0;

	t=0;
	level=50;                     // how many milliseconds program waits/round
	acceleration=30;                 // how many rounds when level is '-' by 1
    return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Draw_walls()
{
	for (i=0;i<=MAPWIDTH;i++){
		Draw_square(i*SQUARESCALE,0,5);
		matrix[i][0]=9;
	}
	for (i=0;i<=MAPWIDTH;i++){
		Draw_square(i*SQUARESCALE,MAPHEIGHT*SQUARESCALE,5);
		matrix[i][MAPHEIGHT]=9;
	}
	for (j=0;j<=MAPHEIGHT;j++){
		Draw_square(0,j*SQUARESCALE,5);
		matrix[0][j]=9;
	}
	for (j=0;j<=MAPHEIGHT;j++){
		Draw_square(MAPWIDTH*SQUARESCALE,j*SQUARESCALE,5);
		matrix[MAPWIDTH][j]=9;
	}
	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Game_over()
{
   	Close_screen();


	printf("Points: %d  Level: %d\n",Player[0].points,level);
	
	//printf("Time: %s",ctime(&now));          //page 400
	//printf(string);
	printf( "\nPlease enter your name: " );
 	gets(Player[0].name); 
	
	now=time(NULL);
	sprintf(string,": %s",ctime(&now));
	strcat(Player[0].name,string);
	printf("%s\n",Player[0].name);

	Scorelist(1);
	
	return(TRUE);   //just returns something, if not compiler make warning
}
//*****************************************************************************
Game()
{
  	FOREVER
 	{
		
		++t;
		
		if (t % acceleration==0){
			Text_change(0);
			if (level>1) level=level-1;
			if (level<10) acceleration=acceleration*2;
			Text_change(Player[0].color);
		}
		delay( level );    // milliseconds
//*****************************************************************************

  		
		inchar=(char)Inkey();
		//printf("%d",(int)inchar);
  		
		if(inchar == 'b' )break;
		if((int)inchar == 27 )break;
		
		switch (inchar) {
			case '4': if (Player[0].f.vy!=0)
				{Player[0].f.vx=-1; Player[0].f.vy=0;} break;
			case '6': if (Player[0].f.vy!=0)
				{ Player[0].f.vx=1; Player[0].f.vy=0;} break;
			case '8': if (Player[0].f.vx!=0)
				{ Player[0].f.vx=0; Player[0].f.vy=1;} break;
			case '2': if (Player[0].f.vx!=0)
				{Player[0].f.vx=0; Player[0].f.vy=-1;} break;
		}
//*****************************************************************************

		if (Player[0].grow==0)	
		{
			
			Draw_square(Player[0].b.x*SQUARESCALE,Player[0].b.y*SQUARESCALE,0);

			Player[0].b.vx=0;
			Player[0].b.vy=0;

			if (matrix[Player[0].b.x][Player[0].b.y]==1) Player[0].b.vy=1;
			if (matrix[Player[0].b.x][Player[0].b.y]==2) Player[0].b.vx=1;
			if (matrix[Player[0].b.x][Player[0].b.y]==3) Player[0].b.vy=-1;
			if (matrix[Player[0].b.x][Player[0].b.y]==4) Player[0].b.vx=-1;
			
			matrix[Player[0].b.x][Player[0].b.y]=0;
		
			Player[0].b.x=Player[0].b.x+Player[0].b.vx;
			Player[0].b.y=Player[0].b.y+Player[0].b.vy;
		}
		else
		{
			Player[0].grow=Player[0].grow-1;
			Player[0].length=Player[0].length+1;
		}
//*****************************************************************************

 		matrix[Player[0].f.x][Player[0].f.y]=Give_direction(Player[0].f.vx,Player[0].f.vy);

		Player[0].f.x=Player[0].f.x+Player[0].f.vx;
		Player[0].f.y=Player[0].f.y+Player[0].f.vy;
//*****************************************************************************
		if (matrix[Player[0].f.x][Player[0].f.y]!=0) 
		{
			
			if (matrix[Player[0].f.x][Player[0].f.y]==8) {
				Player[0].grow=Player[0].grow+food.grade*3;	
				Text_change(0);
				Player[0].points=Player[0].points+food.grade*100;	
				New_food_place();


				Text_change(Player[0].color);


			}
			else	
				if (Player[0].length>1){
                    // this is when worm crashes into something
					Player[0].length--;
					Text_change(0);
					Player[0].points=Player[0].points-level;
					Text_change(Player[0].color);
					Player[0].f.x=Player[0].f.x-Player[0].f.vx;
					Player[0].f.y=Player[0].f.y-Player[0].f.vy;
				}
				else
					break;  // worms length is 0
         }
//*****************************************************************************
		
    	Draw_square(Player[0].f.x*SQUARESCALE,Player[0].f.y*SQUARESCALE,Player[0].color);
	     

 	}
//*****************************************************************************
    Game_over();
    return(TRUE);   //just returns something, if not compiler make warning

}
