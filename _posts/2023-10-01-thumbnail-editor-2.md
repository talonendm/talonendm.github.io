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

<style>

.thumbnail-editor-wrapper {
  background: linear-gradient(180deg, #1b1b1b 0%, #101010 100%);
  border-radius: 24px;
  padding: 1.5rem;
  margin: 2rem 0;
  box-shadow: 0 10px 40px rgba(0,0,0,0.35);
  color: #f1f1f1;
}

.thumbnail-editor-header {
  margin-bottom: 1rem;
}

.thumbnail-editor-header h1 {
  margin: 0;
  font-size: 2.2rem;
}

.thumbnail-editor-header p {
  opacity: 0.7;
}

.toolbar {
  display: flex;
  flex-wrap: wrap;
  gap: 0.6rem;
  margin-bottom: 1rem;
  align-items: center;
}

.toolbar button,
.toolbar select,
.toolbar input {
  background: #222;
  color: white;
  border: 1px solid #444;
  padding: 0.7rem 1rem;
  border-radius: 12px;
  font-size: 0.95rem;
}

.toolbar button {
  cursor: pointer;
}

.toolbar button:hover {
  background: #333;
}

.toolbar label {
  font-size: 0.85rem;
  opacity: 0.7;
}

.toolbar-group {
  display: flex;
  gap: 0.4rem;
  align-items: center;
  background: rgba(255,255,255,0.03);
  padding: 0.4rem;
  border-radius: 14px;
}

#dropzone {
  border: 2px dashed #555;
  border-radius: 18px;
  padding: 1rem;
  text-align: center;
  margin-bottom: 1rem;
  background: rgba(255,255,255,0.03);
}

#dropzone.dragover {
  border-color: white;
}

#sketch-holder-jt-xml {
  display: flex;
  justify-content: center;
  align-items: center;
  background:
    linear-gradient(45deg, #1a1a1a 25%, transparent 25%),
    linear-gradient(-45deg, #1a1a1a 25%, transparent 25%),
    linear-gradient(45deg, transparent 75%, #1a1a1a 75%),
    linear-gradient(-45deg, transparent 75%, #1a1a1a 75%);
  background-size: 24px 24px;
  background-position: 0 0, 0 12px, 12px -12px, -12px 0px;
  border-radius: 18px;
  overflow: hidden;
  min-height: 400px;
}

canvas {
  max-width: 100%;
  height: auto;
  border-radius: 12px;
}

.statusbar {
  margin-top: 1rem;
  opacity: 0.8;
  font-size: 0.92rem;
  line-height: 1.6;
}

.help-panel {
  margin-top: 1.5rem;
  background: rgba(255,255,255,0.03);
  border-radius: 14px;
  padding: 1rem;
}

.help-panel summary {
  cursor: pointer;
  font-weight: bold;
}

kbd {
  background: #222;
  border: 1px solid #444;
  border-radius: 6px;
  padding: 0.2rem 0.45rem;
  font-size: 0.85rem;
}

.toast {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #111;
  color: white;
  padding: 1rem 1.2rem;
  border-radius: 12px;
  z-index: 9999;
}

</style>

<div class="thumbnail-editor-wrapper">

<div class="thumbnail-editor-header">
<h1>Thumbnail Editor</h1>
<p>Create thumbnails for YouTube, blogs, Instagram and social media.</p>
</div>

<div id="dropzone">
Drop image here or use upload
</div>

<div class="toolbar">

<div class="toolbar-group">
<input type="file" id="imageLoader" accept="image/*">
</div>

<div class="toolbar-group">
<button onclick="zoomOut()">−</button>
<button onclick="zoomIn()">+</button>
</div>

<div class="toolbar-group">

<button onclick="rotateLeft()">↺</button>
<button onclick="rotateRight()">↻</button>

<label>step</label>

<input
  type="number"
  id="rotateStep"
  value="0.05"
  step="0.01"
  min="0.01"
  style="width:80px;"
>

</div>

<div class="toolbar-group">

<select id="canvasPreset" onchange="changePreset(this.value)">

<option value="1">384 × 384</option>
<option value="2">640 × 384</option>
<option value="3">384 × 640</option>
<option value="4" selected>640 × 640</option>
<option value="5">1024 × 384</option>
<option value="6">1024 × 1024</option>
<option value="7">1080 × 1080</option>
<option value="8">768 × 432</option>
<option value="9">3840 × 2160 Full</option>

</select>

</div>

<div class="toolbar-group">

<label>filename</label>

<input
  type="text"
  id="filenameBase"
  value="e640x640"
  style="width:140px;"
>

<button onclick="decreaseNumber()">−</button>

<input
  type="number"
  id="imageNumber"
  value="1"
  min="0"
  style="width:80px;"
>

<button onclick="increaseNumber()">+</button>

</div>

<div class="toolbar-group">

<label>watermark</label>

<input
  type="text"
  id="watermarkText"
  value=""
  placeholder="optional"
  style="width:160px;"
>

<label>size</label>

<input
  type="number"
  id="watermarkSize"
  value="14"
  min="6"
  max="80"
  style="width:70px;"
>

</div>

<div class="toolbar-group">

<button onclick="saveImage()">Save JPG</button>

</div>

</div>

<div id="sketch-holder-jt-xml"></div>

<div class="statusbar" id="statusbar">
No image loaded
</div>

<details class="help-panel">
<summary>Keyboard Shortcuts</summary>

<ul>
<li><kbd>Z</kbd> Zoom out</li>
<li><kbd>X</kbd> Zoom in</li>
<li><kbd>C</kbd> Rotate left</li>
<li><kbd>V</kbd> Rotate right</li>
<li><kbd>S</kbd> Save image</li>
<li><kbd>+</kbd> Image number +1</li>
<li><kbd>-</kbd> Image number -1</li>
<li><kbd>Drag Mouse</kbd> Move image</li>
</ul>

</details>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>

<script>

let img;

let z = 1;
let x = 0;
let y = 0;
let a = 0;

let iw = 640;
let ih = 640;

let canvas;

function setup() {

  canvas = createCanvas(iw, ih);

  canvas.parent('sketch-holder-jt-xml');

  frameRate(30);

  setupDropzone();
}

function draw() {

  background(80);

  if (img) {

    push();

    translate(width / 2 + x, height / 2 + y);

    rotate(a);

    imageMode(CENTER);

    image(
      img,
      0,
      0,
      img.width * z,
      img.height * z
    );

    pop();
  }

  drawWatermark();

  updateStatus();
}

function drawWatermark() {

  let watermark =
    document.getElementById("watermarkText").value;

  if (!watermark || watermark.trim() === "") return;

  let size =
    parseInt(
      document.getElementById("watermarkSize").value
    );

  textSize(size);

  textAlign(RIGHT, BOTTOM);

  fill(20);

  text(
    watermark,
    width - 11,
    height - 11
  );

  fill(255, 180);

  text(
    watermark,
    width - 10,
    height - 10
  );
}

function updateStatus() {

  const status = document.getElementById("statusbar");

  let saveName = getSaveFilename();

  status.innerHTML =
    "Canvas: " + iw + " × " + ih + " px" +
    "<br>" +
    "Zoom: " + round(z * 100) + "%" +
    " • Rotation: " + nf(degrees(a),1,1) + "°" +
    "<br>" +
    "Save file: <b>" + saveName + "</b>";
}

function getSaveFilename() {

  let base =
    document.getElementById("filenameBase").value;

  let num =
    parseInt(
      document.getElementById("imageNumber").value
    );

  let padded =
    String(num).padStart(4, '0');

  return base + "_" + padded + ".jpg";
}

function increaseNumber() {

  let el =
    document.getElementById("imageNumber");

  el.value =
    parseInt(el.value) + 1;
}

function decreaseNumber() {

  let el =
    document.getElementById("imageNumber");

  el.value =
    Math.max(
      0,
      parseInt(el.value) - 1
    );
}

function getRotateStep() {

  return parseFloat(
    document.getElementById("rotateStep").value
  );
}

function rotateLeft() {

  a -= getRotateStep();
}

function rotateRight() {

  a += getRotateStep();
}

function zoomIn() {

  z += 0.05;
}

function zoomOut() {

  z -= 0.05;

  if (z < 0.05) z = 0.05;
}

function mouseDragged() {

  x += movedX;
  y += movedY;
}

function saveImage() {

  let filename = getSaveFilename();

  saveCanvas(
    filename.replace(".jpg", ""),
    "jpg"
  );

  showToast("Saved " + filename);
}

function handleFile(file) {

  if (file.type === 'image') {

    loadImage(file.data, loaded => {

      img = loaded;

      x = 0;
      y = 0;
      z = 1;
      a = 0;

      showToast("Image loaded");
    });
  }
}

document
.getElementById('imageLoader')
.addEventListener('change', function(e) {

  const file = e.target.files[0];

  if (!file) return;

  const reader = new FileReader();

  reader.onload = function(event) {

    handleFile({
      type: 'image',
      data: event.target.result
    });
  };

  reader.readAsDataURL(file);
});

function setupDropzone() {

  const dropzone =
    document.getElementById("dropzone");

  dropzone.addEventListener("dragover", e => {

    e.preventDefault();

    dropzone.classList.add("dragover");
  });

  dropzone.addEventListener("dragleave", () => {

    dropzone.classList.remove("dragover");
  });

  dropzone.addEventListener("drop", e => {

    e.preventDefault();

    dropzone.classList.remove("dragover");

    const file =
      e.dataTransfer.files[0];

    if (!file) return;

    const reader = new FileReader();

    reader.onload = function(event) {

      handleFile({
        type: 'image',
        data: event.target.result
      });
    };

    reader.readAsDataURL(file);
  });
}

function changePreset(value) {

  if (value == 1) {

    iw = 384;
    ih = 384;

  } else if (value == 2) {

    iw = 640;
    ih = 384;

  } else if (value == 3) {

    iw = 384;
    ih = 640;

  } else if (value == 4) {

    iw = 640;
    ih = 640;

  } else if (value == 5) {

    iw = 1024;
    ih = 384;

  } else if (value == 6) {

    iw = 1024;
    ih = 1024;

  } else if (value == 7) {

    iw = 1080;
    ih = 1080;

  } else if (value == 8) {

    iw = 3840 / 5;
    ih = 2160 / 5;

  } else {

    iw = 3840;
    ih = 2160;
  }

  resizeCanvas(iw, ih);

  document.getElementById("filenameBase").value =
    "e" + iw + "x" + ih;

  showToast(
    "Canvas changed to " +
    iw + "×" + ih
  );
}

function showToast(message) {

  const toast =
    document.createElement("div");

  toast.className = "toast";

  toast.innerText = message;

  document.body.appendChild(toast);

  setTimeout(() => {

    toast.remove();

  }, 2000);
}

function keyPressed() {

  if (key === 'z') zoomOut();

  if (key === 'x') zoomIn();

  if (key === 'c') rotateLeft();

  if (key === 'v') rotateRight();

  if (key === 's') saveImage();

  if (key === '+') increaseNumber();

  if (key === '-') decreaseNumber();
}

</script>