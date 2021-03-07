---
layout: post
title: Processing
subtitle: Video and image processing with Processing.org
tags:
  - Processing 
  - video
  - image
  - mask
  - chess
comments: false
cover-img: /assets/pics/cover/photo/deers2.JPG
thumbnail-img: /assets/pics/thumbnail/instagram/IMG_20160610_161421.jpg
published: true
---

# Processing

## Capture picture

~~~
code
~~~

## Capture pictures from Video

Code snippet, which save and edit frames from video to local drive. 


~~~
import processing.video.*;
Movie myMovie;
int x = 0;
int maxloop = 450; // 80;
int startloop = 50;
//Pimage photo;
PImage photo, maskImage;
void setup() {
  // size(640, 360);
  //size(360, 640);

  background(0);
  size(360, 500);
  maskImage = loadImage("karate-mask.png");
  // myMovie = new Movie(this, "skootti.mp4");   // 
  myMovie = new Movie(this, "karate.mp4");
  myMovie.play();
}

void draw() {

  // background(255); // take this out.. get smooth
  photo = myMovie; //image(myMovie, 0, 0);

  //  print(photo.width);
  // tint(50);

  if (x>1) {
    // photo.mask(maskImage);


    // image(myMovie, 0, 0);


  // https://forum.processing.org/one/topic/how-to-change-the-color-of-each-pixel-in-an-image.html
    image(photo, 0, 0);
    
    loadPixels(); 
    photo.loadPixels(); 
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int loc = x + y*width;

        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        float r = red(photo.pixels[loc]);
        float g = green(photo.pixels[loc]);
        float b = blue(photo.pixels[loc]);

        // print(r + "," + g + " .." );


        if (r<200 | g < 200 | b < 200) {
          pixels[loc] =  color(255, 0, 0);
        } else {
          
          // not working?
          //pixels[loc] =  color(255, 255, 255, 255);
          
          // https://processing.org/discourse/beta/num_1191532471.html
          // white background is ok.
        }
      }
    }

    updatePixels();
  }
  




  if (x < maxloop) {
    // line(x, 0, x, 100);
    x = x + 1;
  } else {
    noLoop();
  }
  // Saves each frame as line-000001.png, line-000002.png, etc.

  if (x>=startloop) {
    saveFrame("outputKarate2/karate-######.png");
  }
}

void movieEvent(Movie m) {
  m.read();
}

// https://processing.org/reference/saveFrame_.html
// https://forum.processing.org/one/topic/how-can-i-save-a-frame-of-video-without-drawing-it-on-the-screen.html

~~~


<!-- smile faces
https://www.w3schools.com/charsets/ref_emoji_smileys.asp 
https://www.w3schools.com/charsets/tryit.asp?deci=128512 -->

# Computer Graphics
In the end of 80s and on 90s it was recommendable to sketch on paper before implementing Simon's Basic code or use some editor. 
However, drawing straight lines was easy with joystic and keyboard &#128512;. 
![snoopy](/assets/pics/page/screenshot/snoopy_computergraphics.jpg){: .mx-auto.d-block :}

## Chess - Create image and store it to a local drive

![chess](/assets/cutter/shakki3p.jpg){: .mx-auto.d-block :}

Processing code "shakki.pde":

~~~
final int lisa  = 16;
final int lisareuna = 10;
final int WIDTH = 600+1+lisa*2;
final int HEIGHT = 600+1+lisa*2;
final int BLOCKX = (WIDTH-1-lisa*2) / 8;
final int BLOCKY = (HEIGHT-1-lisa*2) / 8;
final int pyoreys = 3;
final int lisasiirto = 3;
int lauta = 1;


// processing size provided here nowadays! [2021]
// output here: git\talonendm.github.io\assets\cutter
public void settings() {
  size(602, 602);
}

void setup() {
  //  if (lauta == 1) {
  //   size(602, 602);
  //  } else {
  //    size(WIDTH, HEIGHT);
  //  }
  noLoop();
}

void draw() {
  background(0, 0, 0);

  if (lauta == 1) {

    for (int i = 0; i < 8; i ++) {
      for (int j = 0; j < 8; j ++) {
        if ((i + j + 1) % 2 == 0) {
          fill(255, 255, 255); // white
          rect(i * BLOCKX+lisasiirto, j * BLOCKY+lisasiirto, BLOCKX-lisasiirto*2, BLOCKY-lisasiirto*2, pyoreys);  
          fill(0, 0, 0); // black
          rect(i * BLOCKX+pyoreys+lisasiirto, j * BLOCKY+pyoreys+lisasiirto, BLOCKX-pyoreys*2-lisasiirto*2, BLOCKY-pyoreys*2-lisasiirto*2, pyoreys);
        } else {
          fill(0, 0, 0); // black
          rect(i * BLOCKX, j * BLOCKY, BLOCKX, BLOCKY, pyoreys); 
          fill(255, 255, 255); // black
          rect(i * BLOCKX+pyoreys, j * BLOCKY+pyoreys, BLOCKX-pyoreys*2, BLOCKY-pyoreys*2, pyoreys);
        }
      }
    }
  }
  if (lauta == 2) {
    fill(0);
    rect(1, 1, WIDTH-2, HEIGHT-2, 5);
    rect(1+lisareuna, 1+lisareuna, WIDTH-2-lisareuna*2, HEIGHT-2-lisareuna*2, 3);
    for (int i = 0; i <= 8; i ++) {
      for (int j = 0; j <= 8; j ++) {
        fill(255, 55, 255);
        stroke(255);
        line(i * BLOCKX+lisa, lisa, i * BLOCKX+lisa, HEIGHT-lisa-1);
        line(lisa, j * BLOCKX+lisa, WIDTH-lisa-1, j * BLOCKX+lisa);
      }
    }
  }
  println("READY");
}
void mousePressed() {
  save("shakki3.jpg");
  exit();
  println("SAVED");
}


~~~


