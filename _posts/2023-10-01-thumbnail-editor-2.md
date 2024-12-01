---
layout: post
title: Thumbnail Editor
subtitle: edit pics
tags:
  - Thumbnail
  - editor
  - p5js
comments: false
cover-img: /assets/pics/page/lego/dudes.jpg
thumbnail-img: /assets/pics/thumbnail/photo/e384/e-amigadisk.jpg
published: true
---


> Creating small gems,
Thumbnails that capture the eye,
Art in tiny form.


<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/addons/p5.dom.min.js"></script> 
<div id="sketch-holder-jt-xml"></div>

<script>

//dom // this probably needed if objects created in js

// P5editor experiments: https://editor.p5js.org/haques/sketches/uVHB7Bf4a  231001


window.addEventListener('keydown', function(e) {
  if(e.keyCode == 32 && e.target == document.body) {
    e.preventDefault();
  }
});


// space 32: https://stackoverflow.com/questions/22559830/html-prevent-space-bar-from-scrolling-page
// https://stackoverflow.com/questions/18522864/disable-scroll-down-when-spacebar-is-pressed-on-firefox/18525368


// based on assets/local_imageModification.html
// ta.dm 2023 thumbnail editor
// 1.9.2023: 1080 x 1080 added Instagram Post	1080 x 1080 (1:1 ratio)
// .........................................................

// tallennus manual
// key: e
var enabletallennusnimi = false;
var tallennusnimi = "pic";
var tallennusnumero = 1;
var niminum = 1;

let input;
let img;
var tiedostonimi = "";
var z0 = 0.7; // 0.7;
var z;p5
var x = 0;
var y = 0;
var a = 0;
let iw = 384;
let ih = 384;
var nayta = true;
var tallenna = false;
var tallennaS = false;
var canvaskoko = 1;
var uselargecanvassetup = false;

// copy
// var copyteksti = "\u00A9 ta.dm 2023";

// Create a new Date object
let currentDate = new Date();

// Get the current year
let currentYear = currentDate.getFullYear();

var copyteksti = "\u00A9      " + currentYear;
var copyteksti2 = "talon\nendm" 
var copynum = 1;
var copysize = 14;
var infotekstisize = 16;

var fillColor = [255, 255, 255]; // Fill color (red in RGB)
var pte = 100; // 50;
var piirra = true;


let lc; // largeCanvas;


// called once
function setup() {

//createCanvas(640, 640);

  lc = createGraphics(3840, 2160);

  const canvas = createCanvas(iw, ih);
  canvas.parent('sketch-holder-jt-xml')
  input = createFileInput(handleFile);
  input.position(0, ih + 200);
  z = z0;
  // const canvas = createCanvas(windowWidth*0.7, 400);
  // canvas.parent('sketch-holder-jt-xml')
  
  frameRate(30); // no need to have 60.
}

function draw() {
  
  
  if (piirra) {
  
  background(155);
  
  
  if (img) {
    
    push();
    translate(x,y);
    rotate(a);

    
    scale(z);  // Scale the image by zoom factor 'z'

    if (uselargecanvassetup) {
      scale(0.2); // additional scale 5 times smaller
    }


    // image(img, 0, 0, img.width*z, img.height*z); // , width, height);
    image(img, 0, 0, img.width, img.height); 
    pop();


    lc.push();  // Save the current state of lc (so transformations don't affect future drawing)
    lc.translate(x, y);  // Apply the same translation
    lc.rotate(a);  // Apply the same rotation
    lc.scale(z);  // Apply the same scaling

    lc.image(img, 0, 0, lc.width, lc.height);

    lc.pop();  // Restore previous state of lc
    
  }
  
  
  
  
  textSize(copysize);
  textAlign(RIGHT,BOTTOM);
  fill(30);
  text(copyteksti, iw-1-2,ih-1);
  fill(150,150);
  text(copyteksti, iw-2,ih);
  
  textSize(copysize/2+1);
  textAlign(CENTER,BOTTOM);
  fill(30);
  text(copyteksti2, iw-1-2-44,ih-1);
  fill(150,150);
  text(copyteksti2, iw-2-44,ih);
  
  if (nayta & tiedostonimi != "" & !tallenna) {
    textAlign(LEFT,TOP);
    fill(50,150);
    textSize(infotekstisize);
    
    let le = round(img.width*z);
    let ko = round(img.height*z);
    let infonaytateksti = x + "," + y + ":(" + le + "," + ko +") zoom: " + round(z*100) + "%" + " (c" + canvaskoko + ": " + iw + "x" + ih + ")";
    
  if (enabletallennusnimi) {
    infonaytateksti = infonaytateksti + " framesave:" + "e-" + tallennusnimi + zeroPad(tallennusnumero, 4);
  }

    text(infonaytateksti, 0, 0);
    
    if (iw>le+x | ih>ko+y | x>0 | y>0) {
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    text(infonaytateksti, 1, 1);
  }


  }

  if (tallenna) {
    tallenna = false;

  if (tallennaS) {
    tallennaS = false;
       if (enabletallennusnimi) {
      saveCanvas(lc,
        "large-" + tallennusnimi + "-" + zeroPad(tallennusnumero, 4),
        "jpg"
      );
    } else {
      saveCanvas(lc, "large-" + tiedostonimi, "jpg");
    }
  } else {

       if (enabletallennusnimi) {
      saveCanvas(
        "e-" + tallennusnimi + "-" + zeroPad(tallennusnumero, 4),
        "jpg"
      );
    } else {
      saveCanvas("e-" + tiedostonimi, "jpg");
    }
  }
  }


}


// https://stackoverflow.com/questions/2998784/how-to-output-numbers-with-leading-zeros-in-javascript
function zeroPad(num, places) {
  var zero = places - num.toString().length + 1;
  return Array(+(zero > 0 && zero)).join("0") + num;
}


function handleFile(file) {
  print(file);
  tiedostonimi = file.name;
  print(tiedostonimi);
  x = 0;
  y = 0;
  z = z0;
  a = 0;
  if (file.type === 'image') {
    img = createImg(file.data, '');
    img.hide();
  } else {
    img = null;
  }
}

function keyPressed() {

 if (key == 'e') {
    enabletallennusnimi = !enabletallennusnimi;
  }

  if (key == 'z') {
    z = z - 0.05;
  }
  if (key == 'x') {
    z = z + 0.05;
  }
   if (key == 'c') {
    a = a - 0.01;
  }
  if (key == 'v') {
    a = a + 0.01;
  }

  if (key == 'o') { // 112 is the key code for F1
    //console.log('F1 key is pressed');
    // Perform actions when F1 is pressed
    fill(255);
    noStroke();
    ellipse(mouseX, mouseY, 40, 40);
    
  }
  
  if (key == 'i') {
    nayta = !nayta;
  }


  if (key == 'L') {
    uselargecanvassetup = !uselargecanvassetup;
  }


  if (key == "w") {
    // watermark

    let maxcopynum = 4;

    copynum = copynum + 1;
    if (copynum > maxcopynum) copynum = 1;

    if (copynum == 1) {
      # currentYear = currentDate.getFullYear();
      copyteksti = "\u00A9      " + currentYear;
      copyteksti2 = "talon\nendm" 
    } else if (copynum == 2) {
      copyteksti = "\u00A9      " + currentYear;
      copyteksti2 = "vaaka\nruode" 
    } else if (copynum == 3) {
      copyteksti = "\u00A9      " + currentYear;
      copyteksti2 = "rafla\nsafka" 
    } else {
      copyteksti = "";
      copyteksti2 = ""; 
    }
  }


  if (key == "t") {
    // tallennusnimi

    let maxniminum = 4;

    niminum = niminum + 1;
    if (niminum > maxniminum) niminum = 1;

    if (niminum == 1) {
      tallennusnimi = "pic";
    } else if (niminum == 2) {
      tallennusnimi = "art";
    } else if (niminum == 3) {
      tallennusnimi = "vaaka";
    } else {
      tallennusnimi = "";
    }
  }

  if (key == 'å') {
    piirra = !piirra;
  }

  if (key == 'p') {
    floodFill(mouseX, mouseY, fillColor);
  }

  if (key == "r") {

    let maxcanvasmaara = 9;

    canvaskoko = canvaskoko + 1;
    if (canvaskoko > maxcanvasmaara) canvaskoko = 1;

    if (canvaskoko == 1) {
      iw = 384;
      ih = 384;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 2) {
      iw = 640;
      ih = 384;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 3) {
      iw = 384;
      ih = 640;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 4) {
      iw = 640;
      ih = 640;
      resizeCanvas(iw, ih);

    } else if (canvaskoko == 5) {
      iw = 1024;
      ih = 384;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 6) {
      iw = 1024;
      ih = 1024;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 7) {
      iw = 1080;
      ih = 1080;
      resizeCanvas(iw, ih);
    } else if (canvaskoko == 8) {
      iw = 3840/5;
      ih = 2160/5;
      resizeCanvas(iw, ih);
    } else {
      resizeCanvas(lc.width, lc.height);
    }
  }

  if (key == "-") {
    tallennusnumero = tallennusnumero - 1;
  }
  if (key == "+") {
    tallennusnumero = tallennusnumero + 1;
  }

  if (key == "s") {
    // saveCanvas('auringonkukka', 'jpg');
    // saveCanvas("e-" + tiedostonimi, 'jpg');
    tallenna = true;
    tallennaS = false;
    //saveCanvas("e-" + tiedostonimi, 'jpg');
  }


  if (key == 'S') {
    // saveCanvas('auringonkukka', 'jpg');
    // saveCanvas("e-" + tiedostonimi, 'jpg');
    tallenna = true;
    tallennaS = true;
    //saveCanvas("e-" + tiedostonimi, 'jpg');
  }
  if (key == 'a') {
    // saveCanvas('auringonkukka', 'jpg');
    // saveCanvas("e-" + tiedostonimi, 'jpg');
    //saveCanvas("a-" + tiedostonimi, 'jpg');
  }
}

function mouseDragged() {
  x = x - (pmouseX - mouseX);
  y = y - (pmouseY - mouseY);
}

function floodFill(x, y, fillColor) {
  loadPixels();
  let targetColor = get(x, y);

  if (!colorsMatch(targetColor, fillColor)) {
    let stack = [];
    stack.push([x, y]);

    while (stack.length > 0) {
      let [px, py] = stack.pop();
      if (px >= 0 && px < width && py >= 0 && py < height) {
        let index = (py * width + px) * 4;
        if (colorsMatch(targetColor, pixels.slice(index, index + 3))) {
          pixels[index] = fillColor[0];
          pixels[index + 1] = fillColor[1];
          pixels[index + 2] = fillColor[2];
          stack.push([px + 1, py]);
          stack.push([px - 1, py]);
          stack.push([px, py + 1]);
          stack.push([px, py - 1]);
        }
      }
    }

    updatePixels();
  }
}

function colorsMatch(color1, color2) {
  //return color1[0] === color2[0] && color1[1] === color2[1] && color1[2] === color2[2];
  
  return (abs(color1[0] - color2[0]) < pte) && 
          (abs(color1[1] - color2[1])<pte) && 
    (abs(color1[2] - color2[2])<pte);
  
}



// https://github.com/jekyll/jemoji
// If you are using a Jekyll version less than 3.5.0, use the gems key instead of plugins.

</script>


A thumbnail editor is a software tool that is designed to create, edit, and modify thumbnail images. Thumbnail images are small images that are used to represent larger images or videos. These images are often used on websites, in video sharing platforms, and in social media platforms.

A thumbnail editor typically allows users to select an image or video file, and then create a thumbnail image from that file. The user can then edit and modify the thumbnail image using a variety of tools, such as resizing, cropping, adding text or graphics, adjusting the colors or contrast, and more.


# Keys

- z, x: Zoom
- c, v: Rotate - Angle
- s: save
- S: save large canvas
- L: use large canvas setup (additional scale to visible canvas by 0.2)
- e: use frame numbering
- r: resize Canvas
- -: frame -1
- +: frame +1
- i: show info
- å: start painting .. no loop
  - p: paint
  - o: white ellipse


# Code snippets

Note, paint not working properly.

~~~
function floodFill(x, y, fillColor) {
  loadPixels();
  let targetColor = get(x, y);

  if (!colorsMatch(targetColor, fillColor)) {
    let stack = [];
    stack.push([x, y]);

    while (stack.length > 0) {
      let [px, py] = stack.pop();
      if (px >= 0 && px < width && py >= 0 && py < height) {
        let index = (py * width + px) * 4;
        if (colorsMatch(targetColor, pixels.slice(index, index + 3))) {
          pixels[index] = fillColor[0];
          pixels[index + 1] = fillColor[1];
          pixels[index + 2] = fillColor[2];
          stack.push([px + 1, py]);
          stack.push([px - 1, py]);
          stack.push([px, py + 1]);
          stack.push([px, py - 1]);
        }
      }
    }

    updatePixels();
  }
}
~~~


~~~
function colorsMatch(color1, color2) {
  //return color1[0] === color2[0] && color1[1] === color2[1] && color1[2] === color2[2];

  return (
    abs(color1[0] - color2[0]) < pte &&
    abs(color1[1] - color2[1]) < pte &&
    abs(color1[2] - color2[2]) < pte
  );
}
~~~

# Links

- test: available in [p5editor](https://editor.p5js.org/haques/sketches/c821CzPas)
- [Forest Story](https://talonendm.github.io/ballrotation/foreststory/)

---

[Disclaimer](https://talonendm.github.io/disclaimer)


