// add text to image: e.g. copyright symbol and name - use for photos
let img; // Declare variable 'img'.
// .................................
function preload() {
	img = loadImage('pics/thumbnail/photo/auringonkukka.JPG'); // Load the image
}
// .................................
function setup() {
  createCanvas(400, 400);
  
  
  textAlign(RIGHT,BOTTOM);
  // https://p5js.org/reference/#/p5/noLoop
  noLoop();
  
  
}
// .................................
function draw() {
  // source: https://p5js.org/examples/image-load-and-display-image.html
  // Displays the image at its actual size at point (0,0)
  
  
  
  image(img, 0, 0);
  text("\u00A9talonen.dm", width-5, height-3); // https://stackoverflow.com/questions/8095624/how-to-add-copyright-symbol-in-a-highcharts-title
  // Displays the image at point (0, height/2) at half size
  //image(img, 0, height / 2, img.width / 2, img.height / 2);
  
  saveCanvas('auringonkukka', 'jpg');
}
// .................................