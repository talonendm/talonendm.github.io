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

// tallennus manual
var enabletallennusnimi = true;
var tallennusnimi = "kirjanpito";
var tallennusnumero = 1;

let input;
let img;
var tiedostonimi = "";
var z0 = 0.7; // 0.7;
var z;
var x = 0;
var y = 0;
var a = 0;
let iw = 384;
let ih = 384;
var nayta = true;
var tallenna = false;

// copy
// var copyteksti = "\u00A9 ta.dm 2023";
var copyteksti = "\u00A9      2023";
var copyteksti2 = "talon\nendm" 
var copysize = 14;
var infotekstisize = 16;

// called once
function setup() {

//createCanvas(640, 640);
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
  background(155);
  
  push();
  if (img) {
    
    translate(x,y);
    rotate(a);
    image(img, 0, 0, img.width*z, img.height*z); // , width, height);
    
  }
  pop();
  
  
  
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
    let infonaytateksti = x + "," + y + ":(" + le + "," + ko +") zoom: " + round(z*100) + "%";
    
  if (enabletallennusnimi) {
    infonaytateksti = infonaytateksti + " framesave:" + tallennusnumero
  }

    text(infonaytateksti, 0, 0);
    
    if (iw>le+x | ih>ko+y | x>0 | y>0) {
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    text(infonaytateksti, 1, 1);
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
  
  if (key == 'i') {
    nayta = !nayta;
  }
  
  if (key == "r") {

    let maxcanvasmaara = 3;

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
    } else {
      resizeCanvas(windowWidth, windowHeight);
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
    //saveCanvas("e-" + tiedostonimi, 'jpg');
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


# Keys

- z, x: Zoom
- c, v: Rotate - Angle
- s: save
- e: use frame numbering
- r: resize Canvas
- -: frame -1
- +: frame +1
- i: show info

# Links

- test: available in [p5editor](https://editor.p5js.org/haques/sketches/c821CzPas)
- [Forest Story](https://talonendm.github.io/ballrotation/foreststory/)


### Vastuuvapauslauseke

> Tieto ja huolellisuus,
Virheet silti aiheuttavat tuskaa,
Muutoksia uskallamme tehdä.

Tämä julkaisu on tehty parhaan oman tietämyksemme ja ymmärtämyksemme pohjalta. Olemme tehneet kaiken voitavamme tietojen täsmällisyyden ja oikeellisuuden takaamiseksi, [talonendm](https://talonendm.github.io/) ei ole vastuussa mistään virheistä tai puutteista tai mistään suorasta, epäsuorasta tai välillisestä
vahingosta, joka on aiheutunut tietojen virheellisestä soveltamisesta. Pidätämme oikeuden muutoksiin.

### Disclaimer

> Our knowledge and care,
May errors still cause despair,
Changes we may dare.

This publication has been made based on our best knowledge and understanding. We have done everything in our power to ensure the accuracy and correctness of the information.[talonendm](https://talonendm.github.io/) is not responsible for any errors or omissions or for any direct, indirect, or consequential damages arising from the incorrect application of the information. We reserve the right to make changes.