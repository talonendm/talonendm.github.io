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
cover-img: /assets/pics/page/screenshot/frisbeegolfMeikku200x.PNG
thumbnail-img: /assets/pics/thumbnail/instagram/IMG_20160717_112037.jpg
published: true
---

A group of friends went to play frisbee golf in a forest. One of them was really good at the game and had been practicing for months. He was determined to beat his friends and show off his skills.

As they started playing, the first few holes were easy and the frisbees flew straight into the baskets. But on the fifth hole, the skilled frisbee golfer's frisbee got stuck in a tree branch. He tried to get it down by throwing other frisbees at it, but nothing worked.

His friends teased him, saying, "Looks like the champion isn't so skilled after all!"

Feeling embarrassed, the frisbee golfer climbed up the tree to get his frisbee back. But he got stuck on a branch and couldn't come down. His friends laughed and took pictures of him, joking that he would have to spend the night in the tree.

Finally, a park ranger came by and saw the frisbee golfer stuck in the tree. He asked what happened and the friends explained. The ranger chuckled and said, "Don't worry, I'll get you down. But next time, bring a ladder instead of a frisbee!"


- [Kuinka perustaa frisbeegolfrata?](https://www.discgolfpark.com/fi/2020/11/06/kuinka-perustaa-frisbeegolfrata/)
- opinnäytetyö frisbeeradan suunnittelemisesta [PDF](https://www.theseus.fi/bitstream/handle/10024/136813/Frisbeegolfradan%20suunnitteleminen%20Evijarven%20kuntaan.pdf)
- Munapirttiin kaavaillaan uutta frisbeegolf-rataa Pyhtäällä, [YLE](https://yle.fi/a/3-11961134)
- Pelisäännöt ym. [liikuntamestari.fi](https://www.liikuntamestari.fi/tuote-osasto/frisbeegolf/)




# Kirkkonummi - Vols

[Kirkkonummen frisbeegolfrata](https://frisbeegolfradat.fi/rata/kirkkonummen_frisbeegolfrata/) 
- 6.6.2021: +25

# Saariselkä 

# Upsi - Saariselkä

- Tulos: **+29**, +36, +37, +41 (vuosi 2021: +36, +32)

1. 3-4 (par 3)
2. 4 (par 3)
3. 5 (par 3)
4. 4-8 (par 3)
5. 5-8 (par 3)
6. 4-5 (par 3)
7. 4-5 (par 3)
8. 4-6 (par 3)
9. 6-8 (par 3)
10. 7-10 (par 5)
11. 4-7 (par 4)
12. 4-5 (par 3)
13. 4-5 (par 3)
14. 4-5 (par 3)
15. 4-5 (par 3)
16. 4-5 (par 3)
17. 3-5 (par 3)
18. 4-5 (par 3)


# Muut

- [Hiittenharju](http://www.hvdg.fi/radat/hiittenharju-discgolfpark/): [Harjavalta Discgolf](http://www.hvdg.fi/)
- [Panelia](https://frisbeegolfradat.fi/rata/panelian_frisbeegolfrata/)


# Meilahti

![meilahti_scores_frisbee](/assets/pics/page/photo/frisbeegolfCapture.JPG){: .mx-auto.d-block :}

# Puolarmaari

## 2023

- +4
- +13


<div id="sketch-holder-jt-video"></div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.2/addons/p5.dom.min.js"></script> 

<script>

//dom // this probably needed if objects created in js
// cover-img: /assets/pics/cover/photo/cottage.JPG

window.addEventListener('keydown', function(e) {
  if(e.keyCode == 32 && e.target == document.body) {
    e.preventDefault();
  }
});


let playing = false;
let fingers;
let button;

let img2;

var looppi = true;


function setup() {
// <div id="sketch-holder-jt-video"></div>

  const canvas = createCanvas(960, 540);
  canvas.parent('sketch-holder-jt-video')
  // canvas = createCanvas(windowWidth, windowHeight);
  // canvas.position(0,0);
  // canvas.style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg
  
  
  // later: open points csv from dropbox
  // calculate avg:
  
  
  
  // frameRate(30); // no need to have 60.


  // specify multiple formats for different browsers
  // fingers = createVideo(['assets/fingers.mov', 'assets/fingers.webm']);
  // fingers = createVideo(['https://dl.dropboxusercontent.com/s/rfsxxpqy8g0rh4l/VID_20201212_105031_01.mp4?dl=0']);
  
  //  fingers = createVideo(['https://dl.dropboxusercontent.com/s/rfsxxpqy8g0rh4l/VID_20201212_105031_01.mp4?dl=0'], vidLoad);
  
  
  fingers = createVideo(['https://dl.dropboxusercontent.com/s/t0jgtwqiuh2ixyl/friba2.mp4?dl=0'], vidLoad); // autoplay func.

  
  fingers.hide(); // by default video shows up in separate dom REF: https://editor.p5js.org/p5/sketches/Dom:_Video_Canvas
  // button = createButton('play');
  // button.mousePressed(toggleVid); // attach button listener
  
   fingers.size(960, 540);
  
  
 // img2 = fingers.resize(108,192);
  
  // https://p5js.org/reference/#/p5/createVideo
  
  
  // GOOD STUFF: https://creative-coding.decontextualize.com/video/
  
}

function mousePressed() {
  // fingers.loop(); // set the video to loop and start playing
  
  looppi = !looppi;
  
}


function draw() {
	background(150);
	
	if (looppi) {
		fingers.loop(); // set the video to loop and start playing
	}	
    
	 image(fingers, 0, 0, windowWidth, windowHeight); // draw the video frame to canvas
     filter(GRAY); // video in gray color...
    
	
	//	/*
	// not working ...
	//   fingers.loadPixels();
	// for (var y = 0; y < height; y += 10) {
	// for (var x = 0; x < width; x += 5) {
	//   var offset = ((y*width)+x)*4;
	//   rect(x, y, 10,
	//     10 * (fingers.pixels[offset+1]/255));
	// }
	//  }
	//  fingers.updatePixels();

	//*/	

	//image(fingers, 0, 450, 108,192); // draw a second copy to canvas


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