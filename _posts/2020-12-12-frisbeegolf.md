---
layout: post
title: Frisbee Golf
subtitle: p5.js tips - video
tags:
  - js
  - p5
  - video
  - Frisbeegolf
comments: false
cover-img: /assets/pics/cover/photo/cottage.JPG
thumbnail-img: /assets/pics/thumbnail/instagram/IMG_20160717_112037.jpg
published: true
---

# Frisbeegolf

F

R

I 

S 

B 

E 

E 

G 

O 

L  
 
F 














2 

0 

2 

0 





<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/addons/p5.dom.min.js"></script> 

<script>

//dom // this probably needed if objects created in js


window.addEventListener('keydown', function(e) {
  if(e.keyCode == 32 && e.target == document.body) {
    e.preventDefault();
  }
});


let playing = false;
let fingers;
let button;





function setup() {
// <div id="sketch-holder-jt-video"></div>

 //  const canvas = createCanvas(1080, 1920);
 // canvas.parent('sketch-holder-jt-video')
  canvas = createCanvas(1080, 1920);
  canvas.position(0,0);
  canvas.style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg
  
  
  frameRate(30); // no need to have 60.


  // specify multiple formats for different browsers
  // fingers = createVideo(['assets/fingers.mov', 'assets/fingers.webm']);
  fingers = createVideo(['https://dl.dropboxusercontent.com/s/rfsxxpqy8g0rh4l/VID_20201212_105031_01.mp4?dl=0']);
  
  //  fingers = createVideo(['https://dl.dropboxusercontent.com/s/rfsxxpqy8g0rh4l/VID_20201212_105031_01.mp4?dl=0'], vidLoad);

  
  fingers.hide(); // by default video shows up in separate dom REF: https://editor.p5js.org/p5/sketches/Dom:_Video_Canvas
  // button = createButton('play');
  // button.mousePressed(toggleVid); // attach button listener
  
  fingers.size(480, 800);
  
  // https://p5js.org/reference/#/p5/createVideo
  
  
  // GOOD STUFF: https://creative-coding.decontextualize.com/video/
  
}

function mousePressed() {
  fingers.loop(); // set the video to loop and start playing
}


function draw() {
	background(150);
    
	 image(fingers, 0, 300); // draw the video frame to canvas
     filter(GRAY); // video in gray color...
    
	
	/*
  // not working ...
     fingers.loadPixels();
  for (var y = 0; y < height; y += 10) {
    for (var x = 0; x < width; x += 5) {
      var offset = ((y*width)+x)*4;
      rect(x, y, 10,
        10 * (fingers.pixels[offset+1]/255));
    }
  }
   fingers.updatePixels();

 */	

image(fingers, 0, 350, 108, 192); // draw a second copy to canvas


	fill(255, 255, 255);
	textSize(32);
	text("12.12.2020 Score 17: 3,4,4,5,6", 50, 550);

}

// plays or pauses the video depending on current state
//function toggleVid() {
//  if (playing) {
//    fingers.pause();
//    button.html('play');
//  } else {
//    fingers.loop();
//   button.html('pause');
//}
//  playing = !playing;
//}


// This function is called when the video loads
function vidLoad() {
  fingers.loop();
  fingers.volume(0);
}


</script>