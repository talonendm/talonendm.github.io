---
layout: page
title: Hello World!
subtitle: World is made for learning new stuff
published: true
---

My name is Jaakko Talonen and I am living data driven life. During this dark, rainy and COVID-19 end of the year there has been plenty of time for free time coding. 
My objective is to do something that could "wake up" my children interest on coding. That's why I am mostly creating some "silly" games and publishing some old stuff.. 

[Opinions Are My Own](https://www.insidehighered.com/blogs/technology-and-learning/do-we-still-need-opinions-are-my-own-social-media-disclaimer) (or cloned / forked somewhere) at talonen.dm github pages!

*Generally*

- I rock data
- I'm passionated and extremely loyal to everything that is based on data but having critical mindset

What else do you need?

- Don't hesitate to contact me via email, twitter or what ever..

<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/addons/p5.dom.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.4/addons/p5.sound.min.js"></script>


<script>

// -------------------------------------------------------------------------------
//  no place holder: background: <div id="sketch-holder-jt-karate"></div>
// 
var canvas;
var loop_i=0;
var moving = 0; // mouseX movement
var mic;
let img;
var micstart = false;

var imgs = [];
// ....................................................................
function preload() { 
  // img = loadImage('pics/red-karate/karate-000328.png'); 
  // Access to fetch at 'pics/red-karate/karate-000328.png' from origin 'https://talonendm.github.io' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
  img = loadImage('pics/karate-000328.png');
  
  var ii = -1;
  for (var i=219; i<338; i++) {
	ii = ii + 1;
    imgs[ii] = loadImage("pics/karate-000"+i+".png"); // https://editor.p5js.org/lmccart/sketches/S1UtI-Kgb
  }
} 
// ....................................................................
function setup() {
  // canvas = createCanvas(windowWidth, windowHeight); // full screen
    
  canvas = createCanvas(1000, 1000); // we want size of image or a bit more
  // canvas.parent('sketch-holder-jt-karate');
  canvas.position(0,0);
  canvas.style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg
  // mic = new p5.AudioIn();
  // mic.start();
  
}
// ....................................................................
function draw() {
  // var vol = mic.getLevel();
  // image(img, 10, 10);
  // ellipse(300,200,vol* 40 + 20,30);

  moving = abs(pmouseX - mouseX);
  
  if (moving>2 | mouseIsPressed) {
     loop_i = (loop_i + 1) % (120 - 1); // https://editor.p5js.org/kjhollentoo/sketches/Syf-33fJg
	 image(imgs[loop_i], 0, 0); 
  }
  
  
  
  if (mouseIsPressed) {
	line(pmouseX, pmouseY, mouseX, mouseY);
	
	
	
	
	if (getAudioContext().state !== 'running') {
		getAudioContext().resume();
		mic = new p5.AudioIn();
		mic.start();
	
		console.log("resumed sound");
	    
		micstart = true;
		
	}
	
	
  }
  
  if (getAudioContext().state == 'running') {
	fill(100,100,100,30);
	// and if it running then ellipses
	var level = mic.getLevel();
	ellipse(mouseX, mouseY, level * 500, level * 500);
  }
  
  fill(0,255,0);
  rect(40, 40, 52, 55);
  fill(0,0,255);
  text(loop_i + ": " + moving, 50,52);
}
// ....................................................................
// Errors messages (CTRL SHIFT i) Chrome Developer Tools:
// The AudioContext was not allowed to start. It must be resumed (or created) after a user gesture on the page. https://goo.gl/7K7WLu
// DevTools failed to load SourceMap: Could not load content for https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js.map: HTTP error: status code 404, net::ERR_HTTP_RESPONSE_CODE_FAILURE
function touchStarted() {
  if (getAudioContext().state !== 'running') {
    getAudioContext().resume();
	mic = new p5.AudioIn();
    mic.start();
  }
}
// ....................................................................

</script> 