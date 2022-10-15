// WEBGL experiments
// source: // https://github.com/CodingTrain/website/tree/main/Tutorials/P5JS/18_p5.js_webgl
// 01/2022


var timerValue = 0;

let angle = 0;

let angleX = 0;
let angleY = 0;
let angleZ = 0;

let vangleX = 0;
let vangleY = 0;
let vangleZ = 0;

let start_z = 700;
let end_z = 40;

let xOff = 0;
let yOff = 1;
let zOff = 2;


let z_gravity = 3;

let stop_vz = 10;

let dice_size = 70;
let distance_dice = 100;

var noppia = 3;
let max_noppia = 9;

let plane_y_size = 300;
var firstgame = true;


let distance_dice_number_text = plane_y_size / (max_noppia + 1);

var all_on_table = false

let friction = 0.9999;
let friction_table = 0.74;
let kimpoaminen = 0.666;
let throw_dices_distance = 5;

let random_speed = 10;

var select_example = 0;
var all_rounded = false;

let myFont;

let usecam = false;
let useobj = false;

let img;
let imgs = [];
let cam;

let kitten;
let graphics;
let dicesumtext;


var nopat = [];

function preload() {
	imgs[0] = loadImage('pics/j1.jpg');
	imgs[1] = loadImage('pics/j2.jpg');
	imgs[2] = loadImage('pics/j3.jpg');
	imgs[3] = loadImage('pics/j4.jpg');
	imgs[4] = loadImage('pics/j5.jpg');
	imgs[5] = loadImage('pics/j6.jpg');
	myFont = loadFont('assets/Pokemon Solid.ttf');

}


function deviceShaken() {
	// https://p5js.org/reference/#/p5/setShakeThreshold




}

function setup() {
	// cnv = createCanvas(windowWidth, windowHeight, WEBGL);

	createCanvas(windowWidth, windowHeight, WEBGL);

	// style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg



	// textFont('Avenir');
	textFont(myFont);

	textSize(60);
	// cnv = createCanvas(windowHeight - 20, windowHeight - 20);
	// centerCanvas();
	// colorMode(HSB, 360, 100, 100);
	// rectMode(CENTER);

	dicesumtext = createGraphics(plane_y_size, plane_y_size);
	dicesumtext.background(0, 0, 0);
	//dicesumtext.fill(255);
	dicesumtext.textAlign(CENTER);
	//dicesumtext.textSize(48);


	// setInterval(timeIt, 100); // https://editor.p5js.org/denaplesk2/sketches/ryIBFP_lG

	// mic = new p5.AudioIn();
	// mic.start();
	// imageMode(CENTER);
	// noStroke();

	nollaus();

	angleMode(DEGREES);


	// print(train);

	let threshold_shake = 10; // 30 default
	setShakeThreshold(threshold_shake);




	// https://stackoverflow.com/questions/68242398/how-to-return-the-camera-position-in-p5js
	camera = createCamera();
	// optionally, call camera() on the instance with the same arguments as the global function
	// camera.camera([x], [y], [z], [centerX], [centerY], [centerZ], [upX], [upY], [upZ])



	camera.lookAt(100, 10, -40);
	camera.setPosition(sin(0 / 600) * 200 + 400, 200, 800);

	print(camera.X);
	print(camera.Y);
	print(camera.z);

	print(camera.centerX);
	print(camera.centerY);
	print(camera.centerZ);

	print(camera.eyeZ);

}







function nollaus() {




}




// auto indect in vscode: shift-alt-f  (and ctrl k f)

function draw() {
	orbitControl();
	background(25);

	dicesumtext.background(0);



	let rotateDirection = 'clockwise';

	// Simple range conversion to make things simpler.
	// This is not absolutely necessary but the logic
	// will be different in that case.

	let rX = rotationX + 180;
	let pRX = pRotationX + 180;

	if ((rX - pRX > 0 && rX - pRX < 270) || rX - pRX < -270) {
		rotateDirection = 'clockwise';
		xOff += 0.1;
	} else if (rX - pRX < 0 || rX - pRX > 270) {
		rotateDirection = 'counter-clockwise';
		xOff -= 0.1;
	}

	print(rotateDirection);



	let rY = rotationY + 180;
	let pRY = pRotationY + 180;

	yOff += (rY - pRY) / 60;

	text(yOff, 0, 0);

	zOff += 0.000;


	// noStroke();
	noFill();
	stroke(0, 255, 0);
	translate(noise(xOff) * 100, noise(yOff) * height * 0.01, -noise(zOff) * 600);
	rotateY(millis() / 10000);
	sphere(300);


}



function touchStarted() {
	let fs = fullscreen();
	if (!fs) {
		fullscreen(true);
	}


	print("kosketus");
	// if (getAudioContext().state !== 'running') {
	// 	getAudioContext().resume();
	// 	mic = new p5.AudioIn();
	// 	mic.start();
	// 	soundrestarted = soundrestarted + 1;
	// }
}

function centerCanvas() {
	// var x = (windowWidth - width) / 2;
	// var y = (windowHeight - height) / 2;
	resizeCanvas(windowWidth, windowHeight);
	// cnv.position(x, y);
	// cnv.position(0, 0);
	// cnv.style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg
}

/* full screening will change the size of the canvas */
function windowResized() {
	// resizeCanvas(windowWidth, windowHeight);
	// https://github.com/processing/p5.js/wiki/Positioning-your-canvas
	centerCanvas();
}

