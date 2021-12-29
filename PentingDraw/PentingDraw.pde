/**
 NOTE: this is more "like" having fun project by implementing different features than writing a clean code for carefully designed UI/UX. 
 
 */


// -------------------------------------------
import codeanticode.tablet.*; // # * Basic Drawing with Tablet: # * by Andres Colubri.
// -------------------------------------------
// import java.util.*;
// import java.util.Arrays;
import java.util.Collections; // https://forum.processing.org/two/discussion/626/cannot-find-anything-named-collections-arraylist

// -------------------------------------------
Tablet tablet;

Table table; // drawing in csv


color taustavari;
color vari; 
int opaci;

float koko = 5; //4; //20
float minimikoko = 4; //5;
int selected_style = 2;
int n_kuvia;
int n_lines;
int tausta_muisti;
boolean noLine;

int delay_millisec_animation = 0;

boolean random_line_shake = false;

boolean laser_draw_line = false; // true;

boolean keskitaPiirustus = false;
boolean color2loweropacity = false;

float varisekoittuu = 2; // 0 ei sekoitu

// -------------------------------------------
// top rectangle :
boolean show_top_rectangle = false; //true; //false; // true;
String last_key_pressed = "";
boolean clear_screen_every_round = false; // true; //

// -------------------------------------------
boolean complete_redraw_animation = false;
int i_animation_loop = 0;
// -------------------------------------------


// todo:
// automated automation. new column. e.g. every 10th line make mark.. if undo or new page, add new.. in undo go backwords.
// faster animation steps than only 1 line

// -------------------------------------------
int fonttikoko = 18;
boolean show_font_on_line = false; //true; // false; // true;
// -------------------------------------------

// -------------------------------------------
// better tablet:
boolean additional_pen_stuff = false; // if better tablet than huion: check tablet
// -------------------------------------------

// -------------------------------------------
// Color selection variables ---------------------------
boolean varivalintamenossa;
boolean piirtoesto;
ColorPicker cp;
// -------------------------------------------


// -------------------------------------------
PImage img;
int kuvaW, kuvaH;
int kuvaskaala = 2;
String kuvatiedosto = "data/esimerkkikuva.png"; // "data/redhouse.png"; // "esimerkkikuva.png"; // use data-folder because in application it is not default folder!
boolean taustakuva0 = true;
boolean taustakuva = false; // true; // false; // true; //false;   under contruction
// -------------------------------------------

// -------------------------------------------
// line stored into class Viiva:
ArrayList<Viiva> viivat = new ArrayList<Viiva>();
// -------------------------------------------


// -------------------------------------------


// -------------------------------------------
void setup() {
  size(displayWidth, displayHeight);
  //size(480, 480);
  tablet = new Tablet(this);


  n_kuvia = 0; // total number of pages -----------

  nollaus();

  cp = new ColorPicker(0, 100, width-10-60, height-20, 255 );

  opaci = 255; // 80;
  vari = color(0, 0, 0, opaci);


  kuvaW = width/2;
  kuvaH = height/2;

  if (taustakuva0) img = loadImage(kuvatiedosto);


  table = new Table();

  table.addColumn("id");
  table.addColumn("pic");
  table.addColumn("line");
  table.addColumn("x0");
  table.addColumn("y0");
  table.addColumn("x1");
  table.addColumn("y1");
  table.addColumn("w0");
  table.addColumn("c_gray");
  table.addColumn("red");
  table.addColumn("green");
  table.addColumn("blue");
  table.addColumn("alpha");
}
// -------------------------------------------


void taustakuva_redraw(boolean redrawlines) {
  if (taustakuva) {
    tint(255, 45); 
    imageMode(CENTER);
    image(img, kuvaW, kuvaH, floor(kuvaW*kuvaskaala), floor(kuvaH*kuvaskaala));
  }

  if (redrawlines) {
    for (Viiva viiva : viivat) { 
      viiva.displayViiva(false);
    }
  }
}

// -------------------------------------------
void nollaus() {

  n_lines = 0; // number of separated lines
  n_kuvia = n_kuvia + 1; // 
  varivalintamenossa = false;
  piirtoesto = false;

  tausta_muisti = 215; // 255 = no memory, opacity
  taustavari = color(255, tausta_muisti); // 0
  fill(taustavari);
  noStroke();
  rect(0, 0, width, height);
}
// -------------------------------------------


// -------------------------------------------
void draw() {
  // Instead of mousePressed, one can use the Tablet.isMovement() method, which
  // returns true when changes not only in position but also in pressure or tilt
  // are detected in the tablet. 

  if (keskitaPiirustus) {
    centerObject();
  }

  // -----------------------------------------------------------------------------
  // Draw - pen pressed to tablet: 
  // -----------------------------------------------------------------------------
  if (complete_redraw_animation) {
    if (i_animation_loop < viivat.size()) {
      Viiva viiva = viivat.get(i_animation_loop);
      viiva.displayViiva(false);
    } else {
      complete_redraw_animation = false;
    }
    if (delay_millisec_animation>0) delay(delay_millisec_animation);

    i_animation_loop = i_animation_loop + 1;
  }
  // -----------------------------------------------------------------------------
  if (!varivalintamenossa) {
    if (mousePressed & !piirtoesto) {
      draw_drawing();



      if (color2loweropacity) {
        float redi = red(vari) + random(varisekoittuu*3) - varisekoittuu;
        float greeni = green(vari)+ random(varisekoittuu*3) - varisekoittuu;
        float bluei = blue(vari) + random(varisekoittuu*3) - varisekoittuu;
        float alphai = alpha(vari)* 0.999;
        if (redi<0) {
          redi = 0;
        }
        if (greeni<0) {
          greeni = 0;
        }
        if (bluei<0) {
          bluei = 0;
        }

        if (redi>255) {
          redi = 255;
        }
        if (greeni>255) {
          greeni = 255;
        }
        if (bluei>255) {
          bluei = 255;
        }

        // print(redi, "," + greeni + ", " + bluei + "," + alphai + "\n");
        vari = color(redi, greeni, bluei, alphai);
      }
    } else {

      // ....................................................................
      // The end of the line ------------------------------------------------      
      if (noLine) {
        noLine = false;
        if (show_font_on_line) {
          // the end of the drawn line
          textSize(fonttikoko);
          fill(55, 0, 0);
          text("e" + n_kuvia + "." + n_lines, pmouseX, pmouseY);
          fill(155, 0, 0);
          text("e" + n_kuvia + "." + n_lines, pmouseX+1, pmouseY+1);
        }
      }
      // ....................................................................

      // ....................................................................
      // The color was selected ---------------------------------------------      
      if (mousePressed & piirtoesto) {
        piirtoesto = !piirtoesto;
        // if over 0.5 second press, it will draw to         
        delay(500); // otherwise drawing
        //for (Viiva viiva : viivat) { 
        //  viiva.displayViiva(); 
        //  delay(50); // otherwise drawing .. should loop...
        //}
      }
      // ....................................................................
    }
    // -----------------------------------------------------------------------------
    // The current values (pressure, tilt, etc.) can be saved using the saveState() method
    // and latter retrieved with getSavedxxx() methods:
    //tablet.saveState();
    //tablet.getSavedPressure();
  } else {
    // color selection running:
    imageMode(CORNER);
    cp.render();
    imageMode(CENTER);
  }
}
// -------------------------------------------
void draw_drawing() {
  if (clear_screen_every_round) {
    background(taustavari);
    taustakuva_redraw(false);
  }

  // -----------------------------------------------------------------------------
  // line coordinates stored as viivat objects:
  // -----------------------------------------------------------------------------

  if (!noLine) n_lines = n_lines + 1; // lines already to object stored...

  if (laser_draw_line) {
    viivat.add(new Viiva(n_kuvia, n_lines, pmouseX, pmouseY, mouseX, mouseY, 0.01, 0, 2));  // https://processing.org/reference/ArrayList.html
  } else {
    viivat.add(new Viiva(n_kuvia, n_lines, pmouseX, pmouseY, mouseX, mouseY, minimikoko + tablet.getPressure() * koko, vari, selected_style));  // https://processing.org/reference/ArrayList.html
  }


  // -----------------------------------------------------------------------------

  // You can iterate over an ArrayList in two ways.
  // The first is by counting through the elements:
  //for (int i = 0; i < particles.size(); i++) {
  // Particle part = particles.get(i);
  // part.display();
  //}

  // The second is using an enhanced loop:
  if (clear_screen_every_round) {
    for (Viiva viiva : viivat) { 
      viiva.displayViiva(false);
    }
  } else {
    Viiva viiva = viivat.get(viivat.size()-1);
    viiva.displayViiva(false); // only last line
  }

  // -----------------------------------------------------------------------------

  // -----------------------------------------------------------
  // https://processing.org/reference/ArrayList.html
  // You can delete particles from an ArrayList with remove()
  //particles.remove(0);
  //println(particles.size()); // Now one less!

  // If you are modifying an ArrayList during the loop,
  // then you cannot use the enhanced loop syntax.
  // In addition, when deleting in order to hit all elements, 
  // you should loop through it backwards, as shown here:
  //for (int i = particles.size() - 1; i >= 0; i--) {
  // Particle part = particles.get(i);
  // if (part.finished()) {
  //  particles.remove(i);
  // }
  //}
  // -----------------------------------------------------------


  // print(size(viivat));

  // for (i = 0; i< viivat.length; i++) {
  //viivat[i]  
  // }


  

  // stroke(255);  


  if (additional_pen_stuff) {

    // Aside from tablet.getPressure(), which should be available on all pens, 
    // pen may support:
    boolean var_move = tablet.isMovement(); 
    float var_tiltX = tablet.getTiltX();
    float var_sidePressure = tablet.getSidePressure();
    float var_getRotation = tablet.getRotation();
    //tablet.getTiltX(), tablet.getTiltY() MOST PENS
    //tablet.getSidePressure() - AIRBRUSH PEN
    //tablet.getRotation() - ART or PAINTING PEN    
    // The tablet getPen methods can be used to retrieve the pen current and 
    // saved position (requires calling tablet.saveState() at the end of 
    // draw())...
    //line(tablet.getSavedPenX(), tablet.getSavedPenY(), tablet.getPenX(), tablet.getPenY());
    // ...but it is equivalent to simply use Processing's built-in mouse 
    // variables.
    //stroke(255);

    fill(0, 255, 0);
    text(var_move + ": Tilt: " + var_tiltX + ". sidePressure:" + var_sidePressure + " var_getRotation:" + var_getRotation, 30, 40);
  }


  if (!noLine) {
    // the start of the line
    textSize(fonttikoko);

    noLine = true;
    // n_lines = n_lines + 1;

    if (show_font_on_line) {
      fill(0, 55, 0);
      text("s" + n_kuvia + "." + n_lines, pmouseX, pmouseY);
      fill(0, 155, 0);
      text("s" + n_kuvia + "." + n_lines, pmouseX+1, pmouseY+1);
    }
    
    top_rectangle();
  }
}


void top_rectangle() {

  if (show_top_rectangle) {

    //noStroke();
    stroke(0);
    strokeWeight(1);

    //stroke(244, 0, 0); 
    fill(taustavari);
    rect(0, 0, width, 100);


    show_brush_palette();

    //show_last_key_pressed();

    fill(255);
    text(last_key_pressed, 100, 50);
  }
}

// -------------------------------------------
void keyPressed() {
  int keyIndex = key;
  print("Key: " + key + " Keyindex: " + keyIndex);
  last_key_pressed = key + ": " + " (index = " + str(keyIndex) + ")";



  if (key =='t') {
    taustakuva_redraw(false);
  }
  
  // TOP Rectangle -------------------------------------------
  if (key =='g') {
    background(taustavari);
    taustakuva_redraw(true);
    show_top_rectangle = !show_top_rectangle;
  }


  // -------------------------------------------
  // n: new screen
  // -------------------------------------------
  if (key == 'n' | key == 'N' | key == '3') {

    addRows2table();
    print("\nViivat added to table");

    viivat.clear();
    nollaus();
  } 


  // -------------------------------------------
  // if large vector, then refresh manually after undo
  // -------------------------------------------
  if (key == 'r' | key == 'R') {
    background(taustavari);
    taustakuva_redraw(true);
  }
  // -------------------------------------------


  // -------------------------------------------
  // color:
  // -------------------------------------------
  if (key == 'c' | key == 'C' | key == '1') {
    // vari = color(255, 0, 0, opaci);


    varivalintamenossa = !varivalintamenossa;  // on or cancel selection

    if (!varivalintamenossa) {
      piirtoesto = true;
      // varivalintamenossa = false;

      // clear selection and redraw drawing: ---------------------------------
      background(taustavari);
      taustakuva_redraw(true);
    }
  }
  // -------------------------------------------



  // -------------------------------------------
  // center picture:
  // -------------------------------------------
  if (key == 'o') {


    taustakuva_redraw(true);
    keskitaPiirustus = true;
  }

  // -------------------------------------------
  // size of brush: -/+
  // -------------------------------------------
  if (keyIndex == 43) { 
    koko = koko + 1;
    top_rectangle();
  }
  if (keyIndex == 45) { 
    koko = koko - 1; 
    if (koko<1) koko = 1;
    top_rectangle();
  }
  if (key == 'B') { 
    minimikoko = minimikoko + 1;
    top_rectangle();
  }
  if (key == 'b') { 
    minimikoko = minimikoko - 1; 
    if (minimikoko<1) minimikoko = 1;
    top_rectangle();
  }

  if (key == 'p') {
    taustakuva = !taustakuva;
  }



  // -------------------------------------------

  // -------------------------------------------
  // animation: a
  // -------------------------------------------
  if (key == 'a'| key == 'A') { 
    background(255); 
    i_animation_loop=0; 
    complete_redraw_animation = true;
  }
  // -------------------------------------------


  if (key == '8') { 
    for (Viiva viiva : viivat) { 
      viiva.sizeChange(0.95);
    }
    taustakuva_redraw(true);

    keskitaPiirustus = true;
  }

  if (key == '9') { 
    for (Viiva viiva : viivat) { 
      viiva.sizeChange(1.05);
    }
    taustakuva_redraw(true);
    keskitaPiirustus = true;
  }


  // -------------------------------------------
  // any lines on screen?
  // -------------------------------------------
  if (viivat.size()>0) {
    // -------------------------------------------
    // undo first line
    // -------------------------------------------
    if (keyIndex == 118 | key == 'v' | key == 'V' | key == '2') { 
      Viiva viiva = viivat.get(0);
      viiva.displayViiva(true);
      viivat.remove(0);
      //background(taustavari);
      //taustakuva_redraw(true);
    }
    // -------------------------------------------'
    // undo last drawn line
    // -------------------------------------------
    if (keyIndex == 117 | key == 'u' | key == 'U' | key == '4') { 
      // undo last
      Viiva viiva = viivat.get(viivat.size()-1);
      viiva.displayViiva(true);
      viivat.remove( viivat.size()-1);
      //background(taustavari);
      //taustakuva_redraw(true);
    }
  }


  if (key == 'l') {
    laser_draw_line = !laser_draw_line;
  }

  // -------------------------------------------
  // s: save image as png
  // -------------------------------------------
  if (key == 'S') { 
    String datestr =String.valueOf(year()) + "_" + String.valueOf(String.format("%02d", month())) + "_" + String.valueOf(day()) + String.valueOf(hour()) + String.valueOf(minute()) + String.valueOf(second());
    print("\n.......................\n");
    print("saving csv all:" + datestr + "\n");


    if (viivat.size()>0) {
      addRows2table();
      print("\nViivat added to table");

      viivat.clear();
      nollaus();
      print("new page and stored to table before saving\n");
    } else {
      print("no lines in last page . ok\n");
    }

    saveTable(table, "savedData/" + datestr + "pen.csv");

    print("saved:" + datestr + "\n");
    print(".......................\n");
  }

  if (keyIndex == 115 | key == 's') { 
    String datestr =String.valueOf(year()) + "_" + String.valueOf(String.format("%02d", month())) + "_" + String.valueOf(day()) + String.valueOf(hour()) + String.valueOf(minute()) + String.valueOf(second());


    print(".......................\n");
    save("savedpics/" + datestr + " pen.png");
    print("saved png:" + datestr + "\n");
  }
}
// -------------------------------------------


void addRows2table() {

  for (int i = 0; i < viivat.size(); i++) {
    Viiva viiva = viivat.get(i);
    TableRow newRow = table.addRow();
    newRow.setInt("id", table.getRowCount() - 1);
    newRow.setInt("pic", viiva.kuvia);
    newRow.setInt("line", viiva.lines);
    newRow.setInt("x0", viiva.x0);
    newRow.setInt("y0", viiva.y0);
    newRow.setInt("x1", viiva.x1);
    newRow.setInt("y1", viiva.y1);
    newRow.setFloat("w0", viiva.w0);

    int c_gray = round((red(viiva.c) + green(viiva.c) + blue(viiva.c))/3);
    int c_red = round(red(viiva.c));
    int c_green = round(green(viiva.c));
    int c_blue = round(blue(viiva.c));
    
    newRow.setInt("c_gray", c_gray);
    newRow.setInt("red", c_red);
    newRow.setInt("green", c_green);
    newRow.setInt("blue", c_blue);
    
    int alpha = 0;
    newRow.setInt("alpha", alpha);
    
  }
}


// -------------------------------------------------------------
// Re-center vector drawing: -----------------------------------
// -------------------------------------------------------------
void centerObject() {
  int min_x = width;
  int max_x = 0;
  int min_y = height;
  int max_y = 0;

  for (int i = 0; i < viivat.size(); i++) {
    Viiva viiva = viivat.get(i);

    // x:
    if (viiva.x0 < min_x) min_x = viiva.x0;
    if (viiva.x1 < min_x) min_x = viiva.x1;

    if (viiva.x0 > max_x) max_x = viiva.x0;
    if (viiva.x1 > max_x) max_x = viiva.x1;

    // y:
    if (viiva.y0 < min_y) min_y = viiva.y0;
    if (viiva.y1 < min_y) min_y = viiva.y1;

    if (viiva.y0 > max_y) max_y = viiva.y0;
    if (viiva.y1 > max_y) max_y = viiva.y1;
  }

  background(taustavari);
  taustakuva_redraw(true);

  // update line coordinates:
  for (int i = 0; i < viivat.size(); i++) {
    Viiva viiva = viivat.get(i);
    viiva.centerlines(min_x, max_x, min_y, max_y);
  }

  // Area of the selection:
  strokeWeight(1);
  stroke(0, 255, 0, 20);
  noFill();
  rect(min_x, min_y, max_x - min_x, max_y - min_y);  // 3rd and 4th parameter are defining the size of the rect
  keskitaPiirustus = false;
}
// -------------------------------------------------------------
// |
// |
// |
// |
// |
// |
// |
// |
// |
// -------------------------------------------
// Line / Viiva object:
// -------------------------------------------
class Viiva {

  int x0, y0, x1, y1;
  float w0, w1;
  color c;
  int s; // style
  int kuvia;
  int lines;

  Viiva(int kuvia_, int lines_, int x0_, int y0_, int x1_, int y1_, float w0_, color c_, int s_) {
    x0 = x0_;
    y0 = y0_;
    x1 = x1_;
    y1 = y1_;
    w0 = w0_;
    c = c_;
    s = s_;
    kuvia = kuvia_;
    lines = lines_;
  }
  // -------------------------------------------
  // Show or delete line: (undo)
  // -------------------------------------------
  void displayViiva(boolean kumitus) {
    stroke(c);
    strokeWeight(minimikoko + koko * w0);

    float rx0 = 0;
    float ry0 = 0;
    float rx1 = 0;
    float ry1 = 0;

    if (random_line_shake) {
      rx0 = random(-5, 5);
      ry0 = random(-5, 5);
      rx1 = random(-5, 5);
      ry1 = random(-5, 5);
    }

    // -------------------------------------------
    // 1 = experimental line style
    // -----------------------------------------------------------------------------
    if (s == 1) {


      if (kumitus) stroke(taustavari); 
      else stroke(c, 50);
      strokeWeight(1 * w0);
      line(x0+rx0, y0+ry0, x1+rx1, y1+ry1);

      strokeWeight(0.7 * w0);
      line(x0+rx0, y0+ry0, x1+rx1, y1+ry1);

      strokeWeight(0.5 * w0);
      line(x0+rx0, y0+ry0, x1+rx1, y1+ry1);

      strokeWeight(0.1 * w0);
      line(x0+rx0, y0+ry0, x1+rx1, y1+ry1);
    } else if (s == 2) {

      if (kumitus) stroke(taustavari); 
      else stroke(c);
      strokeWeight(w0);
      // line(pmouseX, pmouseY, mouseX, mouseY);
      line(x0+rx0, y0+ry0, x1+rx1, y1+ry1);
    }
    // -----------------------------------------------------------------------------
  }


  void centerlines(int min_x, int max_x, int min_y, int max_y) {

    x0 = x0 - min_x + ((width - max_x) + min_x)/2;
    x1 = x1 - min_x + ((width - max_x) + min_x)/2;

    y0 = y0 - min_y + ((height - max_y) + min_y)/2;
    y1 = y1 - min_y + ((height - max_y) + min_y)/2;


    //x0 = x0 - 0 + int((min_x - (width - max_x))*0.5);
    //x1 = x1 - 0 + int((min_x - (width - max_x))*0.5);

    //y0 = y0 - 0 + int((min_y - (height - max_y))*0.5);
    //y1 = y1 - 0 + int((min_y - (height - max_y))*0.5);
  }


  void sizeChange(float kerroin) {
    x0 = round(x0*kerroin);
    x1 = round(x1*kerroin);
    y0 = round(y0*kerroin);
    y1 = round(y1*kerroin);
  }
}


// ----------------------------------------------------
void show_brush_palette() {

  fill(vari);
  strokeWeight(1);
  if (laser_draw_line) {
    point(50, 50); 
    text("laser", 60, 50);
  } else {
    ellipse(50, 50, minimikoko + koko, minimikoko + koko);
    ellipse(50, 50, minimikoko, minimikoko);
  }
}
// ----------------------------------------------------



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
    // ----------------------------------------------------
    int cw = w - 60;
    for ( int i=0; i<cw; i++ ) 
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
    drawRect( cw, 0, 30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );

    // draw grey scale.
    for ( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }
  // ----------------------------------------------------
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
  // ---------------------------------------------------- color selection rect
  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for (int i=rx; i<rx+rw; i++) 
    {
      for (int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  // ----------------------------------------------------
  public void render ()
  {
    image( cpImage, x, y );
    if ( mousePressed &&
      mouseX >= x && 
      mouseX < x + w &&
      mouseY >= y &&
      mouseY < y + h )
    {
      c = get( mouseX, mouseY );
      piirtoesto = true;
      // varivalintamenossa = false;
      vari = c;
      // clear selection and redraw drawing: ---------------------------------
      // background(taustavari);
      // for (Viiva viiva : viivat) { 
      //   viiva.displayViiva();
      // }
    }
    top_rectangle();
  }
  // ----------------------------------------------------
}
// ----------------------------------------------------
