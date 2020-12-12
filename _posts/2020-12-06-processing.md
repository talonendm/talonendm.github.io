---
layout: post
title: Processing
subtitle: Video and image processing with Processing.org
tags:
  - processing 
  - video
  - image
  - mask
comments: true
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
