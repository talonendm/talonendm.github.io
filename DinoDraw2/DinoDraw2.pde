/**
 * Continuous Lines. 
 * 
 * Click and drag the mouse to draw a line. 
 */
 
 ColorPicker cp;
 
 
 int k;
 int paksuus;
 int lyhennetty;
 boolean tauko,piirtomenossa,piirtoesto,piirraviivat;
 
 boolean varivalintamenossa;
 boolean taustakuva,tallennettujuuri,tallennetaan;
   float[]x = new float[0];
  float[]y  = new float[0];
float[][]xy = {x, y};



color[]cc = new color[0];
color vcc;

// VÄRI

/*
  int[]v1 = new int[0];
  int[]v2  = new int[0];
    int[]v3 = new int[0];
  int[]v4  = new int[0];
int[][] vari = {v1, v2,v3,v4};

int[]vvari = new int[4];
*/

int[]m  = new int[0];
//boolean[]tt = new boolean[0];
  PImage img;
  
  int kuvaW,kuvaH;
  float skaala;
void setup() {
  
  
  // nyt jää alalaita piiloon..
   cp = new ColorPicker( 60, 10, 1024-10-60, 550-20, 255 );

//img = loadImage("stego1024x550.jpg");
img = loadImage("stego1024x550.png");
  taustakuva = true;
  tallennettujuuri = false;
  tallennetaan = false;
  
  varivalintamenossa = false;
  /*
  vvari[0] = 200;
  vvari[1] = 100;
  vvari[2] = 100;
  vvari[3] = 100;
  */
  
  lyhennetty = 0;
  
  piirtoesto = false;
  paksuus = 3;
  //size(displayWidth/2, displayHeight/2);
  size(1024,550);
  
  kuvaW = 1024/2;
  kuvaH = 550/2;
  skaala=1.7;
  
  
  imageMode(CENTER);
  
  //background(102);
  
  tauko = true;
  piirraviivat = true;
  textAlign(CENTER,CENTER);

k =0;
}

void draw() {
  
  piirtomenossa = false;
  if (!varivalintamenossa) {
  
  
     
  
  
  
  

  
  
  
  
  
  if (tallennetaan) {
    
    //save("dino.png");
    
    // TOIMII PERIAATTEESSA!
    tallennetaan = false;
  }
  
  
  
  
  
  if ((mousePressed) && (!piirtoesto)) {
    
    
    
    if (mouseX>50) {
      
      tallennettujuuri = false;
      
    //line(mouseX, mouseY, pmouseX, pmouseY);
    
    if ((mouseX!=pmouseX) || (mouseY!=pmouseY) || (tauko)) {
    
    xy[0] = append(xy[0],mouseX);
    xy[1] = append(xy[1],mouseY);
    // xy[0][k] = mouseX;
    // xy[1][k] = mouseY;
    
    m = append(m,paksuus);
    
    
    cc = append(cc,vcc);
    
    
    
    
    
    //tt = append(tt,tauko);
    
    //for (int ii=0;ii<4;ii=ii+1){
    //  vari[ii] = append(vari[ii],vvari[ii]);
    //}
    
    
    
    if (k>0) {
      piirraviiva(k);
    }
    
    k=k+1;
    
    
    
    
    
    
    
    tauko = false;
    }
    
    } else if (tauko){
     
      
      // vasemman laidan napit
      // 
      int nappi = floor(mouseY/50);
     if (k>0){ 
      
      
     
     // UNDO
     if (nappi==0) {
       
       
      lyhennetty = lyhennetty + 1; 
      
      int lyhennyspatka = round(lyhennetty/2);
       if (lyhennyspatka>k) {
         lyhennyspatka = k;
       }
       
       for (int i=0;i<lyhennyspatka;i=i+1){
          lyhennavektoreita();
          k = k - 1;
       }
      
    //  for (int ii=0;ii<4;ii=ii+1){
    //  vari[ii] = shorten(vari[ii]);
    //}
      
     } else {
       lyhennetty = 0;
   } 
     
     
      
      
      
      
    }
    
    // sivellin
      if (nappi==1) {
        paksuus =  (paksuus % 48) + 1;
      }
     
      if (nappi == 2) {
        
        varivalintamenossa = true;
      }
      
      
      if (nappi==5) {
        
        skaala = skaala - 0.05;

        if (skaala<0.4) {

          taustakuva = false;
        }
        
        if (skaala<0.01) {
          skaala = 2;
          taustakuva = true;
        }
        
      }
      
      
      if ((nappi == 6) && (!tallennettujuuri)) {
        
        tallennettujuuri = true;
        tallennetaan = true;
        
        
      }
      
      if (nappi==7) {
        
         for (int i=0;i<k;i=i+1){
           lyhennavektoreita();
         }

          k=0;

      }
      
      
      piirraviivat = true;
    
    }
  } else {
    // EI MOUSE PRESS
   if ((!tauko) && (k>0)) {
     xy[0] = append(xy[0],xy[0][k-1]);
     xy[1] = append(xy[1],xy[1][k-1]);
    // xy[0][k] = mouseX;
    // xy[1][k] = mouseY;
    
      m = append(m,0);
      
      cc = append(cc,vcc);
      
    //  for (int ii=0;ii<4;ii=ii+1){
    //    vari[ii] = append(vari[ii],vvari[ii]);
    //  }
      
      
    k=k+1;
   }
   tauko = true; 
   piirraviivat = true;
    
  }
  
  
  
  
  
  
  if (piirraviivat) {
    
    
     background(255);
    
    
    if (k>0) {
    for (int i=1;i<k;i=i+1){
      
      piirraviiva(i);
      
      
    }
    }
    taustakuvapiirto();
  
    
    // nappipiirto();  
    piirraviivat = false;
  }
  
  
  nappipiirto();
  
  if (!tauko) {
    piirtomenossa = true;
  } else {
    //nappipiirto();
  }
  
  
  piirtoesto = false;
  
  } else {
  
  
  imageMode(CORNER);
  cp.render();
  imageMode(CENTER);
  
  }
}

// *************************************************************************************************************
void taustakuvapiirto() {
// *************************************************************************************************************  
 if (taustakuva) {
   // background(255);
    
    if (!tallennetaan) {
      tint(255, 45); 
      image(img, kuvaW, kuvaH,floor(kuvaW*skaala),floor(kuvaH*skaala));
    }
    //image(img, 50, 50, 80, 80);
  }else{
    
   // background(255);
  } 
  
}
// *************************************************************************************************************


// *************************************************************************************************************
void nappipiirto() {
// *************************************************************************************************************  
  stroke(0);
  strokeWeight(1);
  fill(220);
  rect(0,0,50,550);
  for (int iii=50;iii<550;iii=iii+50){
    line(0,iii,50,iii);
  }
  fill(0);
  text("undo",25,25);
  
  
  
  text("dino",25,275);
  text("(save)",25,325);
  text("clear",25,375);
  
  
  text(mouseX,25,height-36);
  text(mouseY,25,height-17);
  
  text(k,25,475);
  
  
  //fill(vvari[0],vvari[1],vvari[2],vvari[3]);
  
  fill(vcc);
  
  rect(2,102,46,46);
  text("color",25,125);
  
  
  
  strokeWeight(paksuus);
  point(25,75);
  fill(0);
  text("size",25,75);
  text("color",25,125);
  
  
}
// *************************************************************************************************************


// *************************************************************************************************************
void piirraviiva(int i) {
// *************************************************************************************************************
 if (m[i-1]>0) {
        strokeWeight(m[i-1]);
        stroke(cc[i-1]);
        line(xy[0][i-1], xy[1][i-1], xy[0][i], xy[1][i]);
      } 
}
// *************************************************************************************************************




// *************************************************************************************************************
void lyhennavektoreita() {
// *************************************************************************************************************
       xy[0] = shorten(xy[0]);
      xy[1] = shorten(xy[1]);
      m = shorten(m);
      cc = shorten(cc); 
}
// *************************************************************************************************************

/// ****************************************** COLOR PICKER KOODIT -->
public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;
  
  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    
    cpImage = new PImage( w, h );
    
    init();
  }
  
  private void init ()
  {
    // draw color.
    
    background(255);
    
    int cw = w - 60;
    for( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;
      
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    
    // draw black/white.
    drawRect( cw, 0,   30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
    
    // draw grey scale.
    for( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );
    }
  }
  
  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  
  public void render ()
  {
    image( cpImage, x, y );
    if( mousePressed &&
  mouseX >= x && 
  mouseX < x + w &&
  mouseY >= y &&
  mouseY < y + h )
    {
      c = get( mouseX, mouseY );
      
      
      
      
      piirtoesto = true;
      varivalintamenossa = false;
      
      
      vcc = c;
      
     // vvari[0] = c;
      
      
    }
    
    fill(vcc);
    strokeWeight(1);
    rect(2,102,46,46);
    fill(0);
   // text("exit",25,125);
    
    
   // if ( mousePressed && mouseX<50 && piirtoesto) {
      
       
      
   // }
    
    // tätä ei tartte
    //fill( c );
    //rect( x, y+h+10, 20, 20 );
  }
}


