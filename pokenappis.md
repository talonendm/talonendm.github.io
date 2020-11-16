---
layout: page
title: p5.js pokenappis
use-site-title: true
---


<div id="sketch-holder"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.6.1/p5.min.js"></script>
<script src="/p5/test.js"></script>






Here another:

<div id="sketch-holder-jt"></div>
<script>
function setup() {
  let d = 170;
  let p1 = d;
  let p2 = p1 + d;
  let p3 = p2 + d;
  let p4 = p3 + d;

  // Sets the screen to be 720 pixels wide and 400 pixels high
  const canvas = createCanvas(720, 400);
  canvas.parent('sketch-holder-jt')
  background(0);
  noSmooth();

  translate(140, 0);

  // Draw gray box
  stroke(053);
  line(p3, p3, p2, p3);
  line(p2, p3, p2, p2);
  line(p2, p2, p3, p2);
  line(p3, p2, p3, p3);

  // Draw white points
  stroke(255);
  point(p1, p1);
  point(p1, p3);
  point(p2, p4);
  point(p3, p1);
  point(p4, p2);
  point(p4, p4);
}

</script>


```javascript
<div id="sketch-holder"></div>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.dom.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.sound.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/sketch.js" type="text/javascript"></script>
```

not working 
see last [comment](https://stackoverflow.com/questions/53267193/p5js-with-jekyll)
[md example](https://raw.githubusercontent.com/KevinWorkman/HappyCoding/gh-pages/examples/p5js/_posts/2018-07-04-fireworks.md)