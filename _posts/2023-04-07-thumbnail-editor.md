---
layout: post
title: Thumbnail Editor
subtitle: edit pics
tags:
  - Thumbnail
  - editor
comments: false
cover-img: /assets/pics/page/lego/dudes.jpg
thumbnail-img: /assets/pics/thumbnail/photo/e384/e-amigadisk.jpg
published: true
---


<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/addons/p5.dom.min.js"></script> 
<div id="sketch-holder-jt-xml"></div>

<script>

//dom // this probably needed if objects created in js


window.addEventListener('keydown', function(e) {
  if(e.keyCode == 32 && e.target == document.body) {
    e.preventDefault();
  }
});


// space 32: https://stackoverflow.com/questions/22559830/html-prevent-space-bar-from-scrolling-page
// https://stackoverflow.com/questions/18522864/disable-scroll-down-when-spacebar-is-pressed-on-firefox/18525368


// based on assets/local_imageModification.html
// ta.dm 2023 thumbnail editor
// .........................................................

let input;
let img;
var tiedostonimi = "";
var z = 0.7;
var x = 0;
var y = 0;
var a = 0;
let iw = 384;
let ih = 384;
var nayta = true;
var tallenna = false;


// called once
function setup() {

//createCanvas(640, 640);
  const canvas = createCanvas(iw, ih);
  canvas.parent('sketch-holder-jt-xml')
  input = createFileInput(handleFile);
  input.position(0, ih);

  // const canvas = createCanvas(windowWidth*0.7, 400);
  // canvas.parent('sketch-holder-jt-xml')
  
  frameRate(30); // no need to have 60.
}

function draw() {
  background(155);
  
  push();
  if (img) {
    
    translate(x,y);
    rotate(a);
    image(img, 0, 0, img.width*z, img.height*z); // , width, height);
    
  }
  pop();
  
  
  textAlign(RIGHT,BOTTOM);
  fill(30);
  text("\u00A9 ta.dm 2023", iw-1-2,ih-1);
  fill(150,150);
  text("\u00A9 ta.dm 2023", iw-2,ih);
  
  if (nayta & tiedostonimi != "" & !tallenna) {
    textAlign(LEFT,TOP);
    fill(50,150);
    
    let le = round(img.width*z);
    let ko = round(img.height*z);
    text(x + "," + y + ":(" + le + "," + ko +")", 0, 0);
    
    if (iw>le+x | ih>ko+y | x>0 | y>0) {
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    text(x + "," + y + ":(" + le + "," + ko +")", 1, 1);
  }

  if (tallenna) {
    tallenna = false;
    saveCanvas("e-" + tiedostonimi, 'jpg');
  }
}

function handleFile(file) {
  print(file);
  tiedostonimi = file.name;
  print(tiedostonimi);
  x = 0;
  y = 0;
  z = 1;
  a = 0;
  if (file.type === 'image') {
    img = createImg(file.data, '');
    img.hide();
  } else {
    img = null;
  }
}

function keyPressed() {
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
  
  if (key == 'i') {
    nayta = !nayta;
  }
  
  if (key == 's') {
    // saveCanvas('auringonkukka', 'jpg');
    // saveCanvas("e-" + tiedostonimi, 'jpg');
    tallenna = true;
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




// https://github.com/jekyll/jemoji
// If you are using a Jekyll version less than 3.5.0, use the gems key instead of plugins.

</script>


# Services

- test: available in [p5editor](https://editor.p5js.org/haques/sketches/c821CzPas)